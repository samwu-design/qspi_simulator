// +FHDR------------------------------------------------------------
//                 Copyright (c) 2022 $COMPANY .
//                       ALL RIGHTS RESERVED
// -----------------------------------------------------------------
// Filename      : fpga_qspi_simulator_top.v
// Author        : wusha 
// Created On    : 2022-06-21 17:50
// Last Modified : 
// -----------------------------------------------------------------
// Description:
//		wrapper for fpga 
//
// -FHDR------------------------------------------------------------

module fpga_qspi_simulator_top(
	input           rst_n,
	input           sd_clk,
	input           cyp_clk,
	//output          sdram_init_done,

	// qspi
	input  		qspi_clk, // 10mhz
	input  		csn,
	input  		di,
	output 		do,
	input  		wpn,
	input  		holdn,

	// sdram if
	output          sdram_clk,
	output 		sdram_cke,
	output 		sdram_csn,
	output 		sdram_rasn,	
	output 		sdram_casn,	
	output 		sdram_wen,	
	output [1:0]	sdram_ba,	
	output [12:0] 	sdram_addr,
	inout  [15:0]   sdram_data,

	// usb2
	output 		  usb_clk,
	output  [1:0]     usb_fifoaddr,  //CY68013 FIFO Address
    	output  	  usb_slcs,      //CY68013 Chipset select
    	output  	  usb_sloe,      //CY68013 Data output enable
    	output  	  usb_slrd,      //CY68013 READ indication
    	output  	  usb_slwr,      //CY68013 Write indication
    	
    	inout 	[15:0] 	  usb_fd,      //CY68013 Data inout
    	
	input 		  usb_flaga,     //CY68013 EP2 FIFO empty indication; 1:not empty; 0: empty
    	input 		  usb_flagb,     //CY68013 EP4 FIFO empty indication; 1:not empty; 0: empty
    	input 		  usb_flagc,     //CY68013 EP6 FIFO full indication; 1:not full; 0: full
	output  	  pa0            //int0# no use fixd 1	

);


wire [15:0]  sdram_data_i; 
wire [15:0]  sdram_data_o; 
wire [15:0]  usb_fd_i; 
wire [15:0]  usb_fd_o; 

wire    sdram_data_oe;
wire    usb_fd_oe;

genvar i;
generate 
	for(i=0;i<16;i=i+1) begin
   		IOBUF #(
   		   .DRIVE(12), // Specify the output drive strength
   		   .IBUF_LOW_PWR("TRUE"),  // Low Power - "TRUE", High Performance = "FALSE" 
   		   .IOSTANDARD("DEFAULT"), // Specify the I/O standard
   		   .SLEW("SLOW") // Specify the output slew rate
   		) IOBUF_sdram_inst (
   		   .O(sdram_data_i[i]),     // Buffer output
   		   .IO(sdram_data[i]),   // Buffer inout port (connect directly to top-level port)
   		   .I(sdram_data_o[i]),     // Buffer input
   		   .T(!sdram_data_oe)      // 3-state enable input, high=input, low=output
   		);
   	end

	for(i=0;i<16;i=i+1)begin
   		IOBUF #(
   		   .DRIVE(12), // Specify the output drive strength
   		   .IBUF_LOW_PWR("TRUE"),  // Low Power - "TRUE", High Performance = "FALSE" 
   		   .IOSTANDARD("DEFAULT"), // Specify the I/O standard
   		   .SLEW("SLOW") // Specify the output slew rate
   		) IOBUF_usb_inst (
   		   .O(usb_fd_i[i]),     // Buffer output
   		   .IO(usb_fd[i]),   // Buffer inout port (connect directly to top-level port)
   		   .I(usb_fd_o[i]),     // Buffer input
   		   .T(!usb_fd_oe)      // 3-state enable input, high=input, low=output
   		);
	end




endgenerate



qspi_simulator_top qspi_simulator_inst(/*autoinst*/
    .rst_n                          (rst_n                                      ), // input 
    .sd_clk                         (sd_clk                                     ), // input 
    .cyp_clk                        (cyp_clk                                     ), // input 
    //.sdram_init_done                (sdram_init_done				),  // output
    	// qspi
    .qspi_clk                       (qspi_clk                                   ), // input 
    .csn                            (csn                                        ), // input 
    .di                             (di                                         ), // input 
    .do                             (do                                         ), // output
    .wpn                            (wpn                                        ), // input 
    .holdn                          (holdn                                      ), // input 

    	// sdram if
    .sdram_clk                      (sdram_clk                                  ), // output
    .sdram_cke                      (sdram_cke                                  ), // output
    .sdram_csn                      (sdram_csn                                  ), // output
    .sdram_rasn                     (sdram_rasn                                 ), // output
    .sdram_casn                     (sdram_casn                                 ), // output
    .sdram_wen                      (sdram_wen                                  ), // output
    .sdram_ba                       (sdram_ba[1:0]                              ), // output
    .sdram_addr                     (sdram_addr[12:0]                           ), // output
    .sdram_data_i                   (sdram_data_i[15:0]                         ), // input 
    .sdram_data_o                   (sdram_data_o[15:0]                         ), // output
    .sdram_data_oe                  (sdram_data_oe                              ), // output

    	// usb2
    .usb_clk                        (usb_clk                                    ), // output
    .usb_fifoaddr                   (usb_fifoaddr[1:0]                          ), // output
    .usb_slcs                       (usb_slcs                                   ), // output
    .usb_sloe                       (usb_sloe                                   ), // output
    .usb_slrd                       (usb_slrd                                   ), // output
    .usb_slwr                       (usb_slwr                                   ), // output
    	
    .usb_fd_i                       (usb_fd_i[15:0]                             ), // input 
    .usb_fd_o                       (usb_fd_o[15:0]                             ), // output
    .usb_fd_oe                      (usb_fd_oe                                  ), // output
    	
    .usb_flaga                      (usb_flaga                                  ), // input 
    .usb_flagb                      (usb_flagb                                  ), // input 
    .usb_flagc                      (usb_flagc                                  ), // input 
    .pa0                            (pa0                                        )  // output
);




endmodule
