// +FHDR------------------------------------------------------------
//                 Copyright (c) 2022 $COMPANY .
//                       ALL RIGHTS RESERVED
// -----------------------------------------------------------------
// Filename      : sdram_cmd.v
// Author        : wusha 
// Created On    : 2022-06-09 16:52
// Last Modified : 
// -----------------------------------------------------------------
// Description:
//
// Mode Register Definition
// 		A[12]		: RESERVED = 0;
//		A[11-10]	: BA1,BA0;
//		A[9]		: Write Burst Mode; 
//				 	0-programed burst length; --- * 
//				 	1-single location access;
//		A[8:7]		: OP Mode
//					00-stand op;       --- *
//					xx-reserved;
//		A[6:4]		: CAS Latency;
//					010 : CL=2;
//					011 : CL=3;        --- *
//					XXX : reserved;
//		A[3]		: Burst Type
//					0 : sequential     --- *
//					1 : interleaved
//		a[2:0]		: burst length
//					000: BL=1;
//					001: BL=2;         --- *
//					010: BL=4;
//					011: BL=8;
//					xxx: reserved;
//
//            A[12:0] = 0 00 0 00 011 0 001 = 0_0000_0011_0001
// -FHDR------------------------------------------------------------

module sdram_cmd(
	input   	clk,
	input   	rst_n,

	// sdram if
	output 		sdram_cke,
	output 		sdram_csn,
	output 		sdram_rasn,	
	output 		sdram_casn,	
	output 		sdram_wen,	
	output [1:0]	sdram_ba,	
	output [12:0] 	sdram_addr,


	// 
	input [4:0]     init_state,
	input [4:0]     work_state,
	input           sdram_r_wn,

	// 
	input [21:0]    sys_wraddr,
	input [21:0]	sys_rdaddr

);

`include "sdram_param.v"

reg [4:0]  sdram_cmd_r;
reg [1:0]  sdram_ba_r;
reg [12:0] sdram_addr_r;


assign {sdram_cke,sdram_csn,sdram_rasn,sdram_casn,sdram_wen} = sdram_cmd_r;
assign sdram_ba = sdram_ba_r;
assign sdram_addr = sdram_addr_r;

// 读写SDRAM时地址暂存器，(bit24-23)L-Bank地址:(bit22-11)为行地址，(bit10-1)为列地址
//wire[21:0] sys_addr;		 	
//assign sys_addr = sdram_r_wn ? sys_rdaddr : sys_wraddr;

reg[21:0] sys_addr;		 	
always@(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		sys_addr <= 22'd0;
	end
	else if(sdram_r_wn) begin
		sys_addr <= sys_rdaddr;
	end
	else
		sys_addr <= sys_wraddr;

end


// cmd 输出 与状态机 后移一个周期。
always @ (posedge clk or negedge rst_n) begin
	if(!rst_n) begin
			sdram_cmd_r <= CMD_NOP;
			sdram_ba_r <= 2'b11;
			sdram_addr_r <= 13'h1fff;
		end
	else
		case (init_state)
			I_POWON: begin
				sdram_cmd_r <= CMD_NOP;
			end

			I_PRE_CMD: begin
				sdram_cmd_r <= CMD_PRECHARGE;
			end
			
			I_PRE_TRP: begin
				sdram_cmd_r <= CMD_NOP;
			end
			
			I_AR0_CMD: begin
				sdram_cmd_r <= CMD_A_REF;
			end
			
			I_AR0_TRFC: begin
				sdram_cmd_r <= CMD_NOP;
			end 
			
			I_AR1_CMD: begin
				sdram_cmd_r <= CMD_A_REF;
			end
			
			I_AR1_TRFC: begin
				sdram_cmd_r <= CMD_NOP;
			end 
			
			I_MRS_CMD: begin	//模式寄存器设置，可根据实际需要进行设置
				sdram_cmd_r <= CMD_LMR;
				sdram_ba_r <= 2'b00;	//操作模式设置
				sdram_addr_r <= MODE_REGISTER;
			end	
			
			I_DONE:

				case (work_state)
					S_IDLE: begin
						sdram_cmd_r <= CMD_NOP;
						sdram_ba_r <= 2'b11;
						sdram_addr_r <= 13'h1fff;
					end


					S_RAS_ACTIVE: begin
						sdram_cmd_r <= CMD_ACTIVE;
						sdram_ba_r <= sys_addr[21:20];	//L-Bank地址
						sdram_addr_r <= {2'd0,sys_addr[19:9]};	//行地址
					end

					S_TRCD: begin
						sdram_cmd_r <= CMD_NOP;
						sdram_ba_r <= 2'b11;
						sdram_addr_r <= 13'h1fff;
					end

					S_RD_CMD: begin
						sdram_cmd_r <= CMD_READ;
						sdram_ba_r <= sys_addr[21:20];	//L-Bank地址
						sdram_addr_r <= {
							         4'b0100,	// A10=1,设置写完成允许自动预充电
								 sys_addr[8:0]	//列地址  
								};
					end

					S_CL: begin
						sdram_cmd_r <= CMD_NOP;
						sdram_ba_r <= 2'b11;
						sdram_addr_r <= 13'h1fff;
					end
				
					S_RD_DATA: begin
						// no 
					end	

					S_R_PRECHARGE:begin
						sdram_cmd_r <= CMD_PRECHARGE;
						sdram_ba_r <= 2'b11;
						sdram_addr_r <= 13'h1fff;
					end

					S_RWAIT: begin
						sdram_cmd_r <= CMD_NOP;
						sdram_ba_r <= 2'b11;
						sdram_addr_r <= 13'h1fff;
					end

					S_WR_CMD: begin
						sdram_cmd_r <= CMD_WRITE;
						sdram_ba_r <= sys_addr[21:20];	//L-Bank地址
						sdram_addr_r <= {
								4'b0100,	// A10=1,设置写完成允许预充电
								sys_addr[8:0]	//列地址  
								};
					end
					
					S_WR_DATA: begin
						sdram_cmd_r <= CMD_NOP;
						sdram_ba_r <= 2'b11;
						sdram_addr_r <= 13'h1fff;								
					end

					S_TDAL: begin
						// no
					end					
					
					S_AR: begin
						sdram_cmd_r <= CMD_A_REF;
						sdram_ba_r <= 2'b11;
						sdram_addr_r <= 13'h1fff;	
					end

					S_TRFC: begin
						sdram_cmd_r <= CMD_NOP;
						sdram_ba_r <= 2'b11;
						sdram_addr_r <= 13'h1fff;								
					end
					
					default: begin
						sdram_cmd_r <= CMD_NOP;
						sdram_ba_r <= 2'b11;
						sdram_addr_r <= 13'h1fff;	
					end
				endcase
			default: begin
				sdram_cmd_r <= CMD_NOP;
				sdram_ba_r <= 2'b11;
				sdram_addr_r <= 13'h1fff;	
			end
		endcase
end




endmodule
