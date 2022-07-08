// +FHDR------------------------------------------------------------
//                 Copyright (c) 2022 $COMPANY .
//                       ALL RIGHTS RESERVED
// -----------------------------------------------------------------
// Filename      : tb_fpga_sdram_top.v
// Author        : wusha 
// Created On    : 2022-06-13 11:32
// Last Modified : 
// -----------------------------------------------------------------
// Description:
//
//
// -FHDR------------------------------------------------------------
`timescale 1ns/1ps

module tb_fpga_sdram_top();

reg clk,rst_n;

initial begin
	clk 	= 0;
	rst_n 	= 0;
#100	rst_n 	= 1;

end

always@(*) #3.75  clk <= ~clk;



wire [1:0]    sdram_ba    ;  
wire [12:0]   sdram_addr  ; 
wire [15:0]   sdram_data  ;


reg  [15:0]	wr_data    ; 
reg  [21+1:0]	wr_addr    ;
reg  		wr_valid  = 0 ;     
wire  		wr_ready   ;    
reg  [21+1:0]	rd_addr    ;
reg  		rd_avalid = 0 ;    
wire  		rd_aready  ;    
wire  [15:0]	rd_data    ;
wire  		rd_valid   ;    
reg  		rd_ready  = 1 ;    


reg [15:0] cmp_rdata0,cmp_rdata1;
reg [15:0] cmp_wdata0,cmp_wdata1;

reg [15:0] cnt;
reg        cmp_flag0;
reg        cmp_flag1;

initial begin

	wait(dut.sdram_top_inst.sdram_core_inst.sdram_init_done);

	#100;
	repeat(10000) begin
		#5000;
			wr_valid <= 1;
		#50;
		       	wr_valid <= 0;

		#1000;
			rd_avalid <= 1;
		#30;
			rd_avalid <= 0;

		#10000;
	end

	$display("all done !!!  \n");
	$finish;

end


always@(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		wr_data <= 16'd0;
	end
	else if(wr_valid && wr_ready)begin
		wr_data <= wr_data + 16'd1;
	end
end

always@(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		cmp_wdata0 <= 16'd0;
		cmp_wdata1 <= 16'd0;
	end
	else if(wr_valid && wr_ready) begin
		cmp_wdata1 <= wr_data;
		cmp_wdata0 <= cmp_wdata1;
	end
end

always@(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		rd_addr   = 23'd0;
		wr_addr   = 23'd0;
	end
	else if(rd_avalid && rd_aready)begin
		rd_addr <= rd_addr + 23'd4;
		wr_addr <= wr_addr + 23'd4;
	end
end


//
always@(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		cmp_rdata0 <= 16'd0;
		cmp_rdata1 <= 16'd0;
	end
	else if(rd_valid && rd_ready) begin
		cmp_rdata1 <= rd_data;
		cmp_rdata0 <= cmp_rdata1;
	end
end




//
always@(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		cnt <= 16'd0;
	end
	else if(cmp_flag1 && !cmp_flag0)begin
		if((cmp_wdata0 != cmp_rdata0) || (cmp_wdata1 != cmp_rdata1)) begin
			$display("erro..!! data0: %d-%d,data1: %d-%d. cnt=%d, \n",cmp_wdata0,cmp_rdata0,cmp_wdata1,cmp_rdata1,cnt);
			$finish;
		end
		else begin
			cnt <= cnt + 1;
			$display("successfull cnt = %d \n",cnt);
		end
	end
end

always@(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		cmp_flag0 <= 0;
		cmp_flag1 <= 0;
	end
	else if(rd_valid && rd_ready) begin
		cmp_flag0 <= 1;
		cmp_flag1 <= cmp_flag0;
	end
	else begin
		cmp_flag0 <= 0;
		cmp_flag1 <= cmp_flag0;
	end

end




fpga_sdram_top dut(/*autoinst*/
    .clk                            (clk                                        ), // input 
    .rst_n                          (rst_n                                      ), // input 

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
    .sdram_dqmh                     (sdram_dqmh	                                ), // output 
    .sdram_dqml                     (sdram_dqml	                                ), // output 

    	//
    .wr_data                        (wr_data[15:0]                              ), // input 
    .wr_addr                        (wr_addr[22:1]                              ), // input  4byte
    .wr_valid                       (wr_valid                                   ), // input 
    .wr_ready                       (wr_ready                                   ), // output

    .rd_addr                        (rd_addr[22:1]                              ), // input  4byte
    .rd_avalid                      (rd_avalid                                  ), // input 
    .rd_aready                      (rd_aready                                  ), // output
    .rd_data                        (rd_data[15:0]                              ), // output
    .rd_valid                       (rd_valid                                   ), // output
    .rd_ready                       (rd_ready                                   )  // input 

);



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

endmodule
//Local Variables:
//verilog-library-directories:(".")
//verilog-library-directories:("D:\88-ISE_share\spi-simulator\design_rtl\sim_model\sdram_model")
//End:


