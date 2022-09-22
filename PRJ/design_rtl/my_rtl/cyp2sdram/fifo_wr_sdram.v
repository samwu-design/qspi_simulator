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
	//output reg [23:0] 	  wr_addr,
	output reg [31:0] 	  wr_addr,
	output                 wr_valid,
	input             	  wr_ready
	
);

localparam  SD_WR_BL  =  8'd8;
localparam  WAIT_CLKS = 8'h2f;

// 

localparam   S_IDLE 		=  9'd0;
localparam   S_WAIT_8DATA	=  9'd1;
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
					wr_state <= S_WAIT_8DATA;
				else
					wr_state <= S_IDLE;
			end
			
			S_WAIT_8DATA:begin			// write may slow, avoid there is only one data at begining
				if(rd_cnt == WAIT_CLKS)
					wr_state <= S_RD_FIFO;
				else
					wr_state <= S_WAIT_8DATA;
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
					//wr_state <= S_RD_FIFO;
					wr_state <= S_WAIT_8DATA;
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
	else if(wr_state == S_WAIT_8DATA)begin
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

/* the data size from usb must be power of 8 */
assign fifo_ren = (wr_state == S_RD_FIFO) && wr_ready && (rd_cnt <= (SD_WR_BL-1));

always@(posedge sdram_clk or negedge rst_n)begin
	if(!rst_n)begin
		wr_data <= 16'd0;
	end
	else begin
		wr_data <= fifo_rdata;
	end
end

reg wr_valid;
always@(posedge sdram_clk or negedge rst_n)begin
	if(!rst_n)
		wr_valid <= 0;
	else if(fifo_ren)    // data always package by 512 bytes, hold by software 
		wr_valid <= 1;
	else 
		wr_valid <= 0;
end

// if long time (1s) state is IDLE regard as current trans is finished
reg [31:0] detect_cnt;
wire files_time_out;
assign files_time_out = detect_cnt >= 32'd133000000;
always@(posedge sdram_clk or negedge rst_n)begin
	if(!rst_n)begin
		detect_cnt <= 32'd0;
	end
	else if(wr_state == S_IDLE) begin
		if(detect_cnt == 32'd133000000)
			detect_cnt <= detect_cnt;
		else
			detect_cnt <= detect_cnt + 32'd1;
	end
	else
		detect_cnt <= 32'd0;
end


always@(posedge sdram_clk or negedge rst_n)begin
	if(!rst_n)begin
		wr_addr <= 32'd0;
	end
	else if(wr_valid && wr_ready) begin   // 
		wr_addr <= wr_addr + 32'd2;
		//wr_addr <= wr_addr + 32'd1;  // sdram address sized by 16bits
	end
	else if(files_time_out) begin
		wr_addr <= 32'd0;
	end
	else begin
		wr_addr <= wr_addr;
	end
end

//`ifdef DEBUG_ILA
//wire[35:0] CONTROL;
//wire[81:0] trig0;
//	
//assign trig0 = {wr_ready,wr_valid,wr_addr,wr_data,wr_state,files_time_out,rd_cnt,fifo_rempty,fifo_ren,fifo_rdata};	
//
//chipscope_icon icon_inst(
//    .CONTROL0  (CONTROL)
//);	
//	
// chipscope_ila_4  cy_ila_inst(
//    .CONTROL	(CONTROL),
//    //.CLK			(qspi_clk),
//	 //.CLK			(sd_clk),
//	 .CLK			(sdram_clk),
//	 //.CLK			(cyp_clk),
//    .TRIG0		(trig0)
//	 );
// `endif
endmodule

