// // 75-133mhz-7.5ns  ? ??
parameter TRP  = 9'd3;  // trp = 20ns
parameter TRFC = 9'd9;  // trc =min 66ns
parameter TMRD = 9'd2;  // mrd = 2
parameter TRCD = 9'd3;  // trcd = 20ns
`ifdef VIVADO_SIM 
parameter TCL  = 9'd2;  // cl = 3 clk 
`else
parameter TCL  = 9'd3;  // cl = 3 clk 
`endif
parameter TDAL = 9'd5;  // tWR + tRP = (1clk + 7.5ns = 3 clk) -- (auto precharg--> + 2clk)

// ,?60ms?(?64ms?4ms?)
//parameter T_REFRESH_PERIOD = 32'd1041;   // 7.8us
parameter T_REFRESH_PERIOD = 32'd1040;   // 7.8us
parameter T_REFRESH_DOMAIN = 31'd40;
parameter T_200US = 15'd26_667; 

// write burst length
parameter W_BL = 9'd8;

// read burst length 2->4byte,8->16byte
parameter R_BL = 9'd8;


// sdram cmd define 
parameter	CMD_INHIBIT 	= 5'b11111;	// sdram is deselected ---	x1xxx	
parameter	CMD_NOP		= 5'b10111;	// sdram is selected but no option
parameter	CMD_ACTIVE	= 5'b10011;	// ACTIVE COMMAND
parameter	CMD_READ	= 5'b10101;	// READ COMMADN
parameter	CMD_WRITE	= 5'b10100;	// WRITE COMMAND
parameter	CMD_B_STOP	= 5'b10110;	// BURST STOP
parameter	CMD_PRECHARGE	= 5'b10010;	// PRECHARGE
parameter	CMD_A_REF	= 5'b10001;	// AOTO REFRESH
parameter	CMD_LMR		= 5'b10000;	// LODE MODE REGISTER A0~A11  A12=0

parameter	MODE_REGISTER	= { 
					 1'b0,       // A12 reserved
				    2'b00,      // ba1 ba0
				    1'b0,       // burst mode 0-programed burst length
				    2'b00,      // 00-stand op
				    3'b011,     // CAS Latency  CL = 3
				    1'b0,       // burst sequence
				    3'b011      // burst length  BL = 8
				  //  3'b001      // burst length  BL = 2
					};	// LODE MODE REGISTER A0~A11  A12=0


// sdram core  fsm
// initial state
parameter 	I_POWON 	= 5'd0;   // power on wait 200us
parameter 	I_PRE_CMD 	= 5'd1;   // precharge cmd 
parameter 	I_PRE_TRP 	= 5'd2;   // precharge TRP clk
parameter 	I_AR0_CMD 	= 5'd3;   // first refresh cmd
parameter 	I_AR0_TRFC 	= 5'd4;   // first refresh TRF clk
parameter 	I_AR1_CMD	= 5'd5;   // second refresh cmd
parameter 	I_AR1_TRFC	= 5'd6;   // second refresh TRF clk
parameter 	I_MRS_CMD 	= 5'd7;   // mode register set cmd
parameter 	I_MRS_TMRD 	= 5'd8;   // mode register set TMRD clk
parameter 	I_DONE 		= 5'd9;   // initial done

//work state
parameter  	S_IDLE  	= 5'd0;
parameter  	S_RAS_ACTIVE  	= 5'd1;
parameter  	S_TRCD  	= 5'd2;
parameter  	S_RD_CMD  	= 5'd3;
parameter  	S_CL 	 	= 5'd4;
parameter  	S_RD_DATA  	= 5'd5;
parameter  	S_R_PRECHARGE  	= 5'd6;
parameter  	S_RWAIT  	= 5'd7;
parameter  	S_WR_CMD  	= 5'd8;
parameter  	S_WR_DATA  	= 5'd9;
parameter  	S_TDAL  	= 5'd10;
parameter  	S_AR  		= 5'd11;
parameter  	S_TRFC  	= 5'd12;
parameter  	S_AR1  		= 5'd13;
parameter  	S_TRFC1  	= 5'd14;
parameter     S_NOP       = 5'd15;
parameter     S_R_END     = 5'd16;
//---------------------------------------
// read  FSM
// --------------------------------------

localparam   S_RD_IDLE 		= 5'd0;
localparam   S_RD_REQ 		= 5'd1;
localparam   S_RD_SDDATA	= 5'd2;
localparam   S_RD_TRANS 	= 5'd3;
localparam   S_RD_END 		= 5'd4;


//---------------------------------------
// write  FSM
// --------------------------------------

localparam   S_WR_IDLE 		= 5'd0;
localparam   S_WR_REQ 		= 5'd1;
localparam   S_WR_SDDATA	= 5'd2;
localparam   S_WR_END 		= 5'd3;
















