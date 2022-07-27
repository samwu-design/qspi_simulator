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

	// ram 
	output                  ram_ren,
	output  [2:0]           ram_raddr,
	input   [15:0]          ram_rdata

);


parameter CMD_FAST_READ = 8'h0b;
parameter CMD_READ = 8'h03;


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
						qspi_state <= S_QSPI_END;
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


reg [4:0]  qspi_state_nxt;
always@(negedge qspi_clk or negedge rst_n)begin
		case(qspi_state_nxt)
			S_QSPI_CMD:begin
				if(cmd_fstrd_0bh || cmd_rd_03h)
					qspi_state_nxt = S_QSPI_PREADDR;
				else
					qspi_state_nxt = S_QSPI_CMD;
			end
			
			S_QSPI_PREADDR:begin
				if(preaddr_end)
					qspi_state_nxt = S_QSPI_PREIDX;
				else
					qspi_state_nxt = S_QSPI_PREADDR;
			end

			S_QSPI_PREIDX:begin
				if(preidx_end)
					if(cmd_rd_03h_flag)
						qspi_state_nxt = S_QSPI_DATA;
					else if(cmd_fstrd_0bh_flag)
						qspi_state_nxt = S_QSPI_DUMMY;
				else
					qspi_state_nxt = S_QSPI_PREIDX;
			end

			S_QSPI_DUMMY:begin
				if(dummy_end)
					qspi_state_nxt = S_QSPI_DATA;
				else
					qspi_state_nxt = S_QSPI_DUMMY;
			end

			S_QSPI_DATA:begin
				if(byte_end)begin
					if(read_end)
						qspi_state_nxt = S_QSPI_END;
					else
						qspi_state_nxt = S_QSPI_DATA;
				end
					
			end
		
			S_QSPI_END:begin
				qspi_state_nxt = S_QSPI_CMD;
			end

			default: qspi_state_nxt = S_QSPI_CMD;

		endcase
end



// check fast read cmmond

assign cmd_fstrd_0bh 	= (qspi_state == S_QSPI_CMD && cur_value[7:0] == CMD_FAST_READ) ? 1:0;
assign cmd_rd_03h 	= (qspi_state == S_QSPI_CMD && cur_value[7:0] == CMD_READ) ? 1:0;

always@(posedge qspi_clk or negedge rst_n)begin
	if(!rst_n)begin
		cmd_fstrd_0bh_flag <= 0;
	end
	else if(qspi_state == S_QSPI_CMD && cur_value[7:0] == CMD_FAST_READ) begin
		cmd_fstrd_0bh_flag <= 1;
	end 
	else if(qspi_state == S_QSPI_END) begin
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
	else if(qspi_state == S_QSPI_END) begin
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
	else if(read_end && byte_end)                 //  read end жϵģ濴߼Ⱥ
		byte_cnt <= 3'd0;
	else if(byte_end) 
		byte_cnt <= byte_cnt + 3'd1;
	else
		byte_cnt <= byte_cnt;


end

//  CMD register
reg [7:0]  cur_rd_preaddr,last_rd_preaddr;
reg [3:0]  qspi_pre_idx;

always@(posedge qspi_clk or negedge rst_n)begin
	if(!rst_n)begin
		cur_rd_preaddr <= 24'hff_ffff;                   //ʼֵ趨Ϊ˱һεĵַж
		last_rd_preaddr <= 24'hff_ffff;
	end
	else if(preaddr_end) begin
		cur_rd_preaddr <= {cur_value[19:0],4'b0000};
		last_rd_preaddr <= cur_rd_preaddr;
	end
	else begin
		cur_rd_preaddr <= cur_rd_preaddr;
		last_rd_preaddr <= last_rd_preaddr;
	end
end

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


assign qspi_rd_req = (pre_rd_req && (last_rd_preaddr != cur_rd_preaddr));

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
assign read_end		= byte_end && (byte_cnt == 3'd3) && qspi_state == S_QSPI_DATA; // only surpport 32bits one commond 
assign preaddr_end	= (bit_cnt == 16'd19) && qspi_state == S_QSPI_PREADDR; 
assign preidx_end	= (bit_cnt == 16'd3) && qspi_state == S_QSPI_PREIDX;
assign pre_rd_req	= (bit_cnt == 16'd0) && qspi_state == S_QSPI_PREIDX;

assign preidx_ready	= (bit_cnt == 16'd2) && qspi_state == S_QSPI_PREIDX;

// ram read
assign ram_ren = preidx_end || (byte_end && byte_cnt[1:0] == 2'b01);

assign ram_raddr = (qspi_state == S_QSPI_DATA) ? (qspi_pre_idx[2:0] + 3'd1) : qspi_pre_idx[2:0];
//reg [2:0] ram_raddr;
//always@(posedge qspi_clk or negedge rst_n)begin
//	if(!rst_n)
//		ram_raddr <= 3'd0;
//	else if(preidx_ready)
//	   ram_raddr <=  qspi_pre_idx[2:0];
//	else if(byte_pre_end && byte_cnt == 3'd0)
//	   ram_raddr <=  qspi_pre_idx[2:0] + 3'd1;
//	else if(byte_pre_end && byte_cnt == 3'd1)
//	   ram_raddr <=  qspi_pre_idx[2:0] + 3'd2;
//	else if(byte_pre_end && byte_cnt == 3'd2)
//	   ram_raddr <=  qspi_pre_idx[2:0] + 3'd3;
//   else
//	   ram_raddr <= ram_raddr;	
//end


reg [15:0] do_data;

//always@(posedge qspi_clk or negedge rst_n)begin
always@(negedge qspi_clk or negedge rst_n)begin
	if(!rst_n)begin
		do_data <= 16'd0;
	end
	else if(ram_ren) begin
		do_data <= ram_rdata;
	end
	else begin
		do_data <= {do_data[14:0],1'b0};
	end
end

reg qspi_do;
always@(negedge qspi_clk or negedge rst_n)begin
	if(!rst_n)
		qspi_do <= 1'bz;
	else if(qspi_state == S_QSPI_DATA || qspi_state_nxt == S_QSPI_DATA)
		qspi_do <= do_data[15];
	else
		qspi_do <= 1'bz;
end
//assign qspi_do = (qspi_state == S_QSPI_DATA || qspi_state_nxt == S_QSPI_DATA) ? do_data[15]:1'bz;


//`ifdef DEBUG_ILA
//wire[35:0] CONTROL;
//wire[136:0] trig0;
//
//	
//assign trig0 = {wr_ready,wr_valid,wr_addr[23:0],wr_data,rd_ready,rd_valid,rd_aready,rd_avalid,rd_addr[23:0],rd_data,sdram_rasn,sdram_casn,sdram_wen,sdram_ba[1:0],sdram_addr[12:0],sdram_data_oe,sdram_data_o,sdram_data_i};	
//
//chipscope_icon icon_inst(
//    .CONTROL0  (CONTROL)
//);	
//	
// chipscope_ila_1  cy_ila_inst(
//    .CONTROL	(CONTROL),
//    //.CLK			(qspi_clk),
//	 .CLK			(sd_clk),
//    .TRIG0		(trig0)
//	 );
// `endif

endmodule

