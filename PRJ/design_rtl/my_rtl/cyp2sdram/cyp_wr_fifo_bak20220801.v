// +FHDR------------------------------------------------------------
//                 Copyright (c) 2022 $COMPANY .
//                       ALL RIGHTS RESERVED
// -----------------------------------------------------------------
// Filename      : cyp_wr_fifo.v
// Author        : wusha 
// Created On    : 2022-06-16 15:02
// Last Modified : 
// -----------------------------------------------------------------
// Description:
//
//
// -FHDR------------------------------------------------------------

module cyp_wr_fifo(
	input 		  cyp_clk,   // 48mhz
	input         usb_clk,
	input 		  rst_n,
    input         sdram_init_done,	
	//output 		  usb_clk,
	output reg [1:0]  usb_fifoaddr,  //CY68013 FIFO Address
    	output  	  usb_slcs,      //CY68013 Chipset select
    	output  	  usb_sloe,      //CY68013 Data output enable
    	output  	  usb_slrd,      //CY68013 READ indication
    	output  	  usb_slwr,      //CY68013 Write indication
    	
	//inout [15:0] 	  usb_fd,        //CY68013 Data
    	input 	[15:0] 	  usb_fd_i,      //CY68013 Data in
    	output  [15:0] 	  usb_fd_o,      //CY68013 Data out
	output  	  usb_fd_oe,     // data out valid	
    	
	input 		  usb_flaga,     //CY68013 EP2 FIFO empty indication; 1:not empty; 0: empty
    	input 		  usb_flagb,     //CY68013 EP4 FIFO empty indication; 1:not empty; 0: empty
    	input 		  usb_flagc,     //CY68013 EP6 FIFO full indication; 1:not full; 0: full
	output  	  pa0 ,          //int0# no use fixd 1	

	//
	input 		  sdram_clk, // 133mhz
	input             fifo_ren,
	output [15:0] 	  fifo_rdata,
	output            fifo_rempty

);


localparam  USB_EPOUT_PKSIZE = 16'd256;  // 512 bytes = 256x16bis
localparam  CYP_WAIT_CLKS = 16'd64;


assign usb_fd_o = 16'hffff;  // no write this version



reg [15:0] cy_cnt;
always@(posedge cyp_clk or negedge rst_n)begin
	if(!rst_n)
		cy_cnt <= 16'd0;
	else if(cyp_state == CYP_READ) begin
		if(!usb_slrd_fifo)begin
			if(cy_cnt == USB_EPOUT_PKSIZE-1)
				cy_cnt <= cy_cnt;
			else
				cy_cnt <= cy_cnt + 16'd1;
		end
	end
	else if(cyp_state == CYP_WAIT)begin
		if(cy_cnt == CYP_WAIT_CLKS)
			cy_cnt <= 16'd0;
		else
		   cy_cnt <= cy_cnt + 16'd1;			
	end
	else if(cyp_state == CYP_IDLE)begin
		cy_cnt <= 16'd0;
	end
	else
	   cy_cnt <= 16'd0;
end



//--------------------------------
// cypress read FSM
//--------------------------------

reg [4:0] cyp_state;

localparam  CYP_IDLE    	= 5'd0;
localparam  CYP_READ_PRE  	= 5'd1;
localparam  CYP_READ	  	   = 5'd2;
localparam  CYP_WAIT	  	   = 5'd3;
localparam  CYP_END	  	   = 5'd4;

always@(posedge cyp_clk or negedge rst_n)begin
	if(!rst_n)begin
		cyp_state <= CYP_IDLE;
	end
	else begin
		case(cyp_state)
			CYP_IDLE:begin
				if(!wfull && !usb_empty && sdram_init_done)
					cyp_state <= CYP_WAIT;
				else
					cyp_state <= CYP_IDLE;
			end
			
			CYP_WAIT:begin
				if(cy_cnt == CYP_WAIT_CLKS)
					cyp_state <= CYP_READ_PRE;
				else
				   cyp_state <= CYP_WAIT;
			end
			
			CYP_READ_PRE:begin
				cyp_state <= CYP_READ;
			end
		
			CYP_READ:begin
				if(!usb_slrd_fifo && cy_cnt == USB_EPOUT_PKSIZE-1)
				//if(wfull)
					cyp_state <= CYP_END;
					//cyp_state <= CYP_WAIT;
				else
					cyp_state <= CYP_READ;
			end
			
			CYP_END:begin
				cyp_state <= CYP_IDLE;
			end
					
			default: cyp_state <= CYP_IDLE;		
		endcase
	end
end


always@(posedge cyp_clk or negedge rst_n)begin
	if(!rst_n)begin
		usb_fifoaddr <= 2'b00; 
	end
	else if(cyp_state == CYP_READ_PRE) begin
		usb_fifoaddr <= 2'b00;  // fixed EP0 
	end
end


assign  pa0 = 1; // no use int0 
assign  usb_slwr = 1;
assign  usb_slcs = 0; // always cs

assign  usb_empty = !usb_flaga;

assign  usb_slrd_fifo = !((cyp_state == CYP_READ) && !wfull && (cy_cnt <= USB_EPOUT_PKSIZE-1));
assign  usb_slrd = usb_slrd_fifo;
//assign  usb_slrd = !((cyp_state == CYP_READ) && !wfull && !usb_empty);
assign  usb_sloe = usb_fd_oe;  // 0- out  1-in
//assign  usb_fd_oe = !((cyp_state == CYP_READ_PRE) || (cyp_state == CYP_READ) || (cyp_state == CYP_END));
//assign  usb_fd_oe = !((cyp_state == CYP_READ));
assign  usb_fd_oe = !((cyp_state == CYP_READ_PRE) || (cyp_state == CYP_READ));

assign wen = !usb_slrd_fifo;  // wen 1-active   usb_slrd 0-active
wire [15:0] wdata;
assign wdata = usb_fd_i;
//assign wdata = usb_fd_i_r;


//----my design
//asyn_fifo_top#(
//	.DATAWIDTH(16),
//	.ASIZE(12)     // 10 --> deepth 512 
//)wrfifo_inst(
//	.wfull	(wfull),
//	.wdata	(wdata),
//	.wen	(wen), // 
//	//.wclk	(usb_clk),
//	.wclk	(cyp_clk),
//	.wrstn	(rst_n),		
//	
//	.rdata	(fifo_rdata),
//	.ren	(fifo_ren),
//	.rempty	(fifo_rempty),
//	.rclk	(sdram_clk),
//	.rrstn	(rst_n)	
//);

// ise ip
asyn_fifo wrfifo_inst(
  .rst		(!rst_n)	,
  .wr_clk	(cyp_clk)	,
  .rd_clk	(sdram_clk)	,
  .din		(wdata)	,
  .wr_en		(wen)	,	
  .rd_en		(fifo_ren)	,
  .dout		(fifo_rdata)	,
  .full		(wfull)	,
  .empty		(fifo_rempty)		
);




endmodule
