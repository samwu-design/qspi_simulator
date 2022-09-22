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

module qspi2sdram_top(
	input  		rst_n,
	input       debug_clk,

	// qspi
	input  		qspi_clk, // 10mhz
	input  		qspi_csn,
	input  		qspi_di,
	output 		qspi_do,
	input  		qspi_wpn,
	input  		qspi_holdn,

	// sdram ctrl read port
	input 		sdram_clk, //133mhz
	
	output           forbiden_autofresh,
	
	output [23:0] 	rd_addr,
	output 		rd_avalid,
	input           rd_aready,
	input [15:0]	rd_data,	
	input           rd_valid,
	output          rd_ready

);


wire [23:0] qspi_rd_addr;


wire        ram_ren	    ;		
wire [2:0]  ram_raddr  	    ;		
wire [15:0] ram_rdata 	    ;		

qspi_rd_ram  qspi_rd_ram_inst(/*autoinst*/
    .qspi_clk                       (qspi_clk                                   ), // input 
	 .debug_clk                      (debug_clk                                  ),
    .rst_n                          (rst_n                                      ), // input 

    	// qspi
    .qspi_csn                            (qspi_csn                                        ), // input 
    .qspi_di                             (qspi_di                                         ), // input 
    .qspi_do                             (qspi_do                                         ), // output
    .qspi_wpn                            (qspi_wpn                                        ), // input 
    .qspi_holdn                          (qspi_holdn                                      ), // input 
   
    .qspi_rd_addr                   (qspi_rd_addr[23:0]                         ), // output 
    .qspi_rd_req                    (qspi_rd_req                                ), // output 
    .qspi_rd_busy                   (qspi_rd_busy                               ), // input
	 .forbiden_autofresh             (forbiden_autofresh), //output

    .ram_ren			    (ram_ren	 				), // output
    .ram_raddr			    (ram_raddr[2:0] 				), // output
    .ram_rdata	                    (ram_rdata[15:0] 				) // input


    //----------------------get data in
);

ram_rd_sdram ram_rd_sdram_inst(/*autoinst*/
    .rst_n                          (rst_n                                      ), // input 

    .qspi_rd_addr                   (qspi_rd_addr[23:0]                         ), // input 
    .qspi_rd_req                    (qspi_rd_req                                ), // input 
    .qspi_rd_busy                   (qspi_rd_busy                               ), // output
	
    .ram_clk                       (qspi_clk                                   ), // input 
    .ram_ren			    (ram_ren	 				), // input
    .ram_raddr			    (ram_raddr[2:0] 				), // input
    .ram_rdata	                    (ram_rdata[15:0] 				), // output
    	// sdram  ctrl read port
    .sdram_clk                      (sdram_clk                                  ), // input 
    .rd_addr                        (rd_addr[23:0]                              ), // output
    .rd_avalid                      (rd_avalid                                  ), // output
    .rd_aready                      (rd_aready                                  ), // input 
    .rd_data                        (rd_data[15:0]                              ), // input 
    .rd_valid                       (rd_valid                                   ), // input 
    .rd_ready                       (rd_ready                                   )  // output

    //  address cross clk 
);

endmodule




