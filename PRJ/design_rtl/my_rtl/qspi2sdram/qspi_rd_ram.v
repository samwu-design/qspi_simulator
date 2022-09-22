// +FHDR------------------------------------------------------------
//                 Copyright (c) 2022 $COMPANY .
//                       ALL RIGHTS RESERVED
// -----------------------------------------------------------------
// Filename      : qspi_rd_ram.v
// Author        : wusha 
// Created On    : 2022-06-17 17:26
// Last Modified : 
// -----------------------------------------------------------------
// Description:
//           version1.0  only surport Fast Read(0Bh)
//
// -FHDR------------------------------------------------------------


module qspi_rd_ram(
	input   		qspi_clk,
	input   		rst_n,
      input                   debug_clk,
	// qspi
	input  			qspi_csn,
	input  			qspi_di,
	output 			qspi_do,
	input  			qspi_wpn,
	input  			qspi_holdn,

	output 	[1:0]		qspi_cmd_flag,
	output reg [23:0]       qspi_rd_addr,
	output            	qspi_rd_req,
	input             	qspi_rd_busy,

	output           forbiden_autofresh,
	// ram 
	output                  ram_ren,
	output  [2:0]           ram_raddr,
	input   [15:0]          ram_rdata

);


parameter CMD_FAST_READ = 8'h0b;
parameter CMD_READ = 8'h03;
parameter CMD_WR_EN = 8'h06;
parameter CMD_PG_256B = 8'h02;
parameter CMD_BLKERASE64K = 8'hD8;


localparam   S_QSPI_CMD 	= 3'd0;
localparam   S_QSPI_PREADDR 	= 3'd1;
localparam   S_QSPI_PREIDX 	= 3'd2;
localparam   S_QSPI_DUMMY 	= 3'd3;
localparam   S_QSPI_DATA 	= 3'd4;


localparam   S_QSPI_END 	= 3'd5;


wire cmd_fstrd_0bh;
wire cmd_rd_03h;
reg cmd_fstrd_0bh_flag;
reg cmd_rd_03h_flag;

wire dummy_end;
wire byte_end;
wire read_end;

wire preidx_ready,preidx_end,preaddr_end,pre_rd_req;

assign qspi_cmd_flag = {cmd_fstrd_0bh_flag,cmd_rd_03h_flag};

//----------------------get data in
reg  [31:0] in_dat; 
wire [31:0] cur_value;

assign cur_value = {in_dat[30:0],qspi_di};

always@(posedge qspi_clk or negedge rst_n)begin
	if(!rst_n)begin
		in_dat <= 32'd0;
	end
	else begin
		in_dat <= {in_dat[30:0],qspi_di};
	end
end

reg forbiden_autofresh;
always@(posedge qspi_clk or negedge rst_n) begin
	if(!rst_n)
	   forbiden_autofresh <= 0;
	else if(en_forbiden_autofresh)
	   forbiden_autofresh <= 1;
	else if(preidx_end)
	   forbiden_autofresh <= 0;
	else
	   forbiden_autofresh <= forbiden_autofresh;
end




//---------------------------------------------
//	QSPI FSM  read timing
//--------------------------------------------
// qspi timing
//
reg [4:0]  qspi_state;

always@(posedge qspi_clk or negedge rst_n)begin
	if(!rst_n)begin
		qspi_state <= S_QSPI_CMD;
	end
	else begin
		case(qspi_state)
			S_QSPI_CMD:begin
				if(cmd_fstrd_0bh || cmd_rd_03h)
					qspi_state <= S_QSPI_PREADDR;
				else
					qspi_state <= S_QSPI_CMD;
			end
			
			S_QSPI_PREADDR:begin
				if(preaddr_end)
					qspi_state <= S_QSPI_PREIDX;
				else
					qspi_state <= S_QSPI_PREADDR;
			end

			S_QSPI_PREIDX:begin
				if(preidx_end)
					if(cmd_rd_03h_flag)
						qspi_state <= S_QSPI_DATA;
					else if(cmd_fstrd_0bh_flag)
						qspi_state <= S_QSPI_DUMMY;
				else
					qspi_state <= S_QSPI_PREIDX;
			end

			S_QSPI_DUMMY:begin
				if(dummy_end)
					qspi_state <= S_QSPI_DATA;
				else
					qspi_state <= S_QSPI_DUMMY;
			end

			S_QSPI_DATA:begin
				if(byte_end)begin
					if(read_end)
						//qspi_state <= S_QSPI_END;
						qspi_state <= S_QSPI_CMD;
					else
						qspi_state <= S_QSPI_DATA;
				end
					
			end
		
			S_QSPI_END:begin
				qspi_state <= S_QSPI_CMD;
			end

			default: qspi_state <= S_QSPI_CMD;

		endcase
	end
