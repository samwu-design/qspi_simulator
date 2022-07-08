// +FHDR------------------------------------------------------------
//                 Copyright (c) 2022 $COMPANY .
//                       ALL RIGHTS RESERVED
// -----------------------------------------------------------------
// Filename      : qspi_master_model.v
// Author        : wusha 
// Created On    : 2022-06-21 09:41
// Last Modified : 
// -----------------------------------------------------------------
// Description:
//
//
// -FHDR------------------------------------------------------------

module qspi_master_model(
    input           usb_download_finished,
	output  		qspi_clk,
	output  		csn,
	output  		di,
	input 			do,
	output  		wpn,
	output  		holdn
);

parameter RD_BL = 8'd2;
parameter CMD_FAST_READ = 8'h0b;


assign csn = 0;
assign wpn = 1;
assign holdn = 1;





reg  qspi_clk;
reg  rst_n;

wire start,cmd_end,address_end,dummy_end,byte_end,data_end;

initial begin
	qspi_clk = 0;
	rst_n = 0;
#100    rst_n = 1;
end

always@(*) #25 qspi_clk <= !qspi_clk; // 20mhz

reg [7:0] rand;
always@(posedge qspi_clk)begin
	rand <= {$random}%10;
end

//-------------------------------
// FSM
//	qspi fast read model
//-------------------------------
reg[4:0] m_state;
localparam  M_IDLE 	= 5'd0;
localparam  M_CMD 	= 5'd1;
localparam  M_ADDR 	= 5'd2;
localparam  M_DUMMY 	= 5'd3;
localparam  M_DATA 	= 5'd4;
localparam  M_END	= 5'd5;


always@(posedge qspi_clk or negedge rst_n)begin
	if(!rst_n)begin
		m_state <= 5'd0;
	end
	else begin
		case(m_state)
			M_IDLE:begin
				if(start)
					m_state <= M_CMD;
			       	else	
					m_state <= M_IDLE;
			end

			M_CMD:begin
				if(cmd_end)
					m_state <= M_ADDR;
			       	else	
					m_state <= M_CMD;
			end

			M_ADDR:begin
				if(address_end)
					m_state <= M_DUMMY;
			       	else	
					m_state <= M_ADDR;
			end
			
			M_DUMMY:begin
				if(dummy_end)
					m_state <= M_DATA;
			       	else	
					m_state <= M_DUMMY;
			end

			M_DATA:begin
				if(byte_end) begin
					if(data_end)
						m_state <= M_END;
					else
						m_state <= M_DATA;
				end
			       	else	
					m_state <= M_DATA;

			end

			M_END:begin
				m_state <= M_IDLE;
			end

			default: m_state <= M_IDLE;

		endcase
	end
end


//----------------------------------
reg [15:0] m_cnt;

always@(posedge qspi_clk or negedge rst_n)begin
	if(!rst_n)begin
		m_cnt <= 16'd0;
	end
	else if(start || cmd_end || address_end || dummy_end || byte_end) begin
		m_cnt <= 16'd0;
	end
	else begin
		m_cnt <= m_cnt + 16'd1;
	end
end

reg [2:0] byte_cnt;
always@(posedge qspi_clk or negedge rst_n)begin
	if(!rst_n)begin
		byte_cnt <= 3'd0;
	end
	else if(byte_end)begin
		if(byte_cnt == 2*RD_BL-1)
			byte_cnt <= 3'd0;
		else
			byte_cnt <= byte_cnt + 3'd1;
	end
	else
		byte_cnt <= byte_cnt;
end

reg [7:0]  r_cnt;
always@(posedge qspi_clk or negedge rst_n)
    if(!rst_n)
        r_cnt <= 8'd0;
    else if(start)
        r_cnt <= r_cnt + 8'd1;
    else
        r_cnt <= r_cnt;


assign start = (rand == 8'd0) && (m_state == M_IDLE) && usb_download_finished && (r_cnt < 8'd128);
assign cmd_end = m_cnt == 16'd7 && m_state == M_CMD;
assign address_end = m_cnt == 16'd23 && m_state == M_ADDR;
assign dummy_end = m_cnt == 16'd7 && m_state == M_DUMMY;
assign byte_end = m_cnt == 16'd7 && m_state == M_DATA;
assign data_end = byte_end && byte_cnt == 2*RD_BL-1;




// 
reg [23:0] qspi_address;
always@(posedge qspi_clk or negedge rst_n)begin
	if(!rst_n)begin
		qspi_address <= 24'h000000;
	end
	else if(cmd_end)begin
		qspi_address <= qspi_address + 24'd4;
	end
	else
		qspi_address <= qspi_address;
end



//------------di generate
wire di;
reg [31:0]  di_out;
always@(posedge qspi_clk or negedge rst_n)begin
	if(!rst_n)begin
		di_out <= 32'd0;
	end
	else if(start)
		di_out <= {CMD_FAST_READ,24'd0};
	else if(cmd_end)
		di_out <= {qspi_address,8'd0};
	else if(address_end)
		di_out <= 32'hzzzzzzzz;
	else if(dummy_end)
		di_out <= 32'hxxxxxxxx;
	else begin
		di_out <= {di_out[30:0],1'b0};
	end
end
assign di = di_out[31];








endmodule
