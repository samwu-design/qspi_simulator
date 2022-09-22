// +FHDR------------------------------------------------------------
//                 Copyright (c) 2022 $COMPANY .
//                       ALL RIGHTS RESERVED
// -----------------------------------------------------------------
// Filename      : sdram_top.v
// Author        : wusha 
// Created On    : 2022-06-06 15:55
// Last Modified : 
// -----------------------------------------------------------------
// Description:
//
//
// -FHDR------------------------------------------------------------

module sdram_top(
	
	input   	clk,   // 133
	input   	rst_n,
	output          sdram_init_done,
	// sdram if
//	output          sdram_clk, // 133mhz
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


	//
	input [15:0] 	wr_data,
	input [31:0] 	wr_addr,
	input           wr_valid,
	output          wr_ready,

   input          forbiden_autofresh,
	input [23:0] 	rd_addr,
	input 		rd_avalid,
	output          rd_aready,
	output [15:0]	rd_data,	
	output          rd_valid,
	input           rd_ready



);

//assign  sdram_clk = clk;

//

wire [4:0]	init_state    ;  
wire [4:0]	work_state    ;  
wire [4:0]	cur_init_state    ;  
wire [4:0]	cur_work_state    ;  
wire 		end_trp       ;       
wire 		end_trfc      ;       
wire 		end_tmrd      ;       
wire 		end_trcd      ;       
wire 		end_tcl       ;       
wire 		end_tread     ;       
wire 		end_twait     ;       
wire 		end_twrite    ;       
wire 		end_tdal      ;       
wire 		done_200us    ;       
wire 		ref_domain    ;       
wire 		sdram_ref_req ;       
wire 		sdram_ref_ack ;       
wire 		sdram_rd_req  ;       
wire 		sdram_rd_ack  ;       
wire 		sdram_wr_req  ;       
wire 		sdram_wr_ack  ;       


wire		sdram_r_wn    ;     
wire [23:0]	sys_wraddr    ;
wire [23:0]	sys_rdaddr    ;


wire 		sdram_data_i_valid  ; 
wire [15:0]	sdram_data_i  	    ; 
wire [15:0]	sdram_data_o  	    ; 
wire 		sdram_data_oe       ; 



sdram_core sdram_core_inst(/*autoinst*/
    	// sys if
    .clk                            (clk                                        ), // input 
    .rst_n                          (rst_n                                      ), // input 
    .sdram_init_done                (sdram_init_done                            ), // output
	 .forbiden_autofresh             (forbiden_autofresh                         ), //input
    	// inner  if
    .init_state                     (init_state[4:0]                            ), // output
    .work_state                     (work_state[4:0]                            ), // output
    .cur_init_state                 (cur_init_state[4:0]                            ), // output
    .cur_work_state                 (cur_work_state[4:0]                            ), // output

    	// sdram t 
    .end_trp                        (end_trp                                    ), // input 
    .end_trfc                       (end_trfc                                   ), // input 
    .end_tmrd                       (end_tmrd                                   ), // input 
    .end_trcd                       (end_trcd                                   ), // input 
    .end_tcl                        (end_tcl                                    ), // input 
    .end_tread                      (end_tread                                  ), // input 
    .end_twait                      (end_twait                                  ), // input 
    .end_twrite                     (end_twrite                                 ), // input 
    .end_tdal                       (end_tdal                                   ), // input 

    	//sdram_t
    .done_200us                     (done_200us                                 ), // input 
    .ref_domain                     (ref_domain                                 ), // input 
    .sdram_ref_req                  (sdram_ref_req                              ), // input 
    .sdram_ref_ack                  (sdram_ref_ack                              ), // output

    	// sdram_data 
    .sdram_r_wn                     (sdram_r_wn                                 ), // output 
    .sdram_rd_req                   (sdram_rd_req                               ), // input 
    .sdram_rd_ack                   (sdram_rd_ack                               ), // output

    .sdram_wr_req                   (sdram_wr_req                               ), // input
    .sdram_wr_data_valid            (sdram_wr_data_valid                          ), // output 
    .sdram_wr_ack                   (sdram_wr_ack                               )  // output

);


