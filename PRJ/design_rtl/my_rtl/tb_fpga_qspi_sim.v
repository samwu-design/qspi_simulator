// +FHDR------------------------------------------------------------
//                 Copyright (c) 2022 $COMPANY .
//                       ALL RIGHTS RESERVED
// -----------------------------------------------------------------
// Filename      : tb_fpga_qspi_sim.v
// Author        : wusha 
// Created On    : 2022-06-22 10:08
// Last Modified : 
// -----------------------------------------------------------------
// Description:
//
//
// -FHDR------------------------------------------------------------

module tb_fpga_qspi_sim(

);

reg  sd_clk,cyp_clk,clk;
reg  rst_n;

initial begin
	rst_n    = 0;
	sd_clk   = 0;
	clk   = 0;
	cyp_clk  = 0;
#100    rst_n    = 1;
end


always @(*) #3.25 sd_clk <= !sd_clk; //133mhz 
always @(*) #10 cyp_clk <= !cyp_clk; //48mhz(50mhz) 
always @(*) #6.25 clk <= !clk; //40mhz 

assign  ph_sd_clk = !sd_clk; 
 
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


wire [1:0]   usb_fifoaddr;
wire [1:0]   sdram_ba;
wire [12:0]  sdram_addr;
wire [15:0]  sdram_data;
wire [15:0]  usb_fd;



qspi_simulator_top qspi_simulator_inst(/*autoinst*/
    .rst_n                          (rst_n                                      ), // input 
    .clk                      (clk),
    .sd_clk                         (sd_clk                                     ), // input 
    .cyp_clk                        (cyp_clk                                     ), // input 
    .sdram_init_done                (sdram_init_done				),  // output
    	// qspi
    .qspi_clk                       (qspi_clk                                   ), // input 
    .qspi_csn                       (qspi_csn                                        ), // input 
    .qspi_di                        (qspi_di                                         ), // input 
    .qspi_do                        (qspi_do                                         ), // output
    .qspi_wpn                       (qspi_wpn                                        ), // input 
    .qspi_holdn                     (qspi_holdn                                      ), // input 

    	// sdram if
    //.sdram_clk                      (sdram_clk                                  ), // output
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
    .usb_clk                        (cyp_clk                                    ), // output
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



// qspi contrl vip
qspi_master_model  qspi_master_vip_inst(/*autoinst*/
    .usb_download_finished          (usb_download_finished                      ), 
    .sdram_init_done                (sdram_init_done),
    .qspi_clk_cg                       (qspi_clk                                   ), // output
    .csn                            (qspi_csn                                        ), // output
    .di                             (qspi_di                                         ), // output
    .do                             (qspi_do                                         ), // input 
    .wpn                            (qspi_wpn                                        ), // output
    .holdn                          (qspi_holdn                                      )  // output
);

//sdram model
mt48lc16m16a2 sdram_module_inst(
.Dq	(sdram_data), 
.Addr	(sdram_addr),	 
.Ba	(sdram_ba), 
//.Clk	(ph_sd_clk), 
.Clk	(sd_clk), 
.Cke	(sdram_cke), 
.Cs_n	(sdram_csn), 
.Ras_n	(sdram_rasn), 
.Cas_n	(sdram_casn), 
.We_n	(sdram_wen),	 
.Dqm	(0)	
);


// usb2 cyp vip
usb2_cyp_vip usb2_cyp_vip_inst(/*autoinst*/
    .rst_n			    (rst_n					),
    .usb_clk                        (cyp_clk                                    ), // input 
    .usb_fifoaddr                   (usb_fifoaddr[1:0]                          ), // input 
    .usb_slcs                       (usb_slcs                                   ), // input 
    .usb_sloe                       (usb_sloe                                   ), // input 
    .usb_slrd                       (usb_slrd                                   ), // input 
    .usb_slwr                       (usb_slwr                                   ), // input 
    .usb_fd                         (usb_fd[15:0]                               ), // inout 
    .usb_flaga                      (usb_flaga                                  ), // output
    .usb_flagb                      (usb_flagb                                  ), // output
    .usb_flagc                      (usb_flagc                                  ), // output
    .usb_download_finished          (usb_download_finished                      ),
    .pa0                            (pa0                                        )  // input

);

endmodule

