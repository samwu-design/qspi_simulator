`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:44:52 08/20/2022 
// Design Name: 
// Module Name:    test_a12pin 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module test_a12pin(

	input           fpga_clk,
	input           fpga_rstn,
	output reg      sdram_a12

    );


reg[31:0] clk_cnt;
always@(posedge fpga_clk or negedge fpga_rstn)begin
	if(!fpga_rstn)
	    clk_cnt <= 32'd0;
	else if(clk_cnt == 31'd5000000)
	    clk_cnt <= 32'd0; 
   else
       clk_cnt <= clk_cnt + 32'd1;	
end

always@(posedge fpga_clk or negedge fpga_rstn) begin
	if(!fpga_rstn)
	    sdram_a12 <= 0;
	else if(clk_cnt == 31'd5000000)
	    sdram_a12 <= !sdram_a12;
	else
	    sdram_a12 <= sdram_a12;
end


endmodule