end

// check fast read cmmond

assign cmd_fstrd_0bh 	= (qspi_state == S_QSPI_CMD && cur_value[7:0] == CMD_FAST_READ) ? 1:0;
assign cmd_rd_03h 	= (qspi_state == S_QSPI_CMD && cur_value[7:0] == CMD_READ) ? 1:0;
assign cmd_pg_02h 	= (qspi_state == S_QSPI_CMD && cur_value[7:0] == CMD_PG_256B) ? 1:0;
assign cmd_we_06h 	= (qspi_state == S_QSPI_CMD && cur_value[7:0] == CMD_WR_EN) ? 1:0;
assign cmd_blkerase_d8h 	= (qspi_state == S_QSPI_CMD && cur_value[7:0] == CMD_BLKERASE64K) ? 1:0;



always@(posedge qspi_clk or negedge rst_n)begin
	if(!rst_n)begin
		cmd_fstrd_0bh_flag <= 0;
	end
	else if(qspi_state == S_QSPI_CMD && cur_value[7:0] == CMD_FAST_READ) begin
		cmd_fstrd_0bh_flag <= 1;
	end 
	//else if(qspi_state == S_QSPI_END) begin //read_end
	else if(read_end) begin
		cmd_fstrd_0bh_flag <= 0;
	end
	else
		cmd_fstrd_0bh_flag <= cmd_fstrd_0bh_flag;

end
always@(posedge qspi_clk or negedge rst_n)begin
	if(!rst_n)begin
		cmd_rd_03h_flag <= 0;
	end
	else if(qspi_state == S_QSPI_CMD && cur_value[7:0] == CMD_READ) begin
		cmd_rd_03h_flag <= 1;
	end 
	//else if(qspi_state == S_QSPI_END) begin
	else if(read_end) begin
		cmd_rd_03h_flag <= 0;
	end
	else
		cmd_rd_03h_flag <= cmd_rd_03h_flag;

end


//--------------------------------- bit count
reg [15:0]  bit_cnt;
reg [2:0]   byte_cnt;
always@(posedge qspi_clk or negedge rst_n)begin
	if(!rst_n)begin
		bit_cnt <= 0;
	end
	else if(cmd_fstrd_0bh || cmd_rd_03h || dummy_end || byte_end || preaddr_end || preidx_end)begin
		bit_cnt <= 0;
	end
	else begin
		bit_cnt <= bit_cnt + 16'd1;
	end
end

always@(posedge qspi_clk or negedge rst_n)begin
	if(!rst_n)
		byte_cnt <= 3'd0;
	else if(read_end && byte_end)                 //  read end 
		byte_cnt <= 3'd0;
	else if(byte_end) 
		byte_cnt <= byte_cnt + 3'd1;
	else
		byte_cnt <= byte_cnt;


end

reg [3:0]  qspi_pre_idx;

//  CMD register

