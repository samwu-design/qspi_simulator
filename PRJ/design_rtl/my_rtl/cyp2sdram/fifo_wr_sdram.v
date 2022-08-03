// +FHDR------------------------------------------------------------
//                 Copyright (c) 2022 $COMPANY .
//                       ALL RIGHTS RESERVED
// -----------------------------------------------------------------
// Filename      : fifo_wr_sdram.v
// Author        : wusha 
// Created On    : 2022-06-16 15:45
// Last Modified : 
// -----------------------------------------------------------------
// Description:
//
//
// -FHDR------------------------------------------------------------
module fifo_wr_sdram(

	input 		  	  sdram_clk, // 133mhz
	input             	  rst_n,

	output          	  fifo_ren,
	input [15:0] 	  	  fifo_rdata,
	input            	  fifo_rempty,

	output reg [15:0] 	  wr_data,
	output reg [23:0] 	  wr_addr,
	output                 wr_valid,
	input             	  wr_ready
	
);

localparam  SD_WR_BL  =  8'd8;
localparam  WAIT_CLKS = 8'h3f;

// 

localparam   S_IDLE 		=  9'd0;
localparam   S_WAIT_10CLK	=  9'd1;
localparam   S_RD_FIFO 		=  9'd2;
localparam   S_WAIT_WR 		=  9'd3;
localparam   S_ADDR_GEN		=  9'd4;

reg[4:0]  wr_state;
reg[7:0]  rd_cnt;

always@(posedge sdram_clk or negedge rst_n)begin
	if(!rst_n)begin
		wr_state <= S_IDLE;
	end
	else begin
		case(wr_state)
			S_IDLE:begin
				if(wr_ready && !fifo_rempty)
					wr_state <= S_WAIT_10CLK;
				else
					wr_state <= S_IDLE;
			end
			
			S_WAIT_10CLK:begin			// write may slow, avoid there is only one data at begining
				if(rd_cnt == WAIT_CLKS)
					wr_state <= S_RD_FIFO;
				else
					wr_state <= S_WAIT_10CLK;
			end

			S_RD_FIFO:begin
				if(fifo_ren && rd_cnt == SD_WR_BL-1)
				//if(burst_valid)
					wr_state <= S_WAIT_WR;
				else
					wr_state <= S_RD_FIFO;
			end

			S_WAIT_WR: begin
				if(!fifo_rempty)
					wr_state <= S_RD_FIFO;
				else
				   wr_state <= S_ADDR_GEN;
			end

			S_ADDR_GEN:begin
				wr_state <= S_IDLE;
			end

			default: wr_state <= S_IDLE;
		endcase
	end
end


always@(posedge sdram_clk or negedge rst_n)begin
	if(!rst_n)
		rd_cnt <= 8'd0;
	else if(wr_state == S_WAIT_10CLK)begin
		if(rd_cnt == WAIT_CLKS)
			rd_cnt <= 8'd0;
		else
		   rd_cnt <= rd_cnt + 8'd1;
	end
	else if(wr_state == S_RD_FIFO)begin
		if(fifo_ren)begin
			if(rd_cnt == SD_WR_BL-1)
				rd_cnt <= 8'd0;
		   else 
				rd_cnt <= rd_cnt + 8'd1;
		end
		else
		   rd_cnt <= rd_cnt;
	end
	else
	   rd_cnt <= 8'd0;
end

//assign fifo_ren = (wr_state == S_RD_FIFO) && (!fifo_rempty) && wr_ready && (rd_cnt <= (SD_WR_BL-1));
reg fifo_ren;
always@(*) begin
	if((wr_state == S_RD_FIFO) && (!fifo_rempty) && wr_ready && (rd_cnt <= (SD_WR_BL-1)))
		fifo_ren = 1;
	else
	   fifo_ren = 0;
end


always@(posedge sdram_clk or negedge rst_n)begin
	if(!rst_n)begin
		wr_data <= 16'd0;
	end
//	else if(fifo_rempty) begin   // if empty padding zero
//		wr_data <= 16'd0;
//	end
	else begin
		wr_data <= fifo_rdata;
	end
end

reg wr_valid;
always@(posedge sdram_clk or negedge rst_n)begin
	if(!rst_n)
		wr_valid <= 0;
	else if(fifo_ren)    // if empty padding zero
		wr_valid <= 1;
	else 
		wr_valid <= 0;
end
 
//assign wr_valid = fifo_ren;

// if long time (1s) state is IDLE regard as current trans is finished
reg [31:0] detect_cnt;
wire files_time_out;
assign files_time_out = detect_cnt > 32'd133000000;
always@(posedge sdram_clk or negedge rst_n)begin
	if(!rst_n)begin
		detect_cnt <= 32'd0;
	end
	else if(wr_state == S_IDLE) begin
		detect_cnt <= detect_cnt + 32'd1;
	end
	else
		detect_cnt <= 32'd0;
end


always@(posedge sdram_clk or negedge rst_n)begin
	if(!rst_n)begin
		wr_addr <= 24'd0;
	end
	else if(wr_valid && wr_ready) begin   // 
		//wr_addr <= wr_addr + 24'd2;
		wr_addr <= wr_addr + 24'd1;  // sdram address sized by 16bits
	end
	else if(files_time_out) begin
		wr_addr <= 24'd0;
	end
	else begin
		wr_addr <= wr_addr;
	end
end


endmodule

