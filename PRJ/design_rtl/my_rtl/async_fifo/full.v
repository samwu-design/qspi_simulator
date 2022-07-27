`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:26:47 05/28/2018 
// Design Name: 
//
//////////////////////////////////////////////////////////////////////////////////
module full
#(
    parameter ASIZE = 4
) 
(
    output                    wfull,   
    output     [ASIZE-1:0]    waddr,
    output     [ASIZE  :0]    wptr, 
    input      [ASIZE  :0]    w_rptr,
    input                     wen, wclk, wrstn
);
  reg  [ASIZE:0] wbin;
  
assign waddr = wbin[ASIZE-1:0];

// GRAYSTYLE2 pointer
always@(posedge wclk or negedge wrstn)   
    if (!wrstn)
        wbin <= 'd0;   
    else if(wen && ~wfull)
    	  wbin <= wbin + 1;
    else  
        wbin <= wbin;

//always@(posedge wclk or negedge wrstn)begin
//	if(!wrstn)begin
//		wptr <= 'd0;
//	end
//	else begin
//		wptr <= (wbin>>1)^wbin;
//	end
//end

assign wptr = (wbin>>1)^wbin;

//当最高位和次高位不同其余位相同时则写指针超前于读指针一圈，即写满。
assign wfull_val = (wptr == {~w_rptr[ASIZE:ASIZE-1],w_rptr[ASIZE-2:0]}) ? 1:0; 
assign wfull = wfull_val;

//always @(posedge wclk or negedge wrstn)
//    if (!wrstn)
//        wfull  <= 1'b0;   
//    else  if(wfull_val)   
//        wfull  <= 1'b1;
//    else
//	wfull <= 1'b0;

endmodule
