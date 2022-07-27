// +FHDR------------------------------------------------------------
//                 Copyright (c) 2022 $COMPANY .
//                       ALL RIGHTS RESERVED
// -----------------------------------------------------------------
// Filename      : sdram_data.v
// Author        : wusha 
// Created On    : 2022-06-10 14:36
// Last Modified : 
// -----------------------------------------------------------------
// Description:
// 		data process
//
// -FHDR------------------------------------------------------------

module sdram_data(
	input     		clk,
	input 			rst_n,

	//
	input [4:0]     	init_state,
	input [4:0]     	work_state,
	input [4:0]     	cur_init_state,
	input [4:0]     	cur_work_state,
	input           	sdram_r_wn,

	input           	sdram_data_i_valid,
	input  [15:0]   	sdram_data_i,
	output  [15:0]   	sdram_data_o,
	output           	sdram_data_oe,

	output [23:0]   	sys_wraddr,
	output [23:0]		sys_rdaddr,

	output 			sdram_rd_req,	
	input 			sdram_rd_ack,
	output 			sdram_wr_req,	
	input 			sdram_wr_data_valid,	
	input 			sdram_wr_ack,

	input  			end_tread,
	input           	end_twrite,


	//
	input [15:0] 		wr_data,
	input [23:0] 		wr_addr,
	input           	wr_valid,
	output  	     	wr_ready,

	input [23:0] 		rd_addr,
	input 			rd_avalid,
	output                  rd_aready,
	output  [15:0]		rd_data,	
	output                  rd_valid,
	input           	rd_ready

	
);

