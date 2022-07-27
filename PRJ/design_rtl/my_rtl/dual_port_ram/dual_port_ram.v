// +FHDR------------------------------------------------------------
//                 Copyright (c) 2022 $COMPANY .
//                       ALL RIGHTS RESERVED
// -----------------------------------------------------------------
// Filename      : dual_port_ram.v
// Author        : wusha 
// Created On    : 2022-07-11 17:36
// Last Modified : 
// -----------------------------------------------------------------
// Description:
//
//
// -FHDR------------------------------------------------------------

module dual_port_ram#(
	parameter DATAWIDTH = 16,
	parameter ASIZE =3
)(
input			wclk   ,
input			wrstn  ,
input			wen    ,	
input  [ASIZE-1:0]		waddr  ,
input  [DATAWIDTH-1:0]		wdata  ,

input			rclk   ,	
input			rrstn  ,	
input			ren    ,	
input	[ASIZE-1:0]		raddr  ,
output [DATAWIDTH-1:0]		rdata  
);

reg[DATAWIDTH-1:0] rammem[(2<<ASIZE)-1:0];

integer i;
initial begin
	for(i=0;i<((2<<ASIZE));i=i+1)begin
		rammem[i] = 0;
	end
end

always@(posedge wclk)begin
	if(wen)begin
		rammem[waddr] <= wdata;
	end
end


assign rdata = rammem[raddr];


endmodule

