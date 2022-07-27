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

	output      end_trp,        // 预充电结束
	output      end_trfc,       // 结束自动刷新
	output      end_tmrd,       // 模式寄存器设置结束
	output      end_trcd,       // 行地址命令延迟结束 
	output      end_tcl,        // 列地址命令延迟结束
	output      end_tread,      // 读数据结束，时间与BL有关
	output      end_twait,      // 完成读之后得预充电等待结束
	output      end_twrite,     // 写数据结束
	output      end_tdal,       // 写完数据后等待结束

	output      sdram_data_i_valid, //

	output      done_200us,
	output      ref_domain,     // 刷新时间域

	input       sdram_wr_req,
	input       sdram_rd_req,
	output reg  sdram_ref_req,  // 刷新请求
	input       sdram_ref_ack   // 刷新响应


	
);


`include "sdram_param.v"

//------------------------------------------------------------------------------
//每60ms全部4096行存储区进行一次自刷新
// ( 存储体中电容的数据有效保存期上限是64ms )
// 平均下来 每完成一次刷新需要15us
//------------------------------------------------------------------------------	 
reg[31:0] ref_cnt;
wire      ref_60ms;
wire      ref_domain;

reg       ref_req_r0,ref_req_r1;

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

assign ref_60ms = (ref_cnt == T_REFRESH_PERIOD);

// during the period no read and write requrst 
assign ref_domain = ( ref_cnt>=(T_REFRESH_PERIOD - 31'd100) && ref_cnt<=T_REFRESH_PERIOD );

always@(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		ref_req_r0 <= 0;
		ref_req_r1 <= 0;
	end
	else begin
		ref_req_r0 <= ref_domain;
		ref_req_r1 <= ref_req_r0;
	end
end


always@(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		sdram_ref_req <= 0;
	end
	else if(ref_req_r0 && !ref_req_r1)begin // posedge
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
//上电后200us计时,计时时间到,则done_200us=1
//------------------------------------------------------------------------------
reg[14:0] cnt_200us; 
always @ (posedge clk or negedge rst_n) 
	if(!rst_n) 
		cnt_200us <= 15'd0;
	else if(cnt_200us < 15'd26_667) 
		cnt_200us <= cnt_200us+1'b1;	//计数
	else
		cnt_200us <= cnt_200us;

assign done_200us = (cnt_200us == 15'd26_667);

//------------------------------------------------------------------------------
//产生SDRAM时序操作的延时计数器
//------------------------------------------------------------------------------

reg[8:0] cnt_clk_r;	//时钟计数
wire cnt_rst_n;		//时钟计数复位信号	
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
	            || (work_state == S_TRFC && end_trfc)
					|| (work_state == S_TRFC1 && end_trfc)
		   ); 


always @ (posedge clk or negedge rst_n) 
	if(!rst_n) 
		cnt_clk_r <= 9'd0;			//计数寄存器复位
	else if(!cnt_rst_n) 
		cnt_clk_r <= 9'd0;	//计数寄存器清零
	else 
		cnt_clk_r <= cnt_clk_r + 1'b1;		//启动计数延时
	
assign cnt_clk = cnt_clk_r;			//计数寄存器引出，内部`define中使用 


// 各阶段结束标志位, cnt_rst_n is register delay 1 clk

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
//always@(negedge clk or negedge rst_n) begin
always@(posedge clk or negedge rst_n) begin
	if(!rst_n)
		sdram_data_i_valid <= 0;
	else if(cur_work_state == S_RD_DATA)
		sdram_data_i_valid <= 1;
	else
	   sdram_data_i_valid <= 0;
end	

endmodule