//-------------------------------------------  rd addr
always@(posedge qspi_clk or negedge rst_n)begin
	if(!rst_n)begin
		qspi_rd_addr <= 24'd0;
	end
	else if(preaddr_end) begin
		qspi_rd_addr <= {cur_value[19:0],4'b0000};
	end
	else
		qspi_rd_addr <= qspi_rd_addr;
end

reg qspi_rd_req;
always@(posedge qspi_clk or negedge rst_n)begin
   if(!rst_n)
	   qspi_rd_req <= 1'b0;
   else if(preaddr_end)	
		qspi_rd_req <= 1'b1;
	else
		qspi_rd_req <= 1'd0;
end


always@(posedge qspi_clk or negedge rst_n)begin
	if(!rst_n)begin
		qspi_pre_idx <= 4'd0;
	end
	else if(preidx_ready) begin
		qspi_pre_idx <= {1'b0,cur_value[2:0]};
	end
	else
		qspi_pre_idx <= qspi_pre_idx;
end




assign dummy_end	= (bit_cnt == 16'd7) && qspi_state == S_QSPI_DUMMY;
assign byte_end 	= (bit_cnt == 16'd7) && qspi_state == S_QSPI_DATA;
assign byte_end_pre 	= (bit_cnt == 16'd6) && qspi_state == S_QSPI_DATA;

assign read_end		= byte_end && (byte_cnt == 3'd3) && qspi_state == S_QSPI_DATA; // only surpport 32bits one commond 
assign preaddr_end	= (bit_cnt == 16'd19) && qspi_state == S_QSPI_PREADDR; 
assign preidx_end	= (bit_cnt == 16'd3) && qspi_state == S_QSPI_PREIDX;
assign pre_rd_req	= (bit_cnt == 16'd0) && qspi_state == S_QSPI_PREIDX;
assign preidx_ready	= (bit_cnt == 16'd2) && qspi_state == S_QSPI_PREIDX;

assign en_forbiden_autofresh = (bit_cnt == 16'd16) && qspi_state == S_QSPI_PREADDR;

//ram read
//assign ram_ren = preidx_end || (byte_end && byte_cnt[1:0] == 2'b01);
//assign ram_raddr = (qspi_state == S_QSPI_DATA) ? (qspi_pre_idx[2:0] + 3'd1) : qspi_pre_idx[2:0];

reg ram_ren;
always@(posedge qspi_clk or negedge rst_n)begin
   if(!rst_n)
	      ram_ren <= 0;
	else if(preidx_ready || (byte_end_pre && byte_cnt[1:0] == 2'b01))
		   ram_ren <= 1;	
	else
	      ram_ren <= 0;
end

reg[2:0] ram_raddr;
always@(*)begin
   if(preidx_end)
		ram_raddr = qspi_pre_idx[2:0];
	else if(byte_end && byte_cnt[1:0] == 2'b01)
	   ram_raddr = qspi_pre_idx[2:0] + 3'd1;
end



reg [15:0] do_data;

//always@(posedge qspi_clk or negedge rst_n)begin
always@(negedge qspi_clk or negedge rst_n)begin
	if(!rst_n)begin
		do_data <= 16'd0;
	end
	else if(ram_ren) begin
		do_data <= {ram_rdata[7:0],ram_rdata[15:8]};
		//do_data <= ram_rdata;
	end
	else begin
		do_data <= {do_data[14:0],1'b0};
	end
end

reg qspi_do;
//wire qspi_do;
always@(negedge qspi_clk or negedge rst_n)begin
	if(!rst_n)
		qspi_do <= 1'bz;
	else if(qspi_state == S_QSPI_DATA)
		qspi_do <= do_data[15];
	else
		qspi_do <= 1'bz;
end
//assign qspi_do = (qspi_state == S_QSPI_DATA || qspi_state_nxt == S_QSPI_DATA) ? do_data[15]:1'bz;

// DEBUG
//
`ifdef DEBUG_ILA
wire[35:0] CONTROL;
wire[64:0] trig0;
	
assign trig0 = {
               preaddr_end,ram_ren,ram_rdata,
               qspi_rd_addr,qspi_rd_req,
               qspi_clk,
					cmd_pg_02h,cmd_rd_03h,cmd_we_06h,cmd_fstrd_0bh,cmd_blkerase_d8h,
					qspi_di,qspi_do,
					qspi_pre_idx,preidx_ready,cur_value[3:0],
					qspi_state
					};	

chipscope_icon icon_inst(
    .CONTROL0  (CONTROL)
);	
	
chipscope_ila_5  db_ila_inst(
    .CONTROL	(CONTROL),
    .CLK			(debug_clk),//20mhz sample 10mhz
    .TRIG0		(trig0)
	 );
 `endif

endmodule

