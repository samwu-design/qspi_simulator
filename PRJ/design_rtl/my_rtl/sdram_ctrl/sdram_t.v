// +FHDR------------------------------------------------------------
//                 Copyright (c) 2022 $COMPANY .
//                       ALL RIGHTS RESERVED
// -----------------------------------------------------------------
// Filename      : sdram_t.v
// Author        : wusha
// Created On    : 2022-06-09 08:39
// Last Modified : 
// -----------------------------------------------------------------
// Description:
//              time control flag
//
// -FHDR------------------------------------------------------------



module sdram_t(
	input  clk,
	input  rst_n,

	input [4:0] init_state,
	input [4:0] work_state,
	input [4:0] cur_init_state,
	input [4:0] cur_work_state,

	output      end_trp,        // 
	output      end_trfc,       // 
	output      end_tmrd,       // 
	output      end_trcd,       //  
	output      end_tcl,        // 
	output      end_tread,      // BL
	output      end_twait,      // 
	output      end_twrite,     // 
	output      end_tdal,       // 

	output      sdram_data_i_valid, //

	output      done_200us,
	output      ref_domain,     // 

	input       sdram_wr_req,
	input       sdram_rd_req,
	output reg  sdram_ref_req,  // 
	input       sdram_ref_ack   // 


	
);


`include "sdram_param.v"

//------------------------------------------------------------------------------
//60ms4096
// ( 64ms )
//  15us
//------------------------------------------------------------------------------	 
reg[31:0] ref_cnt;
wire      ref_period;
wire      ref_domain;

//reg       ref_req_r0,ref_req_r1;

always@(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		ref_cnt <= 11'd0;
	end
	else if(ref_cnt == T_REFRESH_PERIOD)begin
		ref_cnt <= 11'd0;
	end
	else begin
		ref_cnt <= ref_cnt + 1;
	end
end 

assign ref_period = (ref_cnt == T_REFRESH_PERIOD);

// during the period no read and write requrst 
//assign ref_domain = ( ref_cnt>=(T_REFRESH_PERIOD - T_REFRESH_DOMAIN) && ref_cnt<=T_REFRESH_PERIOD );
assign ref_domain = (ref_cnt == T_REFRESH_PERIOD);

//always@(posedge clk or negedge rst_n)begin
//	if(!rst_n)begin
//		ref_req_r0 <= 0;
//		ref_req_r1 <= 0;
//	end
//	else begin
//		ref_req_r0 <= ref_domain;
//		ref_req_r1 <= ref_req_r0;
//	end
//end
//
//
//always@(posedge clk or negedge rst_n)begin
//	if(!rst_n)begin
//		sdram_ref_req <= 0;
//	end
//	else if(ref_req_r0 && !ref_req_r1)begin // posedge
//		sdram_ref_req <= 1;
//	end
//	else if(sdram_ref_ack)begin  // negedge
//		sdram_ref_req <= 0;
//	end
//	else begin
//		sdram_ref_req <= sdram_ref_req;
//	end
//end

always@(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		sdram_ref_req <= 1;
	end
	else if(ref_period)begin // posedge
		sdram_ref_req <= 1;
	end
	else if(sdram_ref_ack)begin  // negedge
		sdram_ref_req <= 0;
	end
	else begin
		sdram_ref_req <= sdram_ref_req;
	end
end


//------------------------------------------------------------------------------
//200us,,done_200us=1
//------------------------------------------------------------------------------
reg[14:0] cnt_200us; 
always @ (posedge clk or negedge rst_n) 
	if(!rst_n) 
		cnt_200us <= 15'd0;
	else if(cnt_200us < 15'd26_667) 
		cnt_200us <= cnt_200us+1'b1;	//
	else
		cnt_200us <= cnt_200us;

assign done_200us = (cnt_200us == 15'd26_667);

//------------------------------------------------------------------------------
//SDRAM
//------------------------------------------------------------------------------

reg[8:0] cnt_clk_r;	//
wire cnt_rst_n;		//	
//assign cnt_rst_n = ~((cur_init_state != init_state) || (cur_work_state != work_state));
assign cnt_rst_n = ~((init_state == I_POWON && done_200us) 
	            || (init_state == I_PRE_TRP && end_trp) 
	            || (init_state == I_AR0_TRFC && end_trfc) 
	            || (init_state == I_AR1_TRFC && end_trfc) 
	            || (init_state == I_MRS_TMRD && end_tmrd) 
	            || (init_state == I_DONE && work_state == S_IDLE && (sdram_wr_req || sdram_rd_req)) 
	            || (work_state == S_TRCD && end_trcd) 
	            || (work_state == S_CL && end_tcl) 
	            || (work_state == S_RD_DATA && end_tread) 
	            || (work_state == S_RWAIT && end_twait) 
	            || (work_state == S_WR_DATA && end_twrite) 
	            || (work_state == S_TDAL && end_tdal)
               || (work_state == S_AR) 					
	            || (work_state == S_TRFC && end_trfc)
					|| (work_state == S_AR1)
					|| (work_state == S_TRFC1 && end_trfc)				
		   ); 


always @ (posedge clk or negedge rst_n) 
	if(!rst_n) 
		cnt_clk_r <= 9'd0;			//
	else if(!cnt_rst_n) 
		cnt_clk_r <= 9'd0;	//
	else 
		cnt_clk_r <= cnt_clk_r + 1'b1;		//
	
assign cnt_clk = cnt_clk_r;			//`define 


// , cnt_rst_n is register delay 1 clk

assign end_trp 	     = (init_state == I_PRE_TRP) && (cnt_clk_r == TRP -1)	;     
assign end_trfc	     = (init_state == I_AR0_TRFC || init_state == I_AR1_TRFC || work_state == S_TRFC || work_state == S_TRFC1) && (cnt_clk_r == TRFC-1)	;    
assign end_tmrd	     = (init_state == I_MRS_TMRD) && (cnt_clk_r == TMRD-1)	;    
assign end_trcd	     = (work_state == S_TRCD) && (cnt_clk_r == TRCD-1)	;    
assign end_tcl 	     = (work_state == S_CL) && (cnt_clk_r == TCL -1)	;      
assign end_twait     = (work_state == S_RWAIT) && (cnt_clk_r == TRP -1)	;   
assign end_tdal	     = (work_state == S_TDAL) && (cnt_clk_r == TDAL-1)	;    
assign end_tread     = (work_state == S_RD_DATA) && (cnt_clk_r == R_BL-1)	;   
assign end_twrite    = (work_state == S_WR_DATA) && (cnt_clk_r == W_BL-1)	;  

//assign sdram_data_i_valid = cur_work_state == S_RD_DATA;
reg sdram_data_i_valid;
always@(posedge clk or negedge rst_n) begin
//always@(negedge clk or negedge rst_n) begin
	if(!rst_n)
		sdram_data_i_valid <= 0;
	else if(cur_work_state == S_RD_DATA)
		sdram_data_i_valid <= 1;
	else
		sdram_data_i_valid <= 0;
end	



endmodule


