// +FHDR------------------------------------------------------------
//                 Copyright (c) 2022 $COMPANY .
//                       ALL RIGHTS RESERVED
// -----------------------------------------------------------------
// Filename      : fifo_rd_sdram.v
// Author        : $USER_DIT 
// Created On    : 2022-06-17 17:11
// Last Modified : 
// -----------------------------------------------------------------
// Description:
//
//
// -FHDR------------------------------------------------------------

module fifo_rd_sdram#(
	parameter RD_BL = 3'd2

)(

	input    		rst_n,

	input  [23:0]           qspi_rd_addr,
	input            	qspi_rd_req,
	output             	qspi_rd_busy,
	
	input    		qspi_clk, // ?mhz  <50mhz  fifo readclk
	input                   fifo_ren,
	output          	fifo_rempty,
	output [15:0]         	fifo_rdata,

	// sdram  ctrl read port
	input           	sdram_clk, //133mhz
	output reg [21:0] 	rd_addr,
	output 			rd_avalid,
	input          		rd_aready,
	input [15:0]		rd_data,	
	input          		rd_valid,
	output           	rd_ready

);




wire  wen;


//  address cross clk 
reg  qspi_rd_req0,qspi_rd_req1;
wire qspi_rd_posedge;

always@(posedge sdram_clk or negedge rst_n)begin
	if(!rst_n)begin
		qspi_rd_req0 <= 0;
		qspi_rd_req1 <= 0;
	end
	else  begin
		qspi_rd_req0 <= qspi_rd_req;
		qspi_rd_req1 <= qspi_rd_req0;
	end
end

assign qspi_rd_posedge = qspi_rd_req0 && !qspi_rd_req1;

always@(posedge sdram_clk or negedge rst_n)begin
	if(!rst_n)begin
		rd_addr <= 22'd0;
	end
	else if(qspi_rd_posedge) begin
		rd_addr <= qspi_rd_addr[21:0];
	end
end







// adram ctrol port 
//------------------------------------------
//	FSM  read data from sdram
//           to fifo
//------------------------------------------
localparam   S_RD_IDLE 		= 3'd0;
localparam   S_RD_ADDR 		= 3'd1;
localparam   S_RD_DATA 		= 3'd2;
localparam   S_CHECK_FIFO 	= 3'd3;

reg [2:0]  rd_state;
reg [2:0]  rd_cnt;

always@(posedge sdram_clk or negedge rst_n)begin
	if(!rst_n)begin
		rd_state <= 3'd0;
	end
	else begin
		case(rd_state)
			S_RD_IDLE:begin
				if(qspi_rd_posedge)
					rd_state <= S_RD_ADDR;
				else
					rd_state <= S_RD_IDLE;
			end

			S_RD_ADDR:begin
				if(rd_avalid && rd_aready)
					rd_state <= S_RD_DATA;
				else
					rd_state <= S_RD_ADDR;
			end

			S_RD_DATA:begin
				if(rd_valid && rd_ready)begin
					if(rd_cnt == RD_BL - 1)
						rd_state <= S_RD_IDLE;
					else
						rd_state <= S_RD_DATA;
				end
				else
					rd_state <= S_RD_DATA;
			end

			S_CHECK_FIFO:begin
				if(!wfull)
					rd_state <= S_RD_IDLE;
				else
					rd_state <= S_CHECK_FIFO;
			end

			default:  rd_state <= S_RD_IDLE;
			
		endcase
	end
end

always@(posedge sdram_clk or negedge rst_n)begin
	if(!rst_n)begin
		rd_cnt <= 3'd0;
	end
	else if(rd_valid && rd_ready)begin
		if(rd_cnt == RD_BL-1)
			rd_cnt <= 3'd0;
		else
			rd_cnt <= rd_cnt + 3'd1;
	end
	else
		rd_cnt <= rd_cnt;
end



assign qspi_rd_busy = !(rd_state == S_RD_IDLE);
assign wen = rd_valid && rd_ready;  
assign rd_avalid = rd_state == S_RD_ADDR;
assign rd_ready  = rd_state == S_RD_DATA;




asyn_fifo_top#(
	.DATAWIDTH(16),
	.ASIZE(10)     // 10 --> deepth 512 
)rdfifo_inst(
	.wfull	(wfull),
	//.wdata	(rd_data),
	.wdata	({rd_data[7:0],rd_data[15:8]}),
	.wen	(wen), // 
	.wclk	(sdram_clk),
	.wrstn	(rst_n),		
	
	.rdata	(fifo_rdata),
	.ren	(fifo_ren),
	.rempty	(fifo_rempty),
	.rclk	(qspi_clk),
	.rrstn	(rst_n)	
);

endmodule
