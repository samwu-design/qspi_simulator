// +FHDR------------------------------------------------------------
//                 Copyright (c) 2022 $COMPANY .
//                       ALL RIGHTS RESERVED
// -----------------------------------------------------------------
// Filename      : asyn_fifo_top.v
// Author        : wusha 
// Created On    : 2022-06-06 15:21
// Last Modified : 
// -----------------------------------------------------------------
// Description:
//
//
// -FHDR------------------------------------------------------------

module asyn_fifo_top#(
	parameter DATAWIDTH = 64,
	parameter ASIZE = 7
)(
	output [DATAWIDTH-1 : 0] rdata,
	output 	 		 wfull,
	output			 rempty,
	input [DATAWIDTH-1 : 0]  wdata,
	input			 wen,wclk,wrstn,
	input			 ren,rclk,rrstn	

);

wire [ASIZE-1:0] waddr,raddr;
wire [ASIZE:0]   wptr,rptr,w_rptr,r_wptr;

sync_r2w#(
 .ASIZE(ASIZE)
) 
sync_r2w(
.w_rptr (w_rptr ),  
.rptr	(rptr	),
.wclk	(wclk	),
.wrstn	(wrstn	)
);

sync_w2r #(
 .ASIZE(ASIZE)
)
sync_w2r(
.r_wptr (r_wptr ),  
.wptr	(wptr	),
.rclk	(rclk	),
.rrstn	(rrstn	)
);

fifomem 
#(
.DATAWIDTH(DATAWIDTH),
.ASIZE(ASIZE)
)
fifo(
.rdata (rdata ),
.wdata (wdata ),
.waddr (waddr ),
.raddr (raddr ),
.wen   (wen   ),
.wfull (wfull ),
.wclk  (wclk  )
);


empty#(
.ASIZE(ASIZE)
)
empty_gen(
.rempty (rempty ),
.raddr  (raddr  ),
.rptr   (rptr   ),
.r_wptr (r_wptr ),
.ren	(ren	),
.rclk   (rclk   ),
.rrstn  (rrstn  )
);

full#(
.ASIZE(ASIZE)
)
full_gen(
.wfull  (wfull  ),
.waddr  (waddr  ),
.wptr   (wptr   ),
.w_rptr (w_rptr ),
.wen	(wen	),
.wclk   (wclk   ),
.wrstn  (wrstn  )
);

endmodule
