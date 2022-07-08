// +FHDR------------------------------------------------------------
//                 Copyright (c) 2022 $COMPANY .
//                       ALL RIGHTS RESERVED
// -----------------------------------------------------------------
// Filename      : qspi2sdram.v
// Author        : wusha 
// Created On    : 2022-06-17 17:06
// Last Modified : 
// -----------------------------------------------------------------
// Description:
//
//
// -FHDR------------------------------------------------------------

module qspi2sdram_top#(
	parameter RD_BL = 3'd2
)(
	input  		rst_n,

	// qspi
	input  		qspi_clk, // 10mhz
	input  		csn,
	input  		di,
	output 		do,
	input  		wpn,
	input  		holdn,

	// sdram ctrl read port
	input 		sdram_clk, //133mhz
	
	output [21:0] 	rd_addr,
	output 		rd_avalid,
	input           rd_aready,
	input [15:0]	rd_data,	
	input           rd_valid,
	output          rd_ready

);


wire [15:0] fifo_rdata;
wire [23:0] qspi_rd_addr;


qspi_rd_fifo#(
	.RD_BL(2)
) qspi_rd_fifo_inst(/*autoinst*/
    .qspi_clk                       (qspi_clk                                   ), // input 
    .rst_n                          (rst_n                                      ), // input 

    	// qspi
    .csn                            (csn                                        ), // input 
    .di                             (di                                         ), // input 
    .do                             (do                                         ), // output
    .wpn                            (wpn                                        ), // input 
    .holdn                          (holdn                                      ), // input 
    
    .qspi_rd_addr                   (qspi_rd_addr[23:0]                         ), // input 
    .qspi_rd_req                    (qspi_rd_req                                ), // input 
    .qspi_rd_busy                   (qspi_rd_busy                               ), // output
	
    // sdram wr fifo
    .fifo_ren                       (fifo_ren                                   ), // output
    .fifo_rempty                    (fifo_rempty                                ), // input 
    .fifo_rdata                     (fifo_rdata[15:0]                           )  // input 

    //----------------------get data in
);

fifo_rd_sdram#(
	.RD_BL(2)
) fifo_rd_sdram_inst(/*autoinst*/
    .rst_n                          (rst_n                                      ), // input 

    .qspi_rd_addr                   (qspi_rd_addr[23:0]                         ), // input 
    .qspi_rd_req                    (qspi_rd_req                                ), // input 
    .qspi_rd_busy                   (qspi_rd_busy                               ), // output
	
    .qspi_clk                       (qspi_clk                                   ), // input 
    .fifo_ren                       (fifo_ren                                   ), // input 
    .fifo_rempty                    (fifo_rempty                                ), // output
    .fifo_rdata                     (fifo_rdata[15:0]                           ), // output

    	// sdram  ctrl read port
    .sdram_clk                      (sdram_clk                                  ), // input 
    .rd_addr                        (rd_addr[21:0]                              ), // output
    .rd_avalid                      (rd_avalid                                  ), // output
    .rd_aready                      (rd_aready                                  ), // input 
    .rd_data                        (rd_data[15:0]                              ), // input 
    .rd_valid                       (rd_valid                                   ), // input 
    .rd_ready                       (rd_ready                                   )  // output

    //  address cross clk 
);

endmodule



