// +FHDR------------------------------------------------------------
//                 Copyright (c) 2022 $COMPANY .
//                       ALL RIGHTS RESERVED
// -----------------------------------------------------------------
// Filename      : tb_qspi2sdram_top.v
// Author        : $USER_DIT 
// Created On    : 2022-06-17 17:11
// Last Modified : 
// -----------------------------------------------------------------
// Description:
//
//
// -FHDR------------------------------------------------------------

module tb_qspi2sdram_top();

//reg qspi_clk;
reg sdram_clk;
reg rst_n;

wire [21:0] 	rd_addr;
wire	   	rd_aready = 1;
wire	   	rd_ready;
reg [15:0] 	rd_data ;

reg             rd_valid = 1;

initial begin
//	qspi_clk = 0;
	sdram_clk = 0;
	rst_n = 0;
#100	rst_n = 1;
end


//always@(*) #25 	qspi_clk <= !qspi_clk;
always@(*) #3.25 sdram_clk <= !sdram_clk;



always@(posedge sdram_clk or negedge rst_n)begin
	if(!rst_n)begin
		rd_data <= 16'ha000;
	end
	else if(rd_valid && rd_ready) begin
		rd_data <= rd_data + 16'd1;
	end
	else
		rd_data <= rd_data;
end




qspi_master_model  vip_inst(/*autoinst*/
    .qspi_clk                       (qspi_clk                                   ), // output
    .csn                            (csn                                        ), // output
    .di                             (di                                         ), // output
    .do                             (do                                         ), // input 
    .wpn                            (wpn                                        ), // output
    .holdn                          (holdn                                      )  // output
);



qspi2sdram_top dut(/*autoinst*/
    .rst_n                          (rst_n                                      ), // input 

    // qspi
    .qspi_clk                       (qspi_clk                                   ), // input 
    .csn                            (csn                                        ), // input 
    .di                             (di                                         ), // input 
    .do                             (do                                         ), // output
    .wpn                            (wpn                                        ), // input 
    .holdn                          (holdn                                      ), // input 

    // sdram ctrl read port
    .sdram_clk                      (sdram_clk                                  ), // input 
    .rd_addr                        (rd_addr[21:0]                              ), // output
    .rd_avalid                      (rd_avalid                                  ), // output
    .rd_aready                      (rd_aready                                  ), // input 
    .rd_data                        (rd_data[15:0]                              ), // input 
    .rd_valid                       (rd_valid                                   ), // input 
    .rd_ready                       (rd_ready                                   )  // output
 );
endmodule
