`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:09:18 05/28/2018 
// Design Name: 
// Module Name:    sync_w2r 
//
//////////////////////////////////////////////////////////////////////////////////
module sync_w2r
#(parameter ASIZE = 4)
(
    output reg [ASIZE:0] r_wptr, //写指针同步到读时钟域
    input      [ASIZE:0] wptr,     //格雷码形式的写指针
    input                  rclk, rrstn
);
 
reg [ASIZE:0] r1_wptr;
 
  always @(posedge rclk or negedge rrstn)   
      if (!rrstn)
		begin
          r1_wptr <= 0;
          r_wptr <= 0;
      end 
      else 
		begin
			r1_wptr <= wptr;
			r_wptr <= r1_wptr;
      end
        
endmodule
