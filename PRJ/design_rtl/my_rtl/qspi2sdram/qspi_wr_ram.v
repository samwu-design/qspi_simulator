// +FHDR------------------------------------------------------------
//                 Copyright (c) 2022 $COMPANY .
//                       ALL RIGHTS RESERVED
// -----------------------------------------------------------------
// Filename      : qspi_wr_ram.v
// Author        : wusha 
// Created On    : 2022-08-04 15:29
// Last Modified : 
// -----------------------------------------------------------------
// Description:
//
//
// -FHDR------------------------------------------------------------

module qspi_wr_ram(
	input   		qspi_clk,
	input   		rst_n,

	// qspi
	input  			qspi_csn,
	input  			qspi_di_i0,  //io0
	input 			qspi_do_i1,  //io1
	input  			qspi_wpn_i2, //io2
	input  			qspi_holdn_i3, //ioio3

	output reg [23:0]       qspi_wr_addr,
	output            	qspi_wr_req,

	// ram 
	output                  ram_wen,
	output  [2:0]           ram_waddr,
	output  [15:0]          ram_wdata
);


endmodule