sdram_t sdram_t_inst(/*autoinst*/
    .clk                            (clk                                        ), // input 
    .rst_n                          (rst_n                                      ), // input 

    .init_state                     (init_state[4:0]                            ), // input 
    .work_state                     (work_state[4:0]                            ), // input 
    .cur_init_state                 (cur_init_state[4:0]                        ), // input
    .cur_work_state                 (cur_work_state[4:0]                        ), // input

    .end_trp                        (end_trp                                    ), // output
    .end_trfc                       (end_trfc                                   ), // output
    .end_tmrd                       (end_tmrd                                   ), // output
    .end_trcd                       (end_trcd                                   ), // output
    .end_tcl                        (end_tcl                                    ), // output
    .end_tread                      (end_tread                                  ), // output
    .end_twait                      (end_twait                                  ), // output
    .end_twrite                     (end_twrite                                 ), // output
    .end_tdal                       (end_tdal                                   ), // output

    .sdram_data_i_valid             (sdram_data_i_valid                         ), // output
    
    .done_200us                     (done_200us                                 ), // output
    .ref_domain                     (ref_domain                                 ), // output
    .sdram_rd_req                   (sdram_rd_req                               ), // input 
    .sdram_wr_req                   (sdram_wr_req                               ), // input 
    .sdram_ref_req                  (sdram_ref_req                              ), // output
    .sdram_ref_ack                  (sdram_ref_ack                              )  // input 

);


sdram_cmd sdram_cmd_inst(/*autoinst*/
    .clk                            (clk                                        ), // input 
    .rst_n                          (rst_n                                      ), // input 

    	// sdram if
    .sdram_cke                      (sdram_cke                                  ), // output
    .sdram_csn                      (sdram_csn                                  ), // output
    .sdram_rasn                     (sdram_rasn                                 ), // output
    .sdram_casn                     (sdram_casn                                 ), // output
    .sdram_wen                      (sdram_wen                                  ), // output
    .sdram_ba                       (sdram_ba[1:0]                              ), // output
    .sdram_addr                     (sdram_addr[12:0]                           ), // output

    	// 
    .sdram_r_wn                     (sdram_r_wn                                 ), // input	
    .init_state                     (init_state[4:0]                            ), // input 
    .work_state                     (work_state[4:0]                            ), // input 

    	// 
    .sys_wraddr                     (sys_wraddr[23:0]                           ), // input 
    .sys_rdaddr                     (sys_rdaddr[23:0]                           )  // input 
);


sdram_data sdram_data_inst(/*autoinst*/
    .clk                            (clk                                        ), // input 
    .rst_n                          (rst_n                                      ), // input 

    	//
    .init_state                     (init_state[4:0]                            ), // input 
    .work_state                     (work_state[4:0]                            ), // input 
    .cur_init_state                 (cur_init_state[4:0]                        ), // input
    .cur_work_state                 (cur_work_state[4:0]                        ), // input
    .sdram_r_wn                     (sdram_r_wn                                 ), // input 
    .end_twrite                     (end_twrite                                 ), // input 
    .end_tread                      (end_tread                                  ), // input 

    .sdram_data_i_valid             (sdram_data_i_valid                         ), // input 
    .sdram_data_i                   (sdram_data_i[15:0]                         ), // input 
    .sdram_data_o                   (sdram_data_o[15:0]                         ), // output
    .sdram_data_oe                  (sdram_data_oe                              ), // output

    .sys_wraddr                     (sys_wraddr[23:0]                           ), // output
    .sys_rdaddr                     (sys_rdaddr[23:0]                           ), // output

    .sdram_rd_req                   (sdram_rd_req                               ), // output
    .sdram_rd_ack                   (sdram_rd_ack                               ), // input 
    .sdram_wr_req                   (sdram_wr_req                               ), // output
    .sdram_wr_ack                   (sdram_wr_ack                               ), // input 
    .sdram_wr_data_valid	            (sdram_wr_data_valid                          ), // input 

    	//
    .wr_data                        (wr_data[15:0]                              ), // input 
    .wr_addr                        (wr_addr[31:0]                              ), // input 
    .wr_valid                       (wr_valid                                   ), // input 
    .wr_ready                       (wr_ready                                   ), // output

    .rd_addr                        (rd_addr[23:0]                              ), // input 
    .rd_avalid                      (rd_avalid                                  ), // input 
    .rd_aready                      (rd_aready                                  ), // output
    .rd_data                        (rd_data[15:0]                              ), // output
    .rd_valid                       (rd_valid                                   ), // output
    .rd_ready                       (rd_ready                                   )  // input 

);

endmodule
//Local Variables:
//verilog-library-directories:("")
//End:
