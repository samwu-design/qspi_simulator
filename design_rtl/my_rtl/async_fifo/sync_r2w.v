`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:10:01 05/28/2018 
// Design Name: 
// Module Name:    sync_r2w 
//
//////////////////////////////////////////////////////////////////////////////////
module sync_r2w
#(
    parameter ASIZE = 4
)
(
    output reg [ASIZE:0] w_rptr,   //��ָ��ͬ����дʱ����
    input      [ASIZE:0] rptr,       // ��������ʽ�Ķ�ָ�룬������ĺô������ϸ˵ 
    input                wclk, wrstn
);
 
reg [ASIZE:0] w1_rptr;
 
  always @(posedge wclk or negedge wrstn)   
      if (!wrstn) begin
          w1_rptr <= 0;          
          w_rptr <= 0;
      end           
      else begin        
          w1_rptr<= rptr;
          w_rptr<=w1_rptr;
      end          
  endmodule
