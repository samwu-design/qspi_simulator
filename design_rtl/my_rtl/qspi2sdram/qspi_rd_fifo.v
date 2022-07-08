// +FHDR------------------------------------------------------------
//                 Copyright (c) 2022 $COMPANY .
//                       ALL RIGHTS RESERVED
// -----------------------------------------------------------------
// Filename      : qspi_rd_fifo.v
// Author        : $USER_DIT 
// Created On    : 2022-06-17 17:26
// Last Modified : 
// -----------------------------------------------------------------
// Description:
//           version1.0  only surport Fast Read(0Bh)
//
// -FHDR------------------------------------------------------------


module qspi_rd_fifo#(
	parameter RD_BL = 3'd2
)(
	input   		qspi_clk,
	input   		rst_n,

	// qspi
	input  			csn,
	input  			di,
	output 			do,
	input  			wpn,
	input  			holdn,

	output reg [23:0]       qspi_rd_addr,
	output reg           	qspi_rd_req,
	input             	qspi_rd_busy,
	
        // sdram wr fifo
	output                  fifo_ren,
	input			fifo_rempty,
	input  [15:0]           fifo_rdata
);

parameter CMD_FAST_READ = 8'h0b;

wire cmd_fstrd_0bh;
wire address_end;
wire dummy_end;
wire byte_end;
wire read_end;


//----------------------get data in
reg  [31:0] in_dat; 
wire [31:0] cur_value;

assign cur_value = {in_dat[30:0],di};

always@(posedge qspi_clk or negedge rst_n)begin
	if(!rst_n)begin
		in_dat <= 32'd0;
	end
	else begin
		in_dat <= {in_dat[30:0],di};
	end
end
// check fast read cmmond
assign cmd_fstrd_0bh 	= (qspi_state == S_QSPI_CMD && cur_value[7:0] == 8'h0b) ? 1:0;


//--------------------------------- bit count
reg [15:0]  bit_cnt;
reg [2:0]   byte_cnt;
always@(posedge qspi_clk or negedge rst_n)begin
	if(!rst_n)begin
		bit_cnt <= 0;
	end
	else if(cmd_fstrd_0bh || address_end || dummy_end || byte_end)begin
		bit_cnt <= 0;
	end
	else begin
		bit_cnt <= bit_cnt + 16'd1;
	end
end

always@(posedge qspi_clk or negedge rst_n)begin
	if(!rst_n)
		byte_cnt <= 3'd0;
	else if(read_end && byte_end)                 //  read end 是优先判断的，仿真看结果逻辑上有先后。
		byte_cnt <= 3'd0;
	else if(byte_end) 
		byte_cnt <= byte_cnt + 3'd1;
	else
		byte_cnt <= byte_cnt;


end


//---------------------------------------------
//	QSPI FSM  read timing
//
//--------------------------------------------
// qspi timing
//
reg [4:0]  qspi_state;

localparam   S_QSPI_CMD 	= 3'd0;
localparam   S_QSPI_ADDR 	= 3'd1;
localparam   S_QSPI_DUMMY 	= 3'd2;
localparam   S_QSPI_DATA 	= 3'd3;
localparam   S_QSPI_END 	= 3'd4;


always@(posedge qspi_clk or negedge rst_n)begin
	if(!rst_n)begin
		qspi_state <= 5'd0;
	end
	else begin
		case(qspi_state)
			S_QSPI_CMD:begin
				if(cmd_fstrd_0bh)
					qspi_state <= S_QSPI_ADDR;
				else
					qspi_state <= S_QSPI_CMD;
			end

			S_QSPI_ADDR:begin
				if(address_end)
					qspi_state <= S_QSPI_DUMMY;
				else
					qspi_state <= S_QSPI_ADDR;

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

always@(posedge qspi_clk or negedge rst_n)begin
	if(!rst_n)begin
		qspi_rd_addr <= 32'd0;
	end
	else if(address_end) begin
		qspi_rd_addr <= cur_value[23:0];
	end
	else
		qspi_rd_addr <= qspi_rd_addr;
end

always@(posedge qspi_clk or negedge rst_n)begin
	if(!rst_n)begin
		qspi_rd_req <= 0;
	end
	else if(address_end)begin
		qspi_rd_req <= 1;
	end
	else
		qspi_rd_req <= 0;
end



assign address_end 	= (bit_cnt == 16'd23) && qspi_state == S_QSPI_ADDR;
assign dummy_end	= (bit_cnt == 16'd7) && qspi_state == S_QSPI_DUMMY;
assign byte_end 	= (bit_cnt == 16'd7) && qspi_state == S_QSPI_DATA;
assign read_end		= byte_end && (byte_cnt == 2*RD_BL-1); 


//------------------fifo read

assign fifo_ren = dummy_end || (byte_end && byte_cnt[0] == 1 && !fifo_rempty); //

reg [15:0] do_data;
always@(posedge qspi_clk or negedge rst_n)begin
	if(!rst_n)begin
		do_data <= 16'd0;
	end
	else if(fifo_ren) begin
		do_data <= fifo_rdata;
	end
	else
		do_data <= {do_data[14:0],1'b0};
end


assign do = (qspi_state == S_QSPI_DATA) ? do_data[15]:1'bz;



endmodule
