// +FHDR------------------------------------------------------------
//                 Copyright (c) 2022 $COMPANY .
//                       ALL RIGHTS RESERVED
// -----------------------------------------------------------------
// Filename      : qspi_simulator_top.v
// Author        : wusha 
// Created On    : 2022-06-21 16:01
// Last Modified : 
// -----------------------------------------------------------------
// Description:
//     qspi flash simulator
//     only surport fast read mode (cmd == 0bh)
//     data burt bytenum = 4 bytes
// -FHDR------------------------------------------------------------



module qspi_simulator_top(

	input           rst_n,
	input          sd_clk,
	input          cyp_clk,

	//output         sdram_init_done,

	// qspi
	input  		qspi_clk, // 10mhz
	input  		qspi_csn,
	input  		qspi_di,
	output 		qspi_do,
	input  		qspi_wpn,
	input  		qspi_holdn,

	// sdram if
	//output          sdram_clk,
	output 		sdram_cke,
	output 		sdram_csn,
	output 		sdram_rasn,	
	output 		sdram_casn,	
	output 		sdram_wen,	
	output [1:0]	sdram_ba,	
	output [12:0] 	sdram_addr,
	input  [15:0]   sdram_data_i,
	output [15:0]   sdram_data_o,
	output          sdram_data_oe,

	// usb2
	output 		  usb_clk,
	output  [1:0]     usb_fifoaddr,  //CY68013 FIFO Address
    	output  	  usb_slcs,      //CY68013 Chipset select
    	output  	  usb_sloe,      //CY68013 Data output enable
    	output  	  usb_slrd,      //CY68013 READ indication
    	output  	  usb_slwr,      //CY68013 Write indication
    	
    	input 	[15:0] 	  usb_fd_i,      //CY68013 Data in
    	output  [15:0] 	  usb_fd_o,      //CY68013 Data out
	output  	  usb_fd_oe,     //data out valid 0 active	
    	
	input 		  usb_flaga,     //CY68013 EP2 FIFO empty indication; 1:not empty; 0: empty
    	input 		  usb_flagb,     //CY68013 EP4 FIFO empty indication; 1:not empty; 0: empty
    	input 		  usb_flagc,     //CY68013 EP6 FIFO full indication; 1:not full; 0: full
	output  	  pa0            //int0# no use fixd 1	

);


//assign  sdram_clk = sd_clk;


wire  [23:0] 	rd_addr;
wire  [15:0]	rd_data;	
wire  [15:0] 	wr_data;
wire  [23:0] 	wr_addr;
wire            wr_valid;
wire            wr_ready;


qspi2sdram_top qspi2sdram_inst(
.rst_n		(rst_n		),
.qspi_clk	(qspi_clk	), // <50mhz
.qspi_csn		(qspi_csn		),
.qspi_di		(qspi_di		),
.qspi_do		(qspi_do		),
.qspi_wpn		(qspi_wpn		),
.qspi_holdn		(qspi_holdn		),
.sdram_clk	(sd_clk	), // 133mhz
.rd_addr	(rd_addr	),
.rd_avalid	(rd_avalid	),
.rd_aready	(rd_aready	),
.rd_data	(rd_data	),		
.rd_valid	(rd_valid	),
.rd_ready	(rd_ready	)
);


sdram_top sdram_ctrl_inst(
.clk		(sd_clk      	), // 133 input
.rst_n		(rst_n		),
.sdram_init_done(sdram_init_done),
.sdram_cke	(sdram_cke	),
.sdram_csn	(sdram_csn	),
.sdram_rasn	(sdram_rasn	),	
.sdram_casn	(sdram_casn	),	
.sdram_wen	(sdram_wen	),	
.sdram_ba	(sdram_ba	),	
.sdram_addr	(sdram_addr	),
.sdram_data_i	(sdram_data_i	),
.sdram_data_o	(sdram_data_o	),
.sdram_data_oe	(sdram_data_oe	),
.wr_data	(wr_data	),
.wr_addr	(wr_addr	),
.wr_valid	(wr_valid	),
.wr_ready	(wr_ready	),
.rd_addr	(rd_addr	),
.rd_avalid	(rd_avalid	),
.rd_aready	(rd_aready	),
.rd_data	(rd_data	),		
.rd_valid	(rd_valid	),
.rd_ready	(rd_ready	)
);

cyp2sdram_top cyp2sdram_inst(
.cyp_clk	(cyp_clk	),  //48mhz
.sdram_clk	(sd_clk	),  //133mhz
.rst_n		(rst_n		),
.sdram_init_done(sdram_init_done),
.usb_clk	(usb_clk	),
.usb_fifoaddr	(usb_fifoaddr	),  
.usb_slcs	(usb_slcs	),  
.usb_sloe	(usb_sloe	),  
.usb_slrd	(usb_slrd	),  
.usb_slwr	(usb_slwr	),  
.usb_fd_i	(usb_fd_i	),  
.usb_fd_o	(usb_fd_o	),  
.usb_fd_oe	(usb_fd_oe	),  	
.usb_flaga	(usb_flaga	),  
.usb_flagb	(usb_flagb	),  
.usb_flagc	(usb_flagc	),  
.pa0		(pa0		),  	
.wr_data	(wr_data	),
.wr_addr	(wr_addr	),
.wr_valid	(wr_valid	),
.wr_ready	(wr_ready	)
);



//`ifdef DEBUG_ILA
//wire[35:0] CONTROL;
//wire[136:0] trig0;
//	
//assign trig0 = {wr_ready,wr_valid,wr_addr[23:0],wr_data,rd_ready,rd_valid,rd_aready,rd_avalid,rd_addr[23:0],rd_data,sdram_rasn,sdram_casn,sdram_wen,sdram_ba[1:0],sdram_addr[12:0],sdram_data_oe,sdram_data_o,sdram_data_i};	
//
//
//
//chipscope_icon icon_inst(
//    .CONTROL0  (CONTROL)
//);	
//	
// chipscope_ila_0  cy_ila_inst(
//    .CONTROL	(CONTROL),
//    //.CLK			(qspi_clk),
//	 .CLK			(sd_clk),
//	 //.CLK			(cyp_clk),
//    .TRIG0		(trig0)//,
//	 //.TRIG1		(trig1),
//	 //.TRIG2		(trig2)
//	 );
// `endif


endmodule
