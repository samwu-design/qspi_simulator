// +FHDR------------------------------------------------------------
//                 Copyright (c) 2022 $COMPANY .
//                       ALL RIGHTS RESERVED
// -----------------------------------------------------------------
// Filename      : tb_async_fifo.v
// Author        : $USER_DIT 
// Created On    : 2022-06-17 10:34
// Last Modified : 
// -----------------------------------------------------------------
// Description:
//
//
// -FHDR------------------------------------------------------------

module tb_async_fifo();


reg  rclk,wclk;
reg  rst_n;


initial begin
	rclk = 0;
	wclk = 0;
	rst_n = 0;
#100    rst_n = 1;
end

always@(*) #10    wclk <= ~wclk;   //50mhz 
always@(*) #3.25  rclk <= ~rclk;   //133mhz


reg [15:0] wrand;
always@(posedge wclk)
	if(!rst_n)
		wrand <= 16'd0;
	else
		//wrand <= wrand + 16'd1;
    		wrand <= {$random}%256;
    
reg [15:0] rrand;
always@(posedge rclk)
	if(!rst_n)
		rrand <= 16'd0;
	else
		//rrand <= rrand + 16'd1;
    		rrand <= {$random}%5;


wire  wen = (wrand >= 16'd100 && wrand <= 16'd155) && !wfull;
wire  ren = 0;
//wire  ren = rrand == 16'd2 && !rempty;

reg 	[15:0] wdata;
wire 	[15:0] rdata;

always@(posedge wclk or negedge rst_n)begin
	if(!rst_n)begin
		wdata <= 16'd0;
	end
	else if(wen) begin
		wdata <= wdata + 16'd1;
	end
end


asyn_fifo_top#(
	.DATAWIDTH(16),
	.ASIZE(10)
)
dut_inst(
	.rdata      (rdata)    ,
	.wfull      (wfull)    ,
	.rempty     (rempty)   ,
	.wdata      (wdata)    ,
	.wen        (wen)      ,
	.wclk       (wclk)     ,
	.wrstn      (rst_n)    ,
	.ren        (ren)      ,
	.rclk       (rclk)     ,
	.rrstn      (rst_n)        	
);


endmodule
