// +FHDR------------------------------------------------------------
//                 Copyright (c) 2022 $COMPANY .
//                       ALL RIGHTS RESERVED
// -----------------------------------------------------------------
// Filename      : fifo_rd_sdram.v
// Author        : $USER_DIT 
// Created On    : 2022-06-17 17:11
// Last Modified : 
// -----------------------------------------------------------------
// Description:
//
//
// -FHDR------------------------------------------------------------

module ram_rd_sdram(

	input    		rst_n,

	input  [23:0]           qspi_rd_addr,
	input            	qspi_rd_req,
	
	input    		qspi_clk, // ?mhz  <50mhz  fifo readclk
	input                   ram_ren,
	input [2:0]             ram_raddr,
        output [15:0]           ram_rdata,


	// sdram  ctrl read port
	input           	sdram_clk, //133mhz
	output reg [23:0] 	rd_addr,
	output 			rd_avalid,
	input          		rd_aready,
	input [15:0]		rd_data,	
	input          		rd_valid,
	output           	rd_ready

);


localparam PRE_RD_BL    = 4'd8;

//  address cross clk 
reg  qspi_rd_req0,qspi_rd_req1;
wire qspi_rd_posedge;

always@(posedge sdram_clk or negedge rst_n)begin
	if(!rst_n)begin
		qspi_rd_req0 <= 0;
		qspi_rd_req1 <= 0;
	end
	else  begin
		qspi_rd_req0 <= qspi_rd_req;
		qspi_rd_req1 <= qspi_rd_req0;
	end
end

assign qspi_rd_posedge = qspi_rd_req0 && !qspi_rd_req1;

always@(posedge sdram_clk or negedge rst_n)begin
	if(!rst_n)begin
		rd_addr <= 24'd0;
	end
	else if(qspi_rd_posedge) begin
		//rd_addr <= qspi_rd_addr[23:0];
		rd_addr <= {1'b0,qspi_rd_addr[23:1]};
	end
end





wire [3:0]  rd_bl;
assign rd_bl = PRE_RD_BL;



// adram ctrol port 
//------------------------------------------
//	FSM  read data from sdram
//           to fifo
//------------------------------------------
localparam   S_RD_IDLE 		= 3'd0;
localparam   S_RD_ADDR 		= 3'd1;
localparam   S_RD_DATA 		= 3'd2;

reg [2:0]  rd_state;
reg [3:0]  rd_cnt;

always@(posedge sdram_clk or negedge rst_n)begin
	if(!rst_n)begin
		rd_state <= 3'd0;
	end
	else begin
		case(rd_state)
			S_RD_IDLE:begin
				if(qspi_rd_posedge)
					rd_state <= S_RD_ADDR;
				else
					rd_state <= S_RD_IDLE;
			end

			S_RD_ADDR:begin
				if(rd_avalid && rd_aready)
					rd_state <= S_RD_DATA;
				else
					rd_state <= S_RD_ADDR;
			end

			S_RD_DATA:begin
				if(rd_valid && rd_ready)begin
					if(rd_cnt == rd_bl - 1)
						rd_state <= S_RD_IDLE;
					else
						rd_state <= S_RD_DATA;
				end
				else
					rd_state <= S_RD_DATA;
			end

			default:  rd_state <= S_RD_IDLE;
			
		endcase
	end
end

always@(posedge sdram_clk or negedge rst_n)begin
	if(!rst_n)begin
		rd_cnt <= 4'd0;
	end
	else if(rd_valid && rd_ready)begin
		if(rd_cnt == rd_bl-1)
			rd_cnt <= 4'd0;
		else
			rd_cnt <= rd_cnt + 4'd1;
	end
	else
		rd_cnt <= rd_cnt;
end



assign rd_avalid = rd_state == S_RD_ADDR;
assign rd_ready  = rd_state == S_RD_DATA;


//
reg[2:0]  ram_waddr;
always@(posedge sdram_clk or negedge rst_n)begin
	if(!rst_n)begin
		ram_waddr <= 3'd0;
	end
	else if(rd_state == S_RD_DATA) begin
		if(ram_wen)
			ram_waddr <= ram_waddr + 3'd1;
		else
			ram_waddr <= ram_waddr;
	end
	else
		ram_waddr <= 3'd0;
end

assign ram_wen = rd_valid && rd_ready;

dual_port_ram#(
	.DATAWIDTH(16),
	.ASIZE(3)
)ram_inst(

.wclk	(sdram_clk),
.wrstn	(rst_n),
.wen	(ram_wen),
.waddr	(ram_waddr),
.wdata  (rd_data),

.rclk	(qspi_clk),
.rrstn	(rst_n),
.ren	(ram_ren),
.raddr  (ram_raddr),
.rdata  (ram_rdata)
);



endmodule

