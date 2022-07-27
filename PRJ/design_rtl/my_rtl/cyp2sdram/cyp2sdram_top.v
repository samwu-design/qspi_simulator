// +FHDR------------------------------------------------------------
//                 Copyright (c) 2022 $COMPANY .
//                       ALL RIGHTS RESERVED
// -----------------------------------------------------------------
// Filename      : cyp2sdram_top.v
// Author        : wusha 
// Created On    : 2022-06-16 11:00
// Last Modified : 
// -----------------------------------------------------------------
// Description:
//
//
// -FHDR------------------------------------------------------------


module cyp2sdram_top(
	input cyp_clk,   // 48mhz
	input sdram_clk, // 133mhz
	input rst_n,
	input  sdram_init_done,
    	
	output 		  usb_clk,
	output  [1:0]     usb_fifoaddr,  //CY68013 FIFO Address
    	output  	  usb_slcs,      //CY68013 Chipset select
    	output  	  usb_sloe,      //CY68013 Data output enable
    	output  	  usb_slrd,      //CY68013 READ indication
    	output  	  usb_slwr,      //CY68013 Write indication
    	
	//inout [15:0] 	  usb_fd,        //CY68013 Data
    	input 	[15:0] 	  usb_fd_i,        //CY68013 Data in
    	output  [15:0] 	  usb_fd_o,        //CY68013 Data out
	output  	  usb_fd_oe,       // data out valid 0 active	
    	
	input 		  usb_flaga,     //CY68013 EP2 FIFO empty indication; 1:not empty; 0: empty
    	input 		  usb_flagb,     //CY68013 EP4 FIFO empty indication; 1:not empty; 0: empty
    	input 		  usb_flagc,     //CY68013 EP6 FIFO full indication; 1:not full; 0: full
	output  	  pa0 ,          // int0# no use fixd 1	

		//
	output [15:0] 	wr_data,
	output [23:0] 	wr_addr,
	output          wr_valid,
	input           wr_ready


);


wire [15:0] fifo_rdata;




cyp_wr_fifo cy_wr_fifo_inst(/*autoinst*/
    .cyp_clk                        (cyp_clk                                    ), // input 
    .rst_n                          (rst_n                                      ), // input 
    .sdram_init_done                (sdram_init_done                            ),	
    .usb_clk                        (usb_clk                                    ), // output
    .usb_fifoaddr                   (usb_fifoaddr[1:0]                          ), // output
    .usb_slcs                       (usb_slcs                                   ), // output
    .usb_sloe                       (usb_sloe                                   ), // output
    .usb_slrd                       (usb_slrd                                   ), // output
    .usb_slwr                       (usb_slwr                                   ), // output
    	
    	//inout [15:0] 	  usb_fd,        //CY68013 Data
    .usb_fd_i                       (usb_fd_i[15:0]                             ), // input 
    .usb_fd_o                       (usb_fd_o[15:0]                             ), // output
    .usb_fd_oe                      (usb_fd_oe                                  ), // output
    	
    .usb_flaga                      (usb_flaga                                  ), // input 
    .usb_flagb                      (usb_flagb                                  ), // input 
    .usb_flagc                      (usb_flagc                                  ), // input 
    .pa0                            (pa0                                        ), // output

    	//
    .sdram_clk                      (sdram_clk                                  ), // input 
    .fifo_ren                       (fifo_ren                                   ), // input 
    .fifo_rdata                     (fifo_rdata[15:0]                           ), // output
    .fifo_rempty                    (fifo_rempty                                )  // output
);


fifo_wr_sdram fifo_wr_sdram_inst(/*autoinst*/
    .sdram_clk                      (sdram_clk                                  ), // input 
    .rst_n                          (rst_n                                      ), // input 

    .fifo_ren                       (fifo_ren                                   ), // output
    .fifo_rdata                     (fifo_rdata[15:0]                           ), // input 
    .fifo_rempty                    (fifo_rempty                                ), // input 

    .wr_data                        (wr_data[15:0]                              ), // output
    .wr_addr                        (wr_addr[23:0]                              ), // output
    .wr_valid                       (wr_valid                                   ), // output
    .wr_ready                       (wr_ready                                   )  // input 
	
    // 
);

`ifdef DEBUG_ILA
wire[35:0] CONTROL;
wire[79:0] trig0;
	
assign trig0 = {wr_ready,wr_valid,wr_addr,wr_data,fifo_rdata,fifo_rempty,fifo_ren,usb_slrd,usb_sloe,usb_fd_oe,usb_flaga,usb_fd_i};	

chipscope_icon icon_inst(
    .CONTROL0  (CONTROL)
);	
	
 chipscope_ila_0  cy_ila_inst(
    .CONTROL	(CONTROL),
    //.CLK			(qspi_clk),
	 .CLK			(sd_clk),
	 .CLK			(sdram_clk),
	 //.CLK			(cyp_clk),
    .TRIG0		(trig0)
	 );
 `endif
endmodule
