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
	// inner  if
	output [4:0]    init_state,
	output [4:0]    work_state,
	output reg [4:0]  cur_init_state,
	output reg [4:0]  cur_work_state,

	// sdram t 
	input      	end_trp,        // 预充电结束
	input      	end_trfc,       // 结束自动刷新
	input      	end_tmrd,       // 模式寄存器设置结束
	input      	end_trcd,       // 行地址命令延迟结束 
	input      	end_tcl,        // 列地址命令延迟结束
	input      	end_tread,      // 读数据结束，时间与BL有关
	input      	end_twait,      // 完成读之后得预充电等待结束
	input      	end_twrite,     // 写数据结束
	input      	end_tdal,       // 写完数据后等待结束

	//sdram_t
	input      	done_200us,
	input      	ref_domain,     // 刷新时间域
	input      	sdram_ref_req,  // 刷新请求
	output      	sdram_ref_ack,  // 刷新请求响应

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
//SDRAM的初始化操作状态机
//------------------------------------------------------------------------------
reg[4:0] init_state_r;	// SDRAM初始化状态



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

			I_DONE:	init_state_r <= I_DONE;		// SDRAM的初始化设置完成
			
			default: init_state_r <= I_POWON;
		endcase
	end


assign init_state = init_state_r;
assign sdram_init_done = (init_state_r == I_DONE);		// SDRAM初始化完成标志




//------------------------------------------------------------------------------
//SDRAM的读写以及自刷新操作状态机
//------------------------------------------------------------------------------
reg[4:0] work_state_r;	// SDRAM读写状态
//reg sdram_r_wn;			// SDRAM读/写控制信号



always @ (posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		work_state_r <= S_IDLE;
	end
	else begin
		case (work_state_r)
			S_IDLE:	begin
				if(sdram_init_done)begin
					if(sdram_ref_req)          // if have the priority               
						work_state_r <= S_AR;
					else if(sdram_wr_req || sdram_rd_req)  // actually only one will occur, so no need a arbiter here
						//work_state_r <= S_RAS_ACTIVE;
						work_state_r <= S_NOP;
					else
						work_state_r <= S_IDLE;
				end
			end
			
			S_NOP:begin
					work_state_r <= S_RAS_ACTIVE;
			end

			S_RAS_ACTIVE: begin   // 行地址命令
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
					
			S_RD_CMD: begin   //读地址列命令
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
					work_state_r <= S_IDLE;
					//work_state_r <= S_R_PRECHARGE;
				else
					work_state_r <= S_RD_DATA;
			end

			S_R_PRECHARGE: begin
				work_state_r <= S_RWAIT;
			end
			
			S_RWAIT: begin  // tPR 读完之后的预充电操作
				if(end_twait)
					work_state_r <= S_IDLE;
				else
					work_state_r <= S_RWAIT;
			end
			
			S_WR_CMD: begin // 写列地址命令
				work_state_r <= S_WR_DATA;
			end

			S_WR_DATA: begin
				if(end_twrite)
					work_state_r <= S_TDAL;
				else
					work_state_r <= S_WR_DATA;
			end
			
			S_TDAL: begin  // tWR 写完数据后 需要等1clk+7.5ns = 2 周期 + (with auto precharge)tRP(3) = 5
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
			
			default: work_state_r <= S_IDLE;
		endcase
	end
end

assign work_state = work_state_r;		// SDRAM工作状态寄存器
assign sdram_ref_ack = (work_state_r == S_AR);		// SDRAM自刷新应答信号


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

// 因为寄存器延迟一个周期响应，所以输出的信号比状态机迟一个周期，
// 定义这个寄存器用于对齐当前输出真实信号状态值

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


//当次写请求响应信号 一个周期
assign sdram_wr_ack = (work_state_r == S_WR_CMD);  		
//当次读请求响应信号 一个周期
assign sdram_rd_ack = (work_state_r == S_RD_CMD);		

//assign sdram_wr_data_valid = (cur_work_state == S_WR_CMD || cur_work_state == S_WR_DATA);
reg sdram_wr_data_valid;
always@(*)begin
	if(cur_work_state == S_WR_CMD || cur_work_state == S_WR_DATA)
		sdram_wr_data_valid = 1;
	else
	   sdram_wr_data_valid = 0;
		
end

endmodule
