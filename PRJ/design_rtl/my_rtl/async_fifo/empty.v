`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:26:23 05/28/2018 
// Design Name: 
// Module Name:    rptr_empty 
//
//////////////////////////////////////////////////////////////////////////////////
module empty
#(
    parameter ASIZE = 4
)
(
    output                 rempty, 
    output     [ASIZE-1:0] raddr,  //��������ʽ�Ķ�ָ��
    output     [ASIZE  :0] rptr,  //��������ʽ�Ķ�ָ��
    input      [ASIZE  :0] r_wptr, //ͬ�����дָ��
    input                     ren, rclk, rrstn
);
  reg  [ASIZE:0] rbin;
 
 
  //�������ƵĶ�ָ�����������ƵĶ�ָ��ͬ��
always @(posedge rclk or negedge rrstn) 
    if (!rrstn) begin
        rbin <= 0;
    end  
    else if (ren && ~rempty)begin        
        rbin <= rbin + 1; 
    end
    else
	rbin <= rbin;

//always @(posedge rclk or negedge rrstn) 
//  if (!rrstn) begin
//      rptr <= 0;
//  end  
//  else begin        
//      rptr <= (rbin>>1)^rbin;
//  end

assign rptr = (rbin>>1)^rbin;

assign raddr = rbin[ASIZE-1:0];

assign rempty_val = (rptr == r_wptr) ? 1:0; 

assign rempty = rempty_val;
//always @(posedge rclk or negedge rrstn) 
//    if (!rrstn)
//        rempty <= 1'b1; 
//    else if(rempty_val)   
//        rempty <= 1'b1;
//    else
//        rempty <= 1'b0;

endmodule
