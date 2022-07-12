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
	input 		  rst_n,
    input         sdram_init_done,	
	output 		  usb_clk,
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

assign usb_clk = cyp_clk;

assign usb_fd_o = 16'hffff;  // no write this version
//--------------------------------
// cypress read FSM
//--------------------------------

reg [4:0] cyp_state;

localparam  IDLE    		= 5'd0;
localparam  CYP_READ_PRE  	= 5'd1;
localparam  CYP_READ	  	= 5'd2;



always@(posedge cyp_clk or negedge rst_n)begin
	if(!rst_n)begin
		cyp_state <= IDLE;
	end
	else begin
		case(cyp_state)
			IDLE:begin
				if(!wfull && !usb_empty && sdram_init_done)
					cyp_state <= CYP_READ_PRE;
				else
					cyp_state <= IDLE;
			end

			CYP_READ_PRE:begin
				cyp_state <= CYP_READ;
			end
		
			CYP_READ:begin
				if(wfull || usb_empty)
					cyp_state <= IDLE;
				else
					cyp_state <= CYP_READ;
			end
			
			default: cyp_state <= IDLE;		
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
assign  usb_empty = !usb_flaga;
assign  usb_slwr = 1;
assign  usb_slrd = !((cyp_state == CYP_READ) && !usb_empty && !wfull);
assign  usb_slcs = 0; // always cs
assign  usb_sloe = (cyp_state == IDLE);  // 0- out  1-in
//assign  usb_fd_oe = !((cyp_state == CYP_READ_PRE) && (cyp_state == CYP_READ));
assign  usb_fd_oe = usb_slrd;  // 不读 则默认是写方�?


assign wen = !usb_slrd;  // wen 1-active   usb_slrd 0-active

asyn_fifo_top#(
	.DATAWIDTH(16),
	.ASIZE(10)     // 10 --> deepth 512 
)wrfifo_inst(
	.wfull	(wfull),
	.wdata	(usb_fd_i),
	.wen	(wen), // 
	.wclk	(cyp_clk),
	.wrstn	(rst_n),		
	
	.rdata	(fifo_rdata),
	.ren	(fifo_ren),
	.rempty	(fifo_rempty),
	.rclk	(sdram_clk),
	.rrstn	(rst_n)	
);





endmodule
