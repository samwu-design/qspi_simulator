// +FHDR------------------------------------------------------------
//                 Copyright (c) 2022 $COMPANY .
//                       ALL RIGHTS RESERVED
// -----------------------------------------------------------------
// Filename      : tb_cyp2sdram.v
// Author        : wusha 
// Created On    : 2022-06-16 14:37
// Last Modified : 
// -----------------------------------------------------------------
// Description:
//
//
// -FHDR------------------------------------------------------------

module tb_cyp2sdram();

reg cyp_clk,sdram_clk,rst_n;
reg [15:0] usb_fd_i;
wire  wr_ready = 1;

wire [1:0]  usb_fifoaddr;
wire [15:0] usb_fd_o;
wire [15:0] wr_data;
wire [21:0] wr_addr;

initial begin
	cyp_clk = 0;
	sdram_clk = 0;
	rst_n = 0;
	usb_fd_i = 16'd0;
	#100;
	rst_n = 1;
end


always@(*) #3.25 sdram_clk <= !sdram_clk; //133mhz
always@(*) #10 cyp_clk <= !cyp_clk; //48mhz

	
always@(posedge cyp_clk or negedge rst_n)begin
	if(!rst_n)begin
		usb_fd_i <= 16'd0;
	end
	else if(!usb_slrd) begin
		if(usb_fd_i == 16'd256)
			usb_fd_i <= usb_fd_i;
		else
			usb_fd_i <= usb_fd_i + 1;
	end
end

assign  usb_flaga = !(usb_fd_i == 16'd256);





cyp2sdram_top dut_inst(/*autoinst*/
    .cyp_clk                        (cyp_clk                                    ), // input 
    .sdram_clk                      (sdram_clk                                  ), // input 
    .rst_n                      (rst_n                                  ), // input 
    	
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
    	
    .usb_flaga                      (usb_flaga                                 ), // input 
    .usb_flagb                      (1                                  ), // input 
    .usb_flagc                      (1                                  ), // input 
    .pa0                            (pa0                                        ), // output

    		//
    .wr_data                        (wr_data[15:0]                              ), // output
    .wr_addr                        (wr_addr[21:0]                              ), // output
    .wr_valid                       (wr_valid                                   ), // output
    .wr_ready                       (wr_ready                                   )  // input 
);

endmodule
