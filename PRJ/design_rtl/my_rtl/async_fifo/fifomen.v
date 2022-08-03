`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: samwu
// 
//////////////////////////////////////////////////////////////////////////////////
module fifomem
#(
    parameter  DATAWIDTH = 8, // Memory data word width      
    parameter  DEEPTH = (1<<(ASIZE-1)),    
    parameter  ASIZE = 4  // Ϊ8ַΪ3λɣඨһλԭжǿջ
) // Number of mem address bits
(
	input  resetn,
    	output [DATAWIDTH-1:0] rdata, 
    	input  [DATAWIDTH-1:0] wdata, 
   	input  [ASIZE-1:0] waddr, raddr, 
   	input                 wclk, wen, wfull
);
 
reg[DATAWIDTH-1:0] mem[0:DEEPTH-1];

integer i;
initial begin
	for(i=0; i<DEEPTH-1; i=i+1)begin
		mem[i] = 0;
	end
end

assign rdata = mem[raddr];

always@(posedge wclk)begin
	if(wen)begin
		mem[waddr] <= wdata;
	end
end

endmodule
