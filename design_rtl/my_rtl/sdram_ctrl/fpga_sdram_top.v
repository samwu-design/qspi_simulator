// +FHDR------------------------------------------------------------
//                 Copyright (c) 2022 $COMPANY .
//                       ALL RIGHTS RESERVED
// -----------------------------------------------------------------
// Filename      : fpga_sdram_top.v
// Author        : wusha 
// Created On    : 2022-06-13 11:13
// Last Modified : 
// -----------------------------------------------------------------
// Description:
//
//
// -FHDR------------------------------------------------------------

module fpga_sdram_top(

	input   	clk,   // 133
	input   	rst_n,
	output          sdram_init_done,

	// sdram if
	output          sdram_clk, // 133mhz
	output 		sdram_cke,
	output 		sdram_csn,
	output 		sdram_rasn,	
	output 		sdram_casn,	
	output 		sdram_wen,	
	output [1:0]	sdram_ba,	
	output [12:0] 	sdram_addr,
	inout  [15:0]   sdram_data,
	output		sdram_dqmh,
	output		sdram_dqml,

	//
	input [15:0] 	wr_data,
	input [21:0] 	wr_addr,
	input           wr_valid,
	output          wr_ready,

	input [21:0] 	rd_addr,
	input 		rd_avalid,
	output          rd_aready,
	output [15:0]	rd_data,	
	output          rd_valid,
	input           rd_ready

);

assign sdram_dqmh = 0;
assign sdram_dqml = 0;


// fpga primitive
wire [15:0]  sdram_data_i;
wire [15:0]  sdram_data_o;
wire 	     sdram_data_oe;

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
endgenerate






sdram_top  sdram_top_inst(/*autoinst*/
    .clk                            (clk                                        ), // input 
    .rst_n                          (rst_n                                      ), // input 
    .sdram_init_done                (sdram_init_done                            ), // output
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

    	//
    .wr_data                        (wr_data[15:0]                              ), // input 
    .wr_addr                        (wr_addr[21:0]                              ), // input 
    .wr_valid                       (wr_valid                                   ), // input 
    .wr_ready                       (wr_ready                                   ), // output

    .rd_addr                        (rd_addr[21:0]                              ), // input 
    .rd_avalid                      (rd_avalid                                  ), // input 
    .rd_aready                      (rd_aready                                  ), // output
    .rd_data                        (rd_data[15:0]                              ), // output
    .rd_valid                       (rd_valid                                   ), // output
    .rd_ready                       (rd_ready                                   )  // input 

  );



endmodule
