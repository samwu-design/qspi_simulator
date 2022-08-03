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
	output  [1:0]  usb_fifoaddr,  //CY68013 FIFO Address
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


assign  pa0 = 1; // no use int0 
assign  usb_slwr = 1;
assign  usb_slcs = 0; // always cs
assign  usb_fd_o = 16'hffff;  // no write this version

//localparam  USB_EPOUT_PKSIZE = 16'd256;  // 512 bytes = 256x16bis
localparam  CYP_WAIT_CLKS = 16'd64;

reg [15:0] cy_cnt;



//--------------------------------
// cypress read FSM
//--------------------------------

reg [4:0] cyp_state_cur;
reg [4:0] cyp_state_nxt;

localparam  CYP_IDLE    	= 5'd0;
localparam  CYP_READ	  	   = 5'd1;
localparam  CYP_OE	  	   = 5'd2;

always@(posedge cyp_clk or negedge rst_n)begin
	if(!rst_n)begin
		cyp_state_cur <= CYP_IDLE;
	end
	else begin
		cyp_state_cur <= cyp_state_nxt;
	end
end
	


always@(*)begin
	cyp_state_nxt = cyp_state_cur;
	case(cyp_state_cur)
		CYP_IDLE:begin
			if(usb_flaga)  // have data
				cyp_state_nxt = CYP_OE;
			else
				cyp_state_nxt = CYP_IDLE;
		end
		
		CYP_OE:begin
			cyp_state_nxt = CYP_READ;
		end

		CYP_READ:begin
			if(!usb_flaga) // read over
				//cyp_state_nxt = CYP_WAIT;
				cyp_state_nxt = CYP_IDLE;
			else
				cyp_state_nxt = CYP_READ;
		end

		default:begin
			cyp_state_nxt = CYP_IDLE;
		end
	endcase
end



assign usb_fifoaddr = 2'b00; // ep2out

//assign  usb_sloe = !usb_flaga;  // 0- out  1-in
//assign  usb_fd_oe = !usb_flaga;
//assign  usb_slrd = !(!usb_sloe);

assign usb_sloe = usb_sloe_r;
assign usb_fd_oe = usb_fd_oe_r;
assign usb_slrd  = usb_slrd_r;

reg  usb_sloe_r,usb_fd_oe_r,usb_slrd_r;
always@(*)begin
   if(cyp_state_cur == CYP_READ & usb_flaga)begin
		usb_sloe_r = 0;
		usb_fd_oe_r = 0;
		usb_slrd_r = 0;
	end
	else begin
		usb_sloe_r = 1;
		usb_fd_oe_r = 1;
		usb_slrd_r = 1;	
	end
end

wire wen;
wire [15:0] wdata;

assign wen = !usb_slrd;  // wen 1-active   usb_slrd 0-active
assign wdata = usb_fd_i;


// ise ip
asyn_fifo wrfifo_inst(
  .rst		(!rst_n)	,
  .wr_clk	(cyp_clk)	,
  .rd_clk	(sdram_clk)	,
  .din		(wdata)	,
  .wr_en	(wen)	,	
  .rd_en	(fifo_ren)	,
  .dout		(fifo_rdata)	,
  .full		(wfull)	,
  .empty	(fifo_rempty)		
);




endmodule
