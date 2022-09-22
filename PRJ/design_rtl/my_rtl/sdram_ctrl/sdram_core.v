// +FHDR------------------------------------------------------------
//                 Copyright (c) 2022 $COMPANY .
//                       ALL RIGHTS RESERVED
// -----------------------------------------------------------------
// Filename      : sdram_core.v
// Author        : wusha 
// Created On    : 2022-06-07 13:40
// Last Modified : 
// -----------------------------------------------------------------
// Description:
// Device	: MT48LC16M16A2SD_75  CL=3 SETUP=1.5ns HOLD=0.8ns
// T -> F:10ns --> 100mhz
//         8ns --> 125mhz
//       7.5ns --> 133mhz  ***
//         6ns --> 166mhz
// -FHDR------------------------------------------------------------


module sdram_core(
	// sys if
	input  		clk,
	input  		rst_n,

	output          sdram_init_done,
   input           forbiden_autofresh,	
	// inner  if
	output [4:0]    init_state,
	output [4:0]    work_state,
	output reg [4:0]  cur_init_state,
	output reg [4:0]  cur_work_state,

	// sdram t 
	input      	end_trp,        // 
	input      	end_trfc,       // 
	input      	end_tmrd,       // 
	input      	end_trcd,       //  
	input      	end_tcl,        // 
	input      	end_tread,      // BL
	input      	end_twait,      // 
	input      	end_twrite,     // 
	input      	end_tdal,       // 

	//sdram_t
	input      	done_200us,
	input      	ref_domain,     // 
	input      	sdram_ref_req,  // 
	output      	sdram_ref_ack,  // 

	// sdram_data 
	output  reg 	sdram_r_wn,
	input 		sdram_rd_req,	
	output 		sdram_rd_ack,

	input 		sdram_wr_req,
	output          sdram_wr_data_valid,	
	output 		sdram_wr_ack
);

 
`include "sdram_param.v"


// sdram initial

//------------------------------------------------------------------------------
//SDRAM
//------------------------------------------------------------------------------
reg[4:0] init_state_r;	// SDRAM



always@(posedge clk or negedge rst_n)
	if(!rst_n) 
		init_state_r <= I_POWON;
	else begin
		case (init_state_r)
			I_POWON: 	begin
				if(done_200us)
					init_state_r <= I_PRE_CMD;
				else
					init_state_r <= I_POWON;
			end

			I_PRE_CMD:begin
				init_state_r <= I_PRE_TRP;
			end

			I_PRE_TRP: begin
				if(end_trp)
					init_state_r <= I_AR0_CMD;
				else
					init_state_r <= I_PRE_TRP;
			end

			I_AR0_CMD:begin
				init_state_r <= I_AR0_TRFC;
			end

			I_AR0_TRFC: begin
				if(end_trfc)
					init_state_r <= I_AR1_CMD;	
				else
					init_state_r <= I_AR0_TRFC;
			end

			I_AR1_CMD:begin
				init_state_r <= I_AR1_TRFC;
			end


			I_AR1_TRFC: begin
				if(end_trfc)
					init_state_r <= I_MRS_CMD;	
				else
					init_state_r <= I_AR1_TRFC;
			end

			I_MRS_CMD:begin
				init_state_r <= I_MRS_TMRD;	
			end	

			I_MRS_TMRD: begin
				if(end_tmrd) 
					init_state_r <= I_DONE;
				else
					init_state_r <= I_MRS_TMRD;

			end

			I_DONE:	init_state_r <= I_DONE;		// SDRAM
			
			default: init_state_r <= I_POWON;
		endcase
	end


assign init_state = init_state_r;
assign sdram_init_done = (init_state_r == I_DONE);		// SDRAM




//------------------------------------------------------------------------------
//SDRAM
//------------------------------------------------------------------------------
reg[4:0] work_state_r;	// SDRAM


always @ (posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		work_state_r <= S_IDLE;
	end
	else begin
		case (work_state_r)
			S_IDLE:	begin

				if(sdram_init_done)begin
					if(forbiden_autofresh)begin
						if(sdram_rd_req)
							work_state_r <= S_NOP;
							//work_state_r <= S_RAS_ACTIVE;
						else
						   work_state_r <= S_IDLE;
					end
					else begin
					   if(sdram_ref_req)
						   work_state_r <= S_AR;
					   else if(sdram_wr_req)
						   work_state_r <= S_NOP;
						   //work_state_r <= S_RAS_ACTIVE;
						else
						   work_state_r <= S_IDLE;
					end
				end
				else begin
				   work_state_r <= S_IDLE;
				end			 
			end
			
			S_NOP:begin
					work_state_r <= S_RAS_ACTIVE;
			end

			S_RAS_ACTIVE: begin   // 
					work_state_r <= S_TRCD;
			end

			S_TRCD:	begin  // wait ras delay   CL
				if(end_trcd) begin
					if(sdram_r_wn)
						work_state_r <= S_RD_CMD;
					else 
						work_state_r <= S_WR_CMD;
				end
				else 
					work_state_r <= S_TRCD;
			end
					
			S_RD_CMD: begin   //
				work_state_r <= S_CL;
			end
			
			S_CL: begin
				if(end_tcl)
					work_state_r <= S_RD_DATA;
				else
					work_state_r <= S_CL;
			end

			S_RD_DATA: begin
				if(end_tread)
					//work_state_r <= S_IDLE;
					work_state_r <= S_R_END;
				else
					work_state_r <= S_RD_DATA;
			end

			S_R_PRECHARGE: begin
				work_state_r <= S_RWAIT;
			end
			
			S_RWAIT: begin  // tPR 
				if(end_twait)
					work_state_r <= S_IDLE;
				else
					work_state_r <= S_RWAIT;
			end
			
			S_WR_CMD: begin // 
				work_state_r <= S_WR_DATA;
			end

			S_WR_DATA: begin
				if(end_twrite)
					work_state_r <= S_TDAL;
				else
					work_state_r <= S_WR_DATA;
			end
			
			S_TDAL: begin  // tWR  1clk+7.5ns = 2  + (with auto precharge)tRP(3) = 5
				if(end_tdal)
					work_state_r <= S_IDLE;  // read mode is autoprecharge
					//work_state_r <= S_R_PRECHARGE;
				else
					work_state_r <= S_TDAL;
			end
		
			// auto fresh	
			S_AR: begin
				work_state_r <= S_TRFC;
			end	

			S_TRFC:	begin
				if(end_trfc)
					work_state_r <= S_AR1;      // suggest twice for autorefresh
					//work_state_r <= S_IDLE;
				else
					work_state_r <= S_TRFC;
			end
			
			// auto fresh	
			S_AR1: begin
				work_state_r <= S_TRFC1;
			end	

			S_TRFC1:	begin
				if(end_trfc)
					work_state_r <= S_IDLE;
				else
					work_state_r <= S_TRFC1;
			end
			
			S_R_END: work_state_r <= S_IDLE;
			
			default: work_state_r <= S_IDLE;
		endcase
	end
end

assign work_state = work_state_r;		// SDRAM
assign sdram_ref_ack = (work_state_r == S_AR);		// SDRAM


//write flag
always@(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		sdram_r_wn <= 1'b1;
	end
	else if(work_state_r == S_IDLE && sdram_init_done) begin // write
		if(sdram_wr_req)
			sdram_r_wn <= 1'b0;
		else if(sdram_rd_req)
			sdram_r_wn <= 1'b1;
		else
			sdram_r_wn <= sdram_r_wn;
	end
	else
		sdram_r_wn <= sdram_r_wn;
end

// 
// 

always@(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		cur_init_state <= 5'd0;
		cur_work_state <= 5'd0;
	end
	else begin
		cur_init_state <= init_state_r ;
		cur_work_state <= work_state_r ;
	end
end


// 
assign sdram_wr_ack = (work_state_r == S_WR_CMD);  		 
assign sdram_rd_ack = (work_state_r == S_RD_CMD);	
	
//reg sdram_rd_ack,sdram_wr_ack;
//always@(posedge clk or negedge rst_n)begin
//	if(!rst_n)
//		sdram_rd_ack <= 1'b0;
//	else if(work_state_r == S_RD_CMD)
//		sdram_rd_ack <= 1'b1 ;
//	else
//	   sdram_rd_ack <= 1'b0;
//end
//always@(posedge clk or negedge rst_n)begin
//	if(!rst_n)
//		sdram_wr_ack <= 1'b0;
//	else if(work_state_r == S_WR_CMD)
//		sdram_wr_ack <= 1'b1 ;
//	else
//	   sdram_wr_ack <= 1'b0;
//end

//assign sdram_wr_data_valid = (cur_work_state == S_WR_CMD || cur_work_state == S_WR_DATA);
reg sdram_wr_data_valid;
always@(*)begin
	if(cur_work_state == S_WR_CMD || cur_work_state == S_WR_DATA)
		sdram_wr_data_valid = 1;
	else
	   sdram_wr_data_valid = 0;
		
end


//`ifdef DEBUG_ILA
//wire[35:0] CONTROL;
//wire[25:0] trig0;
//	
//assign trig0 = {
//               ref_domain,sdram_ref_ack,               
//               sdram_ref_req,forbiden_autofresh,
//               sdram_rd_req,sdram_rd_ack,
//					cur_work_state,work_state_r,
//					sdram_r_wn,end_trp,end_trfc,end_tmrd,end_trcd,end_tcl,end_tread,end_twait,end_twrite,end_tdal
//					};	
//
//chipscope_icon icon_inst(
//    .CONTROL0  (CONTROL)
//);	
//	
//chipscope_ila_3  db_ila_inst(
//    .CONTROL	(CONTROL),
//	 .CLK			(clk),
//    .TRIG0		(trig0)
//	 );
// `endif



endmodule
