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

reg  sd_clk,cyp_clk;
reg  rst_n;

initial begin
	rst_n    = 0;
	sd_clk   = 0;
	cyp_clk  = 0;
#100    rst_n    = 1;
end


always @(*) #3.25 sd_clk <= !sd_clk; //133mhz 
always @(*) #10 cyp_clk <= !cyp_clk; //48mhz(50mhz) 
 


wire [1:0]   usb_fifoaddr;
wire [1:0]   sdram_ba;
wire [12:0]  sdram_addr;
wire [15:0]  sdram_data;
wire [15:0]  usb_fd;



fpga_qspi_simulator_top  fpga_qspi_inst(/*autoinst*/
    .rst_n                          (rst_n                                      ), // input 
    .sd_clk                         (sd_clk                                     ), // input 
    .cyp_clk                        (cyp_clk                                     ), // input 
    //.sdram_init_done                (sdram_init_done                             ),
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
    .sdram_data                     (sdram_data[15:0]                           ), // inout 

    	// usb2
    .usb_clk                        (usb_clk                                    ), // output
    .usb_fifoaddr                   (usb_fifoaddr[1:0]                          ), // output
    .usb_slcs                       (usb_slcs                                   ), // output
    .usb_sloe                       (usb_sloe                                   ), // output
    .usb_slrd                       (usb_slrd                                   ), // output
    .usb_slwr                       (usb_slwr                                   ), // output
    	
    .usb_fd                         (usb_fd[15:0]                               ), // inout 
    	
    .usb_flaga                      (usb_flaga                                  ), // input 
    .usb_flagb                      (usb_flagb                                  ), // input 
    .usb_flagc                      (usb_flagc                                  ), // input 
    .pa0                            (pa0                                        )  // output

);


// qspi contrl vip
qspi_master_model  qspi_master_vip_inst(/*autoinst*/
    .usb_download_finished          (usb_download_finished                      ), 
    .qspi_clk                       (qspi_clk                                   ), // output
    .csn                            (csn                                        ), // output
    .di                             (di                                         ), // output
    .do                             (do                                         ), // input 
    .wpn                            (wpn                                        ), // output
    .holdn                          (holdn                                      )  // output
);

//sdram model
mt48lc16m16a2 sdram_module_inst(
.Dq	(sdram_data), 
.Addr	(sdram_addr),	 
.Ba	(sdram_ba), 
.Clk	(sdram_clk), 
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
    .usb_clk                        (usb_clk                                    ), // input 
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