`include "sdram_param.v"

reg [23:0] sys_rdaddr_r;
reg [23:0] sys_wraddr_r;

reg [2:0]  rd_cnt,wr_cnt;


//

assign sys_rdaddr = sys_rdaddr_r;
assign sys_wraddr = sys_wraddr_r;


//sys_wraddr
reg cur_end_tread,cur_end_twrite;
always@(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		cur_end_tread <= 0;
		cur_end_twrite <= 0;
	end
	else begin
		cur_end_tread <= end_tread;
		cur_end_twrite <= end_twrite;
	end
end



assign sd_rd_finished = (cur_work_state == (S_RD_DATA)) && cur_end_tread;
assign sd_wr_finished = (cur_work_state == (S_WR_DATA)) && cur_end_twrite; 

//---------------------------------------
// read  FSM
// --------------------------------------

reg [4:0]  rd_state;

assign sdram_rd_req = rd_state == S_RD_REQ; 

always@(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		rd_state <= S_RD_IDLE;
	end
	else begin
		case(rd_state)
			S_RD_IDLE:begin
				if(rd_avalid && rd_aready)
					rd_state <= S_RD_REQ;
				else
					rd_state <= S_RD_IDLE;
			end

			S_RD_REQ: begin
				if(sdram_rd_req && sdram_rd_ack)
					rd_state <= S_RD_SDDATA;
				else
					rd_state <= S_RD_REQ;
			end

			S_RD_SDDATA: begin
				if(sd_rd_finished)
					rd_state <= S_RD_TRANS;
				else
					rd_state <= S_RD_SDDATA;
			end

			S_RD_TRANS: begin
				if(rd_valid && rd_ready && end_rdata)
					rd_state <= S_RD_END;
				else
					rd_state <= S_RD_TRANS;
			end

			S_RD_END: rd_state <= S_RD_IDLE;

			default: rd_state <= S_RD_IDLE;
			
		endcase
	end
end

//鑾峰? 璇诲????
assign rd_aready = rd_state == S_RD_IDLE;

always@(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		sys_rdaddr_r <= 24'd0;
	end
	else if(rd_aready && rd_avalid)begin
		//sys_rdaddr_r <= {rd_addr[21:2],2'b00};
		sys_rdaddr_r <= rd_addr;
	end
	else begin
		sys_rdaddr_r <= sys_rdaddr_r;
	end
end

// count rd data out sdram contoller ;
always@(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		rd_cnt <= 3'd0;
	end
	else if(rd_state == S_RD_TRANS && rd_valid && rd_ready) begin
		if(rd_cnt == R_BL-1)
			rd_cnt <= 3'd0;
		else
			rd_cnt <= rd_cnt + 1;
	end
	else
		rd_cnt <= rd_cnt;
end

assign end_rdata = rd_cnt == R_BL-1;
assign rd_valid = rd_state == S_RD_TRANS;

// sdram rd data
reg[2:0] sd_rcnt;
reg[15:0] temp_rdata[R_BL-1:0];

integer i;
initial begin
	for(i=0;i<R_BL;i=i+1)begin
		temp_rdata[i] <= 0;
	end
end

always@(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		sd_rcnt <= 3'd0;
	end
	else if(sdram_data_i_valid) begin
		sd_rcnt <= sd_rcnt + 1;
	end
	else
		sd_rcnt <= 3'd0;
end

//always@(negedge clk)begin
always@(posedge clk)begin
	if(sdram_data_i_valid) 
		temp_rdata[sd_rcnt] <= sdram_data_i;
end

assign rd_data = temp_rdata[rd_cnt];

//---------------------------------------
// write  FSM
//  BL temp data register
// --------------------------------------

//reg [2:0] sd_wcnt;
reg [4:0]  wr_state;
reg[15:0] temp_wdata[W_BL-1:0];
integer j;
initial begin
	for(j=0;j<W_BL;j=j+1)begin
		temp_wdata[j] <= 0;
	end
end

always@(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		wr_state <= S_RD_IDLE;
	end
	else begin
		case(wr_state)
			S_WR_IDLE:begin
				if(wr_valid && wr_ready)
					if(wdata_valid)
						wr_state <= S_WR_REQ;
					else
						wr_state <= S_WR_IDLE;
				else
					wr_state <= S_WR_IDLE;
			end

			S_WR_REQ: begin
				if(sdram_wr_req && sdram_wr_ack)
					wr_state <= S_WR_SDDATA;
				else
					wr_state <= S_WR_REQ;

			end

			S_WR_SDDATA: begin
				if(sd_wr_finished)
					wr_state <= S_WR_END;
				else
					wr_state <= S_WR_SDDATA;
			end

			S_WR_END: wr_state <= S_WR_IDLE;

			default: wr_state <= S_WR_IDLE;
			
		endcase
	end
end



// count recive data from fifo;
always@(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		wr_cnt <= 3'd0;
	end
	else if(wr_state == S_WR_IDLE && wr_valid && wr_ready) begin
		if(wdata_valid)
			wr_cnt <= 3'd0;
		else
			wr_cnt <= wr_cnt + 1;
	end
	else
		wr_cnt <= wr_cnt;
end

assign wdata_valid = (wr_cnt == W_BL-1);


always@(posedge clk)begin
	if(wr_valid && wr_ready)
		temp_wdata[wr_cnt] <=  wr_data;
end

always@(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		sys_wraddr_r <= 24'd0;
	end
	else if(wr_ready && wr_valid && wr_cnt == 3'd0)begin
		//sys_wraddr_r <= {wr_addr[21:2],2'b00};
		sys_wraddr_r <= wr_addr;
	end
	else begin
		sys_wraddr_r <= sys_wraddr_r;
	end
end


// sdram ctrol pop
reg [2:0] w_idx;
always@(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		w_idx <= 3'd0;
	end
	else if(sdram_wr_data_valid) begin
		w_idx <= w_idx + 1;
	end
	else
		w_idx <= 3'd0;
end

assign sdram_data_o = temp_wdata[w_idx];
assign  sdram_data_oe = ~sdram_r_wn;
assign sdram_wr_req = wr_state == S_WR_REQ; 
assign wr_ready = wr_state == S_WR_IDLE;


endmodule

