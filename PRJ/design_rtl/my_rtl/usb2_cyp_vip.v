// +FHDR------------------------------------------------------------
//                 Copyright (c) 2022 $COMPANY .
//                       ALL RIGHTS RESERVED
// -----------------------------------------------------------------
// Filename      : usb2_cyp_vip.v
// Author        : wusha 
// Created On    : 2022-06-22 10:23
// Last Modified : 
// -----------------------------------------------------------------
// Description:
//
//
// -FHDR------------------------------------------------------------

module usb2_cyp_vip(
	input             rst_n,
	input 		  usb_clk,
	input  [1:0]      usb_fifoaddr,  
	input  	  	  usb_slcs,      
    	input  	  	  usb_sloe,      
    	input  	  	  usb_slrd,      
    	input  	  	  usb_slwr,     
    	inout 	[15:0] 	  usb_fd,        
	output 		  usb_flaga,     
    	output 		  usb_flagb,     
    	output 		  usb_flagc,  
         
        output            usb_download_finished,	
	input  	          pa0            	

);

reg[7:0] reset_delay_cnt;
always@(posedge usb_clk or negedge rst_n)
    if(!rst_n)
        reset_delay_cnt <= 8'd0;
    else if(reset_delay_cnt == 8'd10)
        reset_delay_cnt <= reset_delay_cnt;
    else
        reset_delay_cnt <= reset_delay_cnt + 8'd1;
assign usb_flaga =  (reset_delay_cnt < 8'd10 || usb_download_finished) ? 0:1;   // 1 -- data valid  0 -- no data



assign usb_flagb =  0;
assign usb_flagc =  0;

assign usb_download_finished = (r_cnt == 16'd256);

assign usb_fd_oe = !usb_slrd;


wire [15:0]  usb_fd_i;
reg [15:0] usb_fd_o;

reg [15:0] r_cnt;
always@(posedge usb_clk or negedge rst_n)begin
	if(!rst_n)begin
		r_cnt <= 16'd0;
	end
	else if(!usb_slrd)begin
		if(r_cnt == 16'd256)
			r_cnt <= r_cnt;
		else
			r_cnt <= r_cnt + 16'd1;  //
	end
	else begin
		r_cnt <= r_cnt;
	end
end

always@(posedge usb_clk or negedge rst_n)begin
	if(!rst_n)begin
		usb_fd_o <= {16'd0};
	end
	else if(!usb_slrd) begin
		usb_fd_o <= {usb_fd_o + 8'd1};
	end
	else begin
		usb_fd_o <= usb_fd_o;
	end
end





genvar i;
generate 
	for(i=0;i<16;i=i+1)begin
   		IOBUF #(
   		   .DRIVE(12), // Specify the output drive strength
   		   .IBUF_LOW_PWR("TRUE"),  // Low Power - "TRUE", High Performance = "FALSE" 
   		   .IOSTANDARD("DEFAULT"), // Specify the I/O standard
   		   .SLEW("SLOW") // Specify the output slew rate
   		) IOBUF_vip_inst (
   		   .O(usb_fd_i[i]),     // Buffer output
   		   .IO(usb_fd[i]),   // Buffer inout port (connect directly to top-level port)
   		   .I(usb_fd_o[i]),     // Buffer input
   		   .T(!usb_fd_oe)      // 3-state enable input, high=input, low=output
   		);
	end

endgenerate





endmodule
