
?
Command: %s
53*	vivadotcl2O
;synth_design -top qspi_simulator_top -part xc7k325tffg900-22default:defaultZ4-113h px? 
:
Starting synth_design
149*	vivadotclZ4-321h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7k325t2default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7k325t2default:defaultZ17-349h px? 
?
Pparameter declaration becomes local in %s with formal parameter declaration list2507*oasys2 
qspi_rd_fifo2default:default2_
ID:/88-ISE_share/spi-simulator/design_rtl/my_rtl/qspi2sdram/qspi_rd_fifo.v2default:default2
392default:default8@Z8-2507h px? 
?
,redeclaration of ansi port %s is not allowed2611*oasys2

ref_domain2default:default2Z
DD:/88-ISE_share/spi-simulator/design_rtl/my_rtl/sdram_ctrl/sdram_t.v2default:default2
602default:default8@Z8-2611h px? 
?
,redeclaration of ansi port %s is not allowed2611*oasys2 
sdram_data_i2default:default2\
FD:/88-ISE_share/spi-simulator/design_rtl/my_rtl/sdram_ctrl/sdram_top.v2default:default2
842default:default8@Z8-2611h px? 
?
,redeclaration of ansi port %s is not allowed2611*oasys2 
sdram_data_o2default:default2\
FD:/88-ISE_share/spi-simulator/design_rtl/my_rtl/sdram_ctrl/sdram_top.v2default:default2
852default:default8@Z8-2611h px? 
?
,redeclaration of ansi port %s is not allowed2611*oasys2!
sdram_data_oe2default:default2\
FD:/88-ISE_share/spi-simulator/design_rtl/my_rtl/sdram_ctrl/sdram_top.v2default:default2
862default:default8@Z8-2611h px? 
?
%s*synth2?
sStarting Synthesize : Time (s): cpu = 00:00:02 ; elapsed = 00:00:02 . Memory (MB): peak = 445.137 ; gain = 113.770
2default:defaulth px? 
?
synthesizing module '%s'%s4497*oasys2&
qspi_simulator_top2default:default2
 2default:default2Z
DD:/88-ISE_share/spi-simulator/design_rtl/my_rtl/qspi_simulator_top.v2default:default2
172default:default8@Z8-6157h px? 
?
synthesizing module '%s'%s4497*oasys2"
qspi2sdram_top2default:default2
 2default:default2a
KD:/88-ISE_share/spi-simulator/design_rtl/my_rtl/qspi2sdram/qspi2sdram_top.v2default:default2
152default:default8@Z8-6157h px? 
O
%s
*synth27
#	Parameter RD_BL bound to: 3'b010 
2default:defaulth p
x
? 
?
synthesizing module '%s'%s4497*oasys2 
qspi_rd_fifo2default:default2
 2default:default2_
ID:/88-ISE_share/spi-simulator/design_rtl/my_rtl/qspi2sdram/qspi_rd_fifo.v2default:default2
162default:default8@Z8-6157h px? 
Z
%s
*synth2B
.	Parameter RD_BL bound to: 2 - type: integer 
2default:defaulth p
x
? 
\
%s
*synth2D
0	Parameter CMD_FAST_READ bound to: 8'b00001011 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter S_QSPI_CMD bound to: 3'b000 
2default:defaulth p
x
? 
U
%s
*synth2=
)	Parameter S_QSPI_ADDR bound to: 3'b001 
2default:defaulth p
x
? 
V
%s
*synth2>
*	Parameter S_QSPI_DUMMY bound to: 3'b010 
2default:defaulth p
x
? 
U
%s
*synth2=
)	Parameter S_QSPI_DATA bound to: 3'b011 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter S_QSPI_END bound to: 3'b100 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2 
qspi_rd_fifo2default:default2
 2default:default2
12default:default2
12default:default2_
ID:/88-ISE_share/spi-simulator/design_rtl/my_rtl/qspi2sdram/qspi_rd_fifo.v2default:default2
162default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2!
fifo_rd_sdram2default:default2
 2default:default2`
JD:/88-ISE_share/spi-simulator/design_rtl/my_rtl/qspi2sdram/fifo_rd_sdram.v2default:default2
152default:default8@Z8-6157h px? 
Z
%s
*synth2B
.	Parameter RD_BL bound to: 2 - type: integer 
2default:defaulth p
x
? 
S
%s
*synth2;
'	Parameter S_RD_IDLE bound to: 3'b000 
2default:defaulth p
x
? 
S
%s
*synth2;
'	Parameter S_RD_ADDR bound to: 3'b001 
2default:defaulth p
x
? 
S
%s
*synth2;
'	Parameter S_RD_DATA bound to: 3'b010 
2default:defaulth p
x
? 
V
%s
*synth2>
*	Parameter S_CHECK_FIFO bound to: 3'b011 
2default:defaulth p
x
? 
?
synthesizing module '%s'%s4497*oasys2!
asyn_fifo_top2default:default2
 2default:default2`
JD:/88-ISE_share/spi-simulator/design_rtl/my_rtl/async_fifo/asyn_fifo_top.v2default:default2
152default:default8@Z8-6157h px? 
_
%s
*synth2G
3	Parameter DATAWIDTH bound to: 16 - type: integer 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter ASIZE bound to: 10 - type: integer 
2default:defaulth p
x
? 
?
synthesizing module '%s'%s4497*oasys2
sync_r2w2default:default2
 2default:default2[
ED:/88-ISE_share/spi-simulator/design_rtl/my_rtl/async_fifo/sync_r2w.v2default:default2
112default:default8@Z8-6157h px? 
[
%s
*synth2C
/	Parameter ASIZE bound to: 10 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
sync_r2w2default:default2
 2default:default2
22default:default2
12default:default2[
ED:/88-ISE_share/spi-simulator/design_rtl/my_rtl/async_fifo/sync_r2w.v2default:default2
112default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2
sync_w2r2default:default2
 2default:default2[
ED:/88-ISE_share/spi-simulator/design_rtl/my_rtl/async_fifo/sync_w2r.v2default:default2
112default:default8@Z8-6157h px? 
[
%s
*synth2C
/	Parameter ASIZE bound to: 10 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
sync_w2r2default:default2
 2default:default2
32default:default2
12default:default2[
ED:/88-ISE_share/spi-simulator/design_rtl/my_rtl/async_fifo/sync_w2r.v2default:default2
112default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2
fifomem2default:default2
 2default:default2Z
DD:/88-ISE_share/spi-simulator/design_rtl/my_rtl/async_fifo/fifomen.v2default:default2
72default:default8@Z8-6157h px? 
_
%s
*synth2G
3	Parameter DATAWIDTH bound to: 16 - type: integer 
2default:defaulth p
x
? 
\
%s
*synth2D
0	Parameter DEEPTH bound to: 16 - type: integer 
2default:defaulth p
x
? 
[
%s
*synth2C
/	Parameter ASIZE bound to: 10 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
fifomem2default:default2
 2default:default2
42default:default2
12default:default2Z
DD:/88-ISE_share/spi-simulator/design_rtl/my_rtl/async_fifo/fifomen.v2default:default2
72default:default8@Z8-6155h px? 
?
Ginstance '%s' of module '%s' requires %s connections, but only %s given350*oasys2
fifo2default:default2
fifomem2default:default2
82default:default2
72default:default2`
JD:/88-ISE_share/spi-simulator/design_rtl/my_rtl/async_fifo/asyn_fifo_top.v2default:default2
562default:default8@Z8-350h px? 
?
synthesizing module '%s'%s4497*oasys2
empty2default:default2
 2default:default2X
BD:/88-ISE_share/spi-simulator/design_rtl/my_rtl/async_fifo/empty.v2default:default2
112default:default8@Z8-6157h px? 
[
%s
*synth2C
/	Parameter ASIZE bound to: 10 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
empty2default:default2
 2default:default2
52default:default2
12default:default2X
BD:/88-ISE_share/spi-simulator/design_rtl/my_rtl/async_fifo/empty.v2default:default2
112default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2
full2default:default2
 2default:default2W
AD:/88-ISE_share/spi-simulator/design_rtl/my_rtl/async_fifo/full.v2default:default2
102default:default8@Z8-6157h px? 
[
%s
*synth2C
/	Parameter ASIZE bound to: 10 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
full2default:default2
 2default:default2
62default:default2
12default:default2W
AD:/88-ISE_share/spi-simulator/design_rtl/my_rtl/async_fifo/full.v2default:default2
102default:default8@Z8-6155h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2!
asyn_fifo_top2default:default2
 2default:default2
72default:default2
12default:default2`
JD:/88-ISE_share/spi-simulator/design_rtl/my_rtl/async_fifo/asyn_fifo_top.v2default:default2
152default:default8@Z8-6155h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2!
fifo_rd_sdram2default:default2
 2default:default2
82default:default2
12default:default2`
JD:/88-ISE_share/spi-simulator/design_rtl/my_rtl/qspi2sdram/fifo_rd_sdram.v2default:default2
152default:default8@Z8-6155h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2"
qspi2sdram_top2default:default2
 2default:default2
92default:default2
12default:default2a
KD:/88-ISE_share/spi-simulator/design_rtl/my_rtl/qspi2sdram/qspi2sdram_top.v2default:default2
152default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2
	sdram_top2default:default2
 2default:default2\
FD:/88-ISE_share/spi-simulator/design_rtl/my_rtl/sdram_ctrl/sdram_top.v2default:default2
152default:default8@Z8-6157h px? 
?
synthesizing module '%s'%s4497*oasys2

sdram_core2default:default2
 2default:default2]
GD:/88-ISE_share/spi-simulator/design_rtl/my_rtl/sdram_ctrl/sdram_core.v2default:default2
192default:default8@Z8-6157h px? 
S
%s
*synth2;
'	Parameter TRP bound to: 9'b000000011 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter TRFC bound to: 9'b000001001 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter TMRD bound to: 9'b000000010 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter TRCD bound to: 9'b000000011 
2default:defaulth p
x
? 
S
%s
*synth2;
'	Parameter TCL bound to: 9'b000000011 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter TDAL bound to: 9'b000000101 
2default:defaulth p
x
? 
k
%s
*synth2S
?	Parameter T_REFRESH_PERIOD bound to: 8000000 - type: integer 
2default:defaulth p
x
? 
^
%s
*synth2F
2	Parameter T_200US bound to: 15'b110100000101011 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter W_BL bound to: 9'b000000010 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter R_BL bound to: 9'b000000010 
2default:defaulth p
x
? 
W
%s
*synth2?
+	Parameter CMD_INHIBIT bound to: 5'b01111 
2default:defaulth p
x
? 
S
%s
*synth2;
'	Parameter CMD_NOP bound to: 5'b10111 
2default:defaulth p
x
? 
V
%s
*synth2>
*	Parameter CMD_ACTIVE bound to: 5'b10011 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter CMD_READ bound to: 5'b10101 
2default:defaulth p
x
? 
U
%s
*synth2=
)	Parameter CMD_WRITE bound to: 5'b10100 
2default:defaulth p
x
? 
V
%s
*synth2>
*	Parameter CMD_B_STOP bound to: 5'b10110 
2default:defaulth p
x
? 
Y
%s
*synth2A
-	Parameter CMD_PRECHARGE bound to: 5'b10010 
2default:defaulth p
x
? 
U
%s
*synth2=
)	Parameter CMD_A_REF bound to: 5'b10001 
2default:defaulth p
x
? 
S
%s
*synth2;
'	Parameter CMD_LMR bound to: 5'b10000 
2default:defaulth p
x
? 
b
%s
*synth2J
6	Parameter MODE_REGISTER bound to: 13'b0000000110001 
2default:defaulth p
x
? 
S
%s
*synth2;
'	Parameter I_POWON bound to: 5'b00000 
2default:defaulth p
x
? 
U
%s
*synth2=
)	Parameter I_PRE_CMD bound to: 5'b00001 
2default:defaulth p
x
? 
U
%s
*synth2=
)	Parameter I_PRE_TRP bound to: 5'b00010 
2default:defaulth p
x
? 
U
%s
*synth2=
)	Parameter I_AR0_CMD bound to: 5'b00011 
2default:defaulth p
x
? 
V
%s
*synth2>
*	Parameter I_AR0_TRFC bound to: 5'b00100 
2default:defaulth p
x
? 
U
%s
*synth2=
)	Parameter I_AR1_CMD bound to: 5'b00101 
2default:defaulth p
x
? 
V
%s
*synth2>
*	Parameter I_AR1_TRFC bound to: 5'b00110 
2default:defaulth p
x
? 
U
%s
*synth2=
)	Parameter I_MRS_CMD bound to: 5'b00111 
2default:defaulth p
x
? 
V
%s
*synth2>
*	Parameter I_MRS_TMRD bound to: 5'b01000 
2default:defaulth p
x
? 
R
%s
*synth2:
&	Parameter I_DONE bound to: 5'b01001 
2default:defaulth p
x
? 
R
%s
*synth2:
&	Parameter S_IDLE bound to: 5'b00000 
2default:defaulth p
x
? 
X
%s
*synth2@
,	Parameter S_RAS_ACTIVE bound to: 5'b00001 
2default:defaulth p
x
? 
R
%s
*synth2:
&	Parameter S_TRCD bound to: 5'b00010 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter S_RD_CMD bound to: 5'b00011 
2default:defaulth p
x
? 
P
%s
*synth28
$	Parameter S_CL bound to: 5'b00100 
2default:defaulth p
x
? 
U
%s
*synth2=
)	Parameter S_RD_DATA bound to: 5'b00101 
2default:defaulth p
x
? 
Y
%s
*synth2A
-	Parameter S_R_PRECHARGE bound to: 5'b00110 
2default:defaulth p
x
? 
S
%s
*synth2;
'	Parameter S_RWAIT bound to: 5'b00111 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter S_WR_CMD bound to: 5'b01000 
2default:defaulth p
x
? 
U
%s
*synth2=
)	Parameter S_WR_DATA bound to: 5'b01001 
2default:defaulth p
x
? 
R
%s
*synth2:
&	Parameter S_TDAL bound to: 5'b01010 
2default:defaulth p
x
? 
P
%s
*synth28
$	Parameter S_AR bound to: 5'b01011 
2default:defaulth p
x
? 
R
%s
*synth2:
&	Parameter S_TRFC bound to: 5'b01100 
2default:defaulth p
x
? 
U
%s
*synth2=
)	Parameter S_RD_IDLE bound to: 5'b00000 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter S_RD_REQ bound to: 5'b00001 
2default:defaulth p
x
? 
W
%s
*synth2?
+	Parameter S_RD_SDDATA bound to: 5'b00010 
2default:defaulth p
x
? 
V
%s
*synth2>
*	Parameter S_RD_TRANS bound to: 5'b00011 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter S_RD_END bound to: 5'b00100 
2default:defaulth p
x
? 
U
%s
*synth2=
)	Parameter S_WR_IDLE bound to: 5'b00000 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter S_WR_REQ bound to: 5'b00001 
2default:defaulth p
x
? 
W
%s
*synth2?
+	Parameter S_WR_SDDATA bound to: 5'b00010 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter S_WR_END bound to: 5'b00011 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

sdram_core2default:default2
 2default:default2
102default:default2
12default:default2]
GD:/88-ISE_share/spi-simulator/design_rtl/my_rtl/sdram_ctrl/sdram_core.v2default:default2
192default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2
sdram_t2default:default2
 2default:default2Z
DD:/88-ISE_share/spi-simulator/design_rtl/my_rtl/sdram_ctrl/sdram_t.v2default:default2
172default:default8@Z8-6157h px? 
S
%s
*synth2;
'	Parameter TRP bound to: 9'b000000011 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter TRFC bound to: 9'b000001001 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter TMRD bound to: 9'b000000010 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter TRCD bound to: 9'b000000011 
2default:defaulth p
x
? 
S
%s
*synth2;
'	Parameter TCL bound to: 9'b000000011 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter TDAL bound to: 9'b000000101 
2default:defaulth p
x
? 
k
%s
*synth2S
?	Parameter T_REFRESH_PERIOD bound to: 8000000 - type: integer 
2default:defaulth p
x
? 
^
%s
*synth2F
2	Parameter T_200US bound to: 15'b110100000101011 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter W_BL bound to: 9'b000000010 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter R_BL bound to: 9'b000000010 
2default:defaulth p
x
? 
W
%s
*synth2?
+	Parameter CMD_INHIBIT bound to: 5'b01111 
2default:defaulth p
x
? 
S
%s
*synth2;
'	Parameter CMD_NOP bound to: 5'b10111 
2default:defaulth p
x
? 
V
%s
*synth2>
*	Parameter CMD_ACTIVE bound to: 5'b10011 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter CMD_READ bound to: 5'b10101 
2default:defaulth p
x
? 
U
%s
*synth2=
)	Parameter CMD_WRITE bound to: 5'b10100 
2default:defaulth p
x
? 
V
%s
*synth2>
*	Parameter CMD_B_STOP bound to: 5'b10110 
2default:defaulth p
x
? 
Y
%s
*synth2A
-	Parameter CMD_PRECHARGE bound to: 5'b10010 
2default:defaulth p
x
? 
U
%s
*synth2=
)	Parameter CMD_A_REF bound to: 5'b10001 
2default:defaulth p
x
? 
S
%s
*synth2;
'	Parameter CMD_LMR bound to: 5'b10000 
2default:defaulth p
x
? 
b
%s
*synth2J
6	Parameter MODE_REGISTER bound to: 13'b0000000110001 
2default:defaulth p
x
? 
S
%s
*synth2;
'	Parameter I_POWON bound to: 5'b00000 
2default:defaulth p
x
? 
U
%s
*synth2=
)	Parameter I_PRE_CMD bound to: 5'b00001 
2default:defaulth p
x
? 
U
%s
*synth2=
)	Parameter I_PRE_TRP bound to: 5'b00010 
2default:defaulth p
x
? 
U
%s
*synth2=
)	Parameter I_AR0_CMD bound to: 5'b00011 
2default:defaulth p
x
? 
V
%s
*synth2>
*	Parameter I_AR0_TRFC bound to: 5'b00100 
2default:defaulth p
x
? 
U
%s
*synth2=
)	Parameter I_AR1_CMD bound to: 5'b00101 
2default:defaulth p
x
? 
V
%s
*synth2>
*	Parameter I_AR1_TRFC bound to: 5'b00110 
2default:defaulth p
x
? 
U
%s
*synth2=
)	Parameter I_MRS_CMD bound to: 5'b00111 
2default:defaulth p
x
? 
V
%s
*synth2>
*	Parameter I_MRS_TMRD bound to: 5'b01000 
2default:defaulth p
x
? 
R
%s
*synth2:
&	Parameter I_DONE bound to: 5'b01001 
2default:defaulth p
x
? 
R
%s
*synth2:
&	Parameter S_IDLE bound to: 5'b00000 
2default:defaulth p
x
? 
X
%s
*synth2@
,	Parameter S_RAS_ACTIVE bound to: 5'b00001 
2default:defaulth p
x
? 
R
%s
*synth2:
&	Parameter S_TRCD bound to: 5'b00010 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter S_RD_CMD bound to: 5'b00011 
2default:defaulth p
x
? 
P
%s
*synth28
$	Parameter S_CL bound to: 5'b00100 
2default:defaulth p
x
? 
U
%s
*synth2=
)	Parameter S_RD_DATA bound to: 5'b00101 
2default:defaulth p
x
? 
Y
%s
*synth2A
-	Parameter S_R_PRECHARGE bound to: 5'b00110 
2default:defaulth p
x
? 
S
%s
*synth2;
'	Parameter S_RWAIT bound to: 5'b00111 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter S_WR_CMD bound to: 5'b01000 
2default:defaulth p
x
? 
U
%s
*synth2=
)	Parameter S_WR_DATA bound to: 5'b01001 
2default:defaulth p
x
? 
R
%s
*synth2:
&	Parameter S_TDAL bound to: 5'b01010 
2default:defaulth p
x
? 
P
%s
*synth28
$	Parameter S_AR bound to: 5'b01011 
2default:defaulth p
x
? 
R
%s
*synth2:
&	Parameter S_TRFC bound to: 5'b01100 
2default:defaulth p
x
? 
U
%s
*synth2=
)	Parameter S_RD_IDLE bound to: 5'b00000 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter S_RD_REQ bound to: 5'b00001 
2default:defaulth p
x
? 
W
%s
*synth2?
+	Parameter S_RD_SDDATA bound to: 5'b00010 
2default:defaulth p
x
? 
V
%s
*synth2>
*	Parameter S_RD_TRANS bound to: 5'b00011 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter S_RD_END bound to: 5'b00100 
2default:defaulth p
x
? 
U
%s
*synth2=
)	Parameter S_WR_IDLE bound to: 5'b00000 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter S_WR_REQ bound to: 5'b00001 
2default:defaulth p
x
? 
W
%s
*synth2?
+	Parameter S_WR_SDDATA bound to: 5'b00010 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter S_WR_END bound to: 5'b00011 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
sdram_t2default:default2
 2default:default2
112default:default2
12default:default2Z
DD:/88-ISE_share/spi-simulator/design_rtl/my_rtl/sdram_ctrl/sdram_t.v2default:default2
172default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2
	sdram_cmd2default:default2
 2default:default2\
FD:/88-ISE_share/spi-simulator/design_rtl/my_rtl/sdram_ctrl/sdram_cmd.v2default:default2
382default:default8@Z8-6157h px? 
S
%s
*synth2;
'	Parameter TRP bound to: 9'b000000011 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter TRFC bound to: 9'b000001001 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter TMRD bound to: 9'b000000010 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter TRCD bound to: 9'b000000011 
2default:defaulth p
x
? 
S
%s
*synth2;
'	Parameter TCL bound to: 9'b000000011 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter TDAL bound to: 9'b000000101 
2default:defaulth p
x
? 
k
%s
*synth2S
?	Parameter T_REFRESH_PERIOD bound to: 8000000 - type: integer 
2default:defaulth p
x
? 
^
%s
*synth2F
2	Parameter T_200US bound to: 15'b110100000101011 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter W_BL bound to: 9'b000000010 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter R_BL bound to: 9'b000000010 
2default:defaulth p
x
? 
W
%s
*synth2?
+	Parameter CMD_INHIBIT bound to: 5'b01111 
2default:defaulth p
x
? 
S
%s
*synth2;
'	Parameter CMD_NOP bound to: 5'b10111 
2default:defaulth p
x
? 
V
%s
*synth2>
*	Parameter CMD_ACTIVE bound to: 5'b10011 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter CMD_READ bound to: 5'b10101 
2default:defaulth p
x
? 
U
%s
*synth2=
)	Parameter CMD_WRITE bound to: 5'b10100 
2default:defaulth p
x
? 
V
%s
*synth2>
*	Parameter CMD_B_STOP bound to: 5'b10110 
2default:defaulth p
x
? 
Y
%s
*synth2A
-	Parameter CMD_PRECHARGE bound to: 5'b10010 
2default:defaulth p
x
? 
U
%s
*synth2=
)	Parameter CMD_A_REF bound to: 5'b10001 
2default:defaulth p
x
? 
S
%s
*synth2;
'	Parameter CMD_LMR bound to: 5'b10000 
2default:defaulth p
x
? 
b
%s
*synth2J
6	Parameter MODE_REGISTER bound to: 13'b0000000110001 
2default:defaulth p
x
? 
S
%s
*synth2;
'	Parameter I_POWON bound to: 5'b00000 
2default:defaulth p
x
? 
U
%s
*synth2=
)	Parameter I_PRE_CMD bound to: 5'b00001 
2default:defaulth p
x
? 
U
%s
*synth2=
)	Parameter I_PRE_TRP bound to: 5'b00010 
2default:defaulth p
x
? 
U
%s
*synth2=
)	Parameter I_AR0_CMD bound to: 5'b00011 
2default:defaulth p
x
? 
V
%s
*synth2>
*	Parameter I_AR0_TRFC bound to: 5'b00100 
2default:defaulth p
x
? 
U
%s
*synth2=
)	Parameter I_AR1_CMD bound to: 5'b00101 
2default:defaulth p
x
? 
V
%s
*synth2>
*	Parameter I_AR1_TRFC bound to: 5'b00110 
2default:defaulth p
x
? 
U
%s
*synth2=
)	Parameter I_MRS_CMD bound to: 5'b00111 
2default:defaulth p
x
? 
V
%s
*synth2>
*	Parameter I_MRS_TMRD bound to: 5'b01000 
2default:defaulth p
x
? 
R
%s
*synth2:
&	Parameter I_DONE bound to: 5'b01001 
2default:defaulth p
x
? 
R
%s
*synth2:
&	Parameter S_IDLE bound to: 5'b00000 
2default:defaulth p
x
? 
X
%s
*synth2@
,	Parameter S_RAS_ACTIVE bound to: 5'b00001 
2default:defaulth p
x
? 
R
%s
*synth2:
&	Parameter S_TRCD bound to: 5'b00010 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter S_RD_CMD bound to: 5'b00011 
2default:defaulth p
x
? 
P
%s
*synth28
$	Parameter S_CL bound to: 5'b00100 
2default:defaulth p
x
? 
U
%s
*synth2=
)	Parameter S_RD_DATA bound to: 5'b00101 
2default:defaulth p
x
? 
Y
%s
*synth2A
-	Parameter S_R_PRECHARGE bound to: 5'b00110 
2default:defaulth p
x
? 
S
%s
*synth2;
'	Parameter S_RWAIT bound to: 5'b00111 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter S_WR_CMD bound to: 5'b01000 
2default:defaulth p
x
? 
U
%s
*synth2=
)	Parameter S_WR_DATA bound to: 5'b01001 
2default:defaulth p
x
? 
R
%s
*synth2:
&	Parameter S_TDAL bound to: 5'b01010 
2default:defaulth p
x
? 
P
%s
*synth28
$	Parameter S_AR bound to: 5'b01011 
2default:defaulth p
x
? 
R
%s
*synth2:
&	Parameter S_TRFC bound to: 5'b01100 
2default:defaulth p
x
? 
U
%s
*synth2=
)	Parameter S_RD_IDLE bound to: 5'b00000 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter S_RD_REQ bound to: 5'b00001 
2default:defaulth p
x
? 
W
%s
*synth2?
+	Parameter S_RD_SDDATA bound to: 5'b00010 
2default:defaulth p
x
? 
V
%s
*synth2>
*	Parameter S_RD_TRANS bound to: 5'b00011 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter S_RD_END bound to: 5'b00100 
2default:defaulth p
x
? 
U
%s
*synth2=
)	Parameter S_WR_IDLE bound to: 5'b00000 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter S_WR_REQ bound to: 5'b00001 
2default:defaulth p
x
? 
W
%s
*synth2?
+	Parameter S_WR_SDDATA bound to: 5'b00010 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter S_WR_END bound to: 5'b00011 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
	sdram_cmd2default:default2
 2default:default2
122default:default2
12default:default2\
FD:/88-ISE_share/spi-simulator/design_rtl/my_rtl/sdram_ctrl/sdram_cmd.v2default:default2
382default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2

sdram_data2default:default2
 2default:default2]
GD:/88-ISE_share/spi-simulator/design_rtl/my_rtl/sdram_ctrl/sdram_data.v2default:default2
152default:default8@Z8-6157h px? 
S
%s
*synth2;
'	Parameter TRP bound to: 9'b000000011 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter TRFC bound to: 9'b000001001 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter TMRD bound to: 9'b000000010 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter TRCD bound to: 9'b000000011 
2default:defaulth p
x
? 
S
%s
*synth2;
'	Parameter TCL bound to: 9'b000000011 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter TDAL bound to: 9'b000000101 
2default:defaulth p
x
? 
k
%s
*synth2S
?	Parameter T_REFRESH_PERIOD bound to: 8000000 - type: integer 
2default:defaulth p
x
? 
^
%s
*synth2F
2	Parameter T_200US bound to: 15'b110100000101011 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter W_BL bound to: 9'b000000010 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter R_BL bound to: 9'b000000010 
2default:defaulth p
x
? 
W
%s
*synth2?
+	Parameter CMD_INHIBIT bound to: 5'b01111 
2default:defaulth p
x
? 
S
%s
*synth2;
'	Parameter CMD_NOP bound to: 5'b10111 
2default:defaulth p
x
? 
V
%s
*synth2>
*	Parameter CMD_ACTIVE bound to: 5'b10011 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter CMD_READ bound to: 5'b10101 
2default:defaulth p
x
? 
U
%s
*synth2=
)	Parameter CMD_WRITE bound to: 5'b10100 
2default:defaulth p
x
? 
V
%s
*synth2>
*	Parameter CMD_B_STOP bound to: 5'b10110 
2default:defaulth p
x
? 
Y
%s
*synth2A
-	Parameter CMD_PRECHARGE bound to: 5'b10010 
2default:defaulth p
x
? 
U
%s
*synth2=
)	Parameter CMD_A_REF bound to: 5'b10001 
2default:defaulth p
x
? 
S
%s
*synth2;
'	Parameter CMD_LMR bound to: 5'b10000 
2default:defaulth p
x
? 
b
%s
*synth2J
6	Parameter MODE_REGISTER bound to: 13'b0000000110001 
2default:defaulth p
x
? 
S
%s
*synth2;
'	Parameter I_POWON bound to: 5'b00000 
2default:defaulth p
x
? 
U
%s
*synth2=
)	Parameter I_PRE_CMD bound to: 5'b00001 
2default:defaulth p
x
? 
U
%s
*synth2=
)	Parameter I_PRE_TRP bound to: 5'b00010 
2default:defaulth p
x
? 
U
%s
*synth2=
)	Parameter I_AR0_CMD bound to: 5'b00011 
2default:defaulth p
x
? 
V
%s
*synth2>
*	Parameter I_AR0_TRFC bound to: 5'b00100 
2default:defaulth p
x
? 
U
%s
*synth2=
)	Parameter I_AR1_CMD bound to: 5'b00101 
2default:defaulth p
x
? 
V
%s
*synth2>
*	Parameter I_AR1_TRFC bound to: 5'b00110 
2default:defaulth p
x
? 
U
%s
*synth2=
)	Parameter I_MRS_CMD bound to: 5'b00111 
2default:defaulth p
x
? 
V
%s
*synth2>
*	Parameter I_MRS_TMRD bound to: 5'b01000 
2default:defaulth p
x
? 
R
%s
*synth2:
&	Parameter I_DONE bound to: 5'b01001 
2default:defaulth p
x
? 
R
%s
*synth2:
&	Parameter S_IDLE bound to: 5'b00000 
2default:defaulth p
x
? 
X
%s
*synth2@
,	Parameter S_RAS_ACTIVE bound to: 5'b00001 
2default:defaulth p
x
? 
R
%s
*synth2:
&	Parameter S_TRCD bound to: 5'b00010 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter S_RD_CMD bound to: 5'b00011 
2default:defaulth p
x
? 
P
%s
*synth28
$	Parameter S_CL bound to: 5'b00100 
2default:defaulth p
x
? 
U
%s
*synth2=
)	Parameter S_RD_DATA bound to: 5'b00101 
2default:defaulth p
x
? 
Y
%s
*synth2A
-	Parameter S_R_PRECHARGE bound to: 5'b00110 
2default:defaulth p
x
? 
S
%s
*synth2;
'	Parameter S_RWAIT bound to: 5'b00111 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter S_WR_CMD bound to: 5'b01000 
2default:defaulth p
x
? 
U
%s
*synth2=
)	Parameter S_WR_DATA bound to: 5'b01001 
2default:defaulth p
x
? 
R
%s
*synth2:
&	Parameter S_TDAL bound to: 5'b01010 
2default:defaulth p
x
? 
P
%s
*synth28
$	Parameter S_AR bound to: 5'b01011 
2default:defaulth p
x
? 
R
%s
*synth2:
&	Parameter S_TRFC bound to: 5'b01100 
2default:defaulth p
x
? 
U
%s
*synth2=
)	Parameter S_RD_IDLE bound to: 5'b00000 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter S_RD_REQ bound to: 5'b00001 
2default:defaulth p
x
? 
W
%s
*synth2?
+	Parameter S_RD_SDDATA bound to: 5'b00010 
2default:defaulth p
x
? 
V
%s
*synth2>
*	Parameter S_RD_TRANS bound to: 5'b00011 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter S_RD_END bound to: 5'b00100 
2default:defaulth p
x
? 
U
%s
*synth2=
)	Parameter S_WR_IDLE bound to: 5'b00000 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter S_WR_REQ bound to: 5'b00001 
2default:defaulth p
x
? 
W
%s
*synth2?
+	Parameter S_WR_SDDATA bound to: 5'b00010 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter S_WR_END bound to: 5'b00011 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

sdram_data2default:default2
 2default:default2
132default:default2
12default:default2]
GD:/88-ISE_share/spi-simulator/design_rtl/my_rtl/sdram_ctrl/sdram_data.v2default:default2
152default:default8@Z8-6155h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
	sdram_top2default:default2
 2default:default2
142default:default2
12default:default2\
FD:/88-ISE_share/spi-simulator/design_rtl/my_rtl/sdram_ctrl/sdram_top.v2default:default2
152default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2!
cyp2sdram_top2default:default2
 2default:default2_
ID:/88-ISE_share/spi-simulator/design_rtl/my_rtl/cyp2sdram/cyp2sdram_top.v2default:default2
162default:default8@Z8-6157h px? 
?
synthesizing module '%s'%s4497*oasys2
cyp_wr_fifo2default:default2
 2default:default2]
GD:/88-ISE_share/spi-simulator/design_rtl/my_rtl/cyp2sdram/cyp_wr_fifo.v2default:default2
152default:default8@Z8-6157h px? 
P
%s
*synth28
$	Parameter IDLE bound to: 5'b00000 
2default:defaulth p
x
? 
X
%s
*synth2@
,	Parameter CYP_READ_PRE bound to: 5'b00001 
2default:defaulth p
x
? 
T
%s
*synth2<
(	Parameter CYP_READ bound to: 5'b00010 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
cyp_wr_fifo2default:default2
 2default:default2
152default:default2
12default:default2]
GD:/88-ISE_share/spi-simulator/design_rtl/my_rtl/cyp2sdram/cyp_wr_fifo.v2default:default2
152default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2!
fifo_wr_sdram2default:default2
 2default:default2_
ID:/88-ISE_share/spi-simulator/design_rtl/my_rtl/cyp2sdram/fifo_wr_sdram.v2default:default2
142default:default8@Z8-6157h px? 
W
%s
*synth2?
+	Parameter SD_WR_BL bound to: 8'b00000010 
2default:defaulth p
x
? 
V
%s
*synth2>
*	Parameter S_IDLE bound to: 9'b000000000 
2default:defaulth p
x
? 
\
%s
*synth2D
0	Parameter S_WAIT_10CLK bound to: 9'b000000001 
2default:defaulth p
x
? 
Y
%s
*synth2A
-	Parameter S_RD_FIFO bound to: 9'b000000010 
2default:defaulth p
x
? 
Y
%s
*synth2A
-	Parameter S_WAIT_WR bound to: 9'b000000011 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	Parameter S_ADDR_GEN bound to: 9'b000000100 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2!
fifo_wr_sdram2default:default2
 2default:default2
162default:default2
12default:default2_
ID:/88-ISE_share/spi-simulator/design_rtl/my_rtl/cyp2sdram/fifo_wr_sdram.v2default:default2
142default:default8@Z8-6155h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2!
cyp2sdram_top2default:default2
 2default:default2
172default:default2
12default:default2_
ID:/88-ISE_share/spi-simulator/design_rtl/my_rtl/cyp2sdram/cyp2sdram_top.v2default:default2
162default:default8@Z8-6155h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2&
qspi_simulator_top2default:default2
 2default:default2
182default:default2
12default:default2Z
DD:/88-ISE_share/spi-simulator/design_rtl/my_rtl/qspi_simulator_top.v2default:default2
172default:default8@Z8-6155h px? 
|
!design %s has unconnected port %s3331*oasys2
fifomem2default:default2
resetn2default:defaultZ8-3331h px? 
~
!design %s has unconnected port %s3331*oasys2
fifomem2default:default2
waddr[9]2default:defaultZ8-3331h px? 
~
!design %s has unconnected port %s3331*oasys2
fifomem2default:default2
waddr[8]2default:defaultZ8-3331h px? 
~
!design %s has unconnected port %s3331*oasys2
fifomem2default:default2
waddr[7]2default:defaultZ8-3331h px? 
~
!design %s has unconnected port %s3331*oasys2
fifomem2default:default2
waddr[6]2default:defaultZ8-3331h px? 
~
!design %s has unconnected port %s3331*oasys2
fifomem2default:default2
waddr[5]2default:defaultZ8-3331h px? 
~
!design %s has unconnected port %s3331*oasys2
fifomem2default:default2
waddr[4]2default:defaultZ8-3331h px? 
~
!design %s has unconnected port %s3331*oasys2
fifomem2default:default2
raddr[9]2default:defaultZ8-3331h px? 
~
!design %s has unconnected port %s3331*oasys2
fifomem2default:default2
raddr[8]2default:defaultZ8-3331h px? 
~
!design %s has unconnected port %s3331*oasys2
fifomem2default:default2
raddr[7]2default:defaultZ8-3331h px? 
~
!design %s has unconnected port %s3331*oasys2
fifomem2default:default2
raddr[6]2default:defaultZ8-3331h px? 
~
!design %s has unconnected port %s3331*oasys2
fifomem2default:default2
raddr[5]2default:defaultZ8-3331h px? 
~
!design %s has unconnected port %s3331*oasys2
fifomem2default:default2
raddr[4]2default:defaultZ8-3331h px? 
{
!design %s has unconnected port %s3331*oasys2
fifomem2default:default2
wfull2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
cyp_wr_fifo2default:default2
	usb_flagb2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
cyp_wr_fifo2default:default2
	usb_flagc2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2

sdram_data2default:default2!
init_state[4]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2

sdram_data2default:default2!
init_state[3]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2

sdram_data2default:default2!
init_state[2]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2

sdram_data2default:default2!
init_state[1]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2

sdram_data2default:default2!
init_state[0]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2

sdram_data2default:default2!
work_state[4]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2

sdram_data2default:default2!
work_state[3]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2

sdram_data2default:default2!
work_state[2]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2

sdram_data2default:default2!
work_state[1]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2

sdram_data2default:default2!
work_state[0]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2

sdram_data2default:default2%
cur_init_state[4]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2

sdram_data2default:default2%
cur_init_state[3]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2

sdram_data2default:default2%
cur_init_state[2]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2

sdram_data2default:default2%
cur_init_state[1]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2

sdram_data2default:default2%
cur_init_state[0]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
sdram_t2default:default2%
cur_init_state[4]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
sdram_t2default:default2%
cur_init_state[3]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
sdram_t2default:default2%
cur_init_state[2]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
sdram_t2default:default2%
cur_init_state[1]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
sdram_t2default:default2%
cur_init_state[0]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2

sdram_core2default:default2

ref_domain2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2!
fifo_rd_sdram2default:default2$
qspi_rd_addr[23]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2!
fifo_rd_sdram2default:default2$
qspi_rd_addr[22]2default:defaultZ8-3331h px? 
~
!design %s has unconnected port %s3331*oasys2 
qspi_rd_fifo2default:default2
csn2default:defaultZ8-3331h px? 
~
!design %s has unconnected port %s3331*oasys2 
qspi_rd_fifo2default:default2
wpn2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2 
qspi_rd_fifo2default:default2
holdn2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2 
qspi_rd_fifo2default:default2 
qspi_rd_busy2default:defaultZ8-3331h px? 
?
%s*synth2?
sFinished Synthesize : Time (s): cpu = 00:00:02 ; elapsed = 00:00:03 . Memory (MB): peak = 483.375 ; gain = 152.008
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
~Finished Constraint Validation : Time (s): cpu = 00:00:02 ; elapsed = 00:00:03 . Memory (MB): peak = 483.375 ; gain = 152.008
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Loading part: xc7k325tffg900-2
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
W
Loading part %s157*device2$
xc7k325tffg900-22default:defaultZ21-403h px? 
?
%s*synth2?
?Finished Loading Part and Timing Information : Time (s): cpu = 00:00:02 ; elapsed = 00:00:03 . Memory (MB): peak = 483.375 ; gain = 152.008
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
3inferred FSM for state register '%s' in module '%s'802*oasys2"
qspi_state_reg2default:default2 
qspi_rd_fifo2default:defaultZ8-802h px? 
s
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
do02default:defaultZ8-5546h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2

qspi_state2default:default2
12default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2

qspi_state2default:default2
12default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2

qspi_state2default:default2
12default:default2
52default:defaultZ8-5544h px? 
?
3inferred FSM for state register '%s' in module '%s'802*oasys2 
rd_state_reg2default:default2!
fifo_rd_sdram2default:defaultZ8-802h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2
rd_state2default:default2
12default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2
rd_state2default:default2
32default:default2
52default:defaultZ8-5544h px? 
?
3inferred FSM for state register '%s' in module '%s'802*oasys2$
init_state_r_reg2default:default2

sdram_core2default:defaultZ8-802h px? 
?
3inferred FSM for state register '%s' in module '%s'802*oasys2$
work_state_r_reg2default:default2

sdram_core2default:defaultZ8-802h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2 
init_state_r2default:default2
12default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2 
init_state_r2default:default2
12default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2 
init_state_r2default:default2
12default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2 
init_state_r2default:default2
12default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2 
work_state_r2default:default2
12default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2 
work_state_r2default:default2
12default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2 
work_state_r2default:default2
12default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2 
work_state_r2default:default2
12default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2 
work_state_r2default:default2
12default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2 
work_state_r2default:default2
12default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2 
work_state_r2default:default2
12default:default2
52default:defaultZ8-5544h px? 
?
^ROM "%s" won't be mapped to RAM because address size (%s) is larger than maximum supported(%s)3997*oasys2
ref_cnt2default:default2
322default:default2
252default:defaultZ8-5545h px? 
{
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
sdram_cmd_r2default:defaultZ8-5546h px? 
?
3inferred FSM for state register '%s' in module '%s'802*oasys2!
cyp_state_reg2default:default2
cyp_wr_fifo2default:defaultZ8-802h px? 
|
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2 
usb_fifoaddr2default:defaultZ8-5546h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2
	cyp_state2default:default2
12default:default2
52default:defaultZ8-5544h px? 
?
3inferred FSM for state register '%s' in module '%s'802*oasys2 
wr_state_reg2default:default2!
fifo_wr_sdram2default:defaultZ8-802h px? 
x
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
wr_state2default:defaultZ8-5546h px? 
x
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
wr_state2default:defaultZ8-5546h px? 
x
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
wr_state2default:defaultZ8-5546h px? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2s
_              S_QSPI_CMD |                            00001 |                            00000
2default:defaulth p
x
? 
?
%s
*synth2s
_             S_QSPI_ADDR |                            10000 |                            00001
2default:defaulth p
x
? 
?
%s
*synth2s
_            S_QSPI_DUMMY |                            01000 |                            00010
2default:defaulth p
x
? 
?
%s
*synth2s
_             S_QSPI_DATA |                            00100 |                            00011
2default:defaulth p
x
? 
?
%s
*synth2s
_              S_QSPI_END |                            00010 |                            00100
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2"
qspi_state_reg2default:default2
one-hot2default:default2 
qspi_rd_fifo2default:defaultZ8-3354h px? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2s
_               S_RD_IDLE |                               00 |                              000
2default:defaulth p
x
? 
?
%s
*synth2s
_               S_RD_ADDR |                               01 |                              001
2default:defaulth p
x
? 
?
%s
*synth2s
_               S_RD_DATA |                               10 |                              010
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2 
rd_state_reg2default:default2

sequential2default:default2!
fifo_rd_sdram2default:defaultZ8-3354h px? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2s
_                 I_POWON |                       0000000001 |                            00000
2default:defaulth p
x
? 
?
%s
*synth2s
_               I_PRE_CMD |                       0000000010 |                            00001
2default:defaulth p
x
? 
?
%s
*synth2s
_               I_PRE_TRP |                       0000000100 |                            00010
2default:defaulth p
x
? 
?
%s
*synth2s
_               I_AR0_CMD |                       0000001000 |                            00011
2default:defaulth p
x
? 
?
%s
*synth2s
_              I_AR0_TRFC |                       0000010000 |                            00100
2default:defaulth p
x
? 
?
%s
*synth2s
_               I_AR1_CMD |                       0000100000 |                            00101
2default:defaulth p
x
? 
?
%s
*synth2s
_              I_AR1_TRFC |                       0001000000 |                            00110
2default:defaulth p
x
? 
?
%s
*synth2s
_               I_MRS_CMD |                       0010000000 |                            00111
2default:defaulth p
x
? 
?
%s
*synth2s
_              I_MRS_TMRD |                       0100000000 |                            01000
2default:defaulth p
x
? 
?
%s
*synth2s
_                  I_DONE |                       1000000000 |                            01001
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2$
init_state_r_reg2default:default2
one-hot2default:default2

sdram_core2default:defaultZ8-3354h px? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2s
_                  S_IDLE |                    0000000000001 |                            00000
2default:defaulth p
x
? 
?
%s
*synth2s
_                    S_AR |                    0000000000010 |                            01011
2default:defaulth p
x
? 
?
%s
*synth2s
_                  S_TRFC |                    1000000000000 |                            01100
2default:defaulth p
x
? 
?
%s
*synth2s
_            S_RAS_ACTIVE |                    0000000000100 |                            00001
2default:defaulth p
x
? 
?
%s
*synth2s
_                  S_TRCD |                    0100000000000 |                            00010
2default:defaulth p
x
? 
?
%s
*synth2s
_                S_RD_CMD |                    0001000000000 |                            00011
2default:defaulth p
x
? 
?
%s
*synth2s
_                    S_CL |                    0010000000000 |                            00100
2default:defaulth p
x
? 
?
%s
*synth2s
_               S_RD_DATA |                    0000100000000 |                            00101
2default:defaulth p
x
? 
?
%s
*synth2s
_           S_R_PRECHARGE |                    0000001000000 |                            00110
2default:defaulth p
x
? 
?
%s
*synth2s
_                 S_RWAIT |                    0000000001000 |                            00111
2default:defaulth p
x
? 
?
%s
*synth2s
_                S_WR_CMD |                    0000010000000 |                            01000
2default:defaulth p
x
? 
?
%s
*synth2s
_               S_WR_DATA |                    0000000010000 |                            01001
2default:defaulth p
x
? 
?
%s
*synth2s
_                  S_TDAL |                    0000000100000 |                            01010
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2$
work_state_r_reg2default:default2
one-hot2default:default2

sdram_core2default:defaultZ8-3354h px? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2s
_                    IDLE |                              001 |                            00000
2default:defaulth p
x
? 
?
%s
*synth2s
_            CYP_READ_PRE |                              010 |                            00001
2default:defaulth p
x
? 
?
%s
*synth2s
_                CYP_READ |                              100 |                            00010
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2!
cyp_state_reg2default:default2
one-hot2default:default2
cyp_wr_fifo2default:defaultZ8-3354h px? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2s
_                  S_IDLE |                            00001 |                            00000
2default:defaulth p
x
? 
?
%s
*synth2s
_            S_WAIT_10CLK |                            00010 |                            00001
2default:defaulth p
x
? 
?
%s
*synth2s
_               S_RD_FIFO |                            00100 |                            00010
2default:defaulth p
x
? 
?
%s
*synth2s
_               S_WAIT_WR |                            01000 |                            00011
2default:defaulth p
x
? 
?
%s
*synth2s
_              S_ADDR_GEN |                            10000 |                            00100
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2 
wr_state_reg2default:default2
one-hot2default:default2!
fifo_wr_sdram2default:defaultZ8-3354h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:04 ; elapsed = 00:00:04 . Memory (MB): peak = 529.477 ; gain = 198.109
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     32 Bit       Adders := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     11 Bit       Adders := 4     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      9 Bit       Adders := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      8 Bit       Adders := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      3 Bit       Adders := 6     
2default:defaulth p
x
? 
8
%s
*synth2 
+---XORs : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     11 Bit         XORs := 4     
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               32 Bit    Registers := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               24 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               22 Bit    Registers := 4     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               16 Bit    Registers := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               13 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               11 Bit    Registers := 12    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                9 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                8 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                5 Bit    Registers := 5     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                3 Bit    Registers := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                2 Bit    Registers := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 10    
2default:defaulth p
x
? 
8
%s
*synth2 
+---RAMs : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               48 Bit         RAMs := 1     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     32 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     22 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     16 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  13 Input     13 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     13 Bit        Muxes := 12    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  10 Input     13 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  14 Input     13 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  10 Input     10 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     10 Bit        Muxes := 5     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      9 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      8 Bit        Muxes := 3     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   5 Input      5 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      5 Bit        Muxes := 8     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  10 Input      5 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  13 Input      5 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  23 Input      5 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      3 Bit        Muxes := 10    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   3 Input      3 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   3 Input      2 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      2 Bit        Muxes := 10    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  10 Input      2 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  14 Input      2 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      2 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit        Muxes := 9     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   5 Input      1 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  13 Input      1 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  14 Input      1 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  10 Input      1 Bit        Muxes := 2     
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Y
%s
*synth2A
-Start RTL Hierarchical Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Hierarchical RTL Component report 
2default:defaulth p
x
? 
A
%s
*synth2)
Module qspi_rd_fifo 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      3 Bit       Adders := 1     
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               32 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               24 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               16 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                3 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 1     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     16 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   5 Input      5 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      5 Bit        Muxes := 4     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      3 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   5 Input      1 Bit        Muxes := 1     
2default:defaulth p
x
? 
=
%s
*synth2%
Module sync_r2w 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               11 Bit    Registers := 2     
2default:defaulth p
x
? 
=
%s
*synth2%
Module sync_w2r 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               11 Bit    Registers := 2     
2default:defaulth p
x
? 
:
%s
*synth2"
Module empty 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     11 Bit       Adders := 1     
2default:defaulth p
x
? 
8
%s
*synth2 
+---XORs : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     11 Bit         XORs := 1     
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               11 Bit    Registers := 1     
2default:defaulth p
x
? 
9
%s
*synth2!
Module full 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     11 Bit       Adders := 1     
2default:defaulth p
x
? 
8
%s
*synth2 
+---XORs : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     11 Bit         XORs := 1     
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               11 Bit    Registers := 1     
2default:defaulth p
x
? 
B
%s
*synth2*
Module fifo_rd_sdram 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      3 Bit       Adders := 1     
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               22 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                3 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 2     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      3 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   3 Input      2 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      2 Bit        Muxes := 4     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit        Muxes := 3     
2default:defaulth p
x
? 
?
%s
*synth2'
Module sdram_core 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                5 Bit    Registers := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 1     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  13 Input     13 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     13 Bit        Muxes := 10    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  10 Input     10 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     10 Bit        Muxes := 5     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  10 Input      5 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  13 Input      5 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  13 Input      1 Bit        Muxes := 1     
2default:defaulth p
x
? 
<
%s
*synth2$
Module sdram_t 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     32 Bit       Adders := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      9 Bit       Adders := 1     
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               32 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                9 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 3     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     32 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      9 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit        Muxes := 1     
2default:defaulth p
x
? 
>
%s
*synth2&
Module sdram_cmd 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               22 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               13 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                5 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                2 Bit    Registers := 1     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     22 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     13 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  10 Input     13 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  14 Input     13 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  23 Input      5 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      2 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  10 Input      2 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  14 Input      2 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit        Muxes := 3     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  14 Input      1 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  10 Input      1 Bit        Muxes := 2     
2default:defaulth p
x
? 
?
%s
*synth2'
Module sdram_data 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      3 Bit       Adders := 4     
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               22 Bit    Registers := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                5 Bit    Registers := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 2     
2default:defaulth p
x
? 
8
%s
*synth2 
+---RAMs : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               48 Bit         RAMs := 1     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      3 Bit        Muxes := 6     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      2 Bit        Muxes := 4     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      2 Bit        Muxes := 1     
2default:defaulth p
x
? 
@
%s
*synth2(
Module cyp_wr_fifo 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                2 Bit    Registers := 1     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   3 Input      3 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      3 Bit        Muxes := 2     
2default:defaulth p
x
? 
B
%s
*synth2*
Module fifo_wr_sdram 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      8 Bit       Adders := 1     
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               16 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                8 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 1     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     16 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      8 Bit        Muxes := 3     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   5 Input      5 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      5 Bit        Muxes := 4     
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
[
%s
*synth2C
/Finished RTL Hierarchical Component Statistics
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2m
YPart Resources:
DSPs: 840 (col length:140)
BRAMs: 890 (col length: RAMB18 140 RAMB36 70)
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
]
%s
*synth2E
1Warning: Parallel synthesis criteria is not met 
2default:defaulth p
x
? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2?
+qspi2sdram_inst/fifo_rd_sdram_inst/rd_state2default:default2
32default:default2
52default:defaultZ8-5544h px? 
?
^ROM "%s" won't be mapped to RAM because address size (%s) is larger than maximum supported(%s)3997*oasys28
$sdram_ctrl_inst/sdram_t_inst/ref_cnt2default:default2
322default:default2
252default:defaultZ8-5545h px? 
?
+design %s has port %s driven by constant %s3447*oasys2&
qspi_simulator_top2default:default2
usb_slcs2default:default2
02default:defaultZ8-3917h px? 
?
+design %s has port %s driven by constant %s3447*oasys2&
qspi_simulator_top2default:default2
usb_slwr2default:default2
12default:defaultZ8-3917h px? 
?
+design %s has port %s driven by constant %s3447*oasys2&
qspi_simulator_top2default:default2 
usb_fd_o[15]2default:default2
12default:defaultZ8-3917h px? 
?
+design %s has port %s driven by constant %s3447*oasys2&
qspi_simulator_top2default:default2 
usb_fd_o[14]2default:default2
12default:defaultZ8-3917h px? 
?
+design %s has port %s driven by constant %s3447*oasys2&
qspi_simulator_top2default:default2 
usb_fd_o[13]2default:default2
12default:defaultZ8-3917h px? 
?
+design %s has port %s driven by constant %s3447*oasys2&
qspi_simulator_top2default:default2 
usb_fd_o[12]2default:default2
12default:defaultZ8-3917h px? 
?
+design %s has port %s driven by constant %s3447*oasys2&
qspi_simulator_top2default:default2 
usb_fd_o[11]2default:default2
12default:defaultZ8-3917h px? 
?
+design %s has port %s driven by constant %s3447*oasys2&
qspi_simulator_top2default:default2 
usb_fd_o[10]2default:default2
12default:defaultZ8-3917h px? 
?
+design %s has port %s driven by constant %s3447*oasys2&
qspi_simulator_top2default:default2
usb_fd_o[9]2default:default2
12default:defaultZ8-3917h px? 
?
+design %s has port %s driven by constant %s3447*oasys2&
qspi_simulator_top2default:default2
usb_fd_o[8]2default:default2
12default:defaultZ8-3917h px? 
?
+design %s has port %s driven by constant %s3447*oasys2&
qspi_simulator_top2default:default2
usb_fd_o[7]2default:default2
12default:defaultZ8-3917h px? 
?
+design %s has port %s driven by constant %s3447*oasys2&
qspi_simulator_top2default:default2
usb_fd_o[6]2default:default2
12default:defaultZ8-3917h px? 
?
+design %s has port %s driven by constant %s3447*oasys2&
qspi_simulator_top2default:default2
usb_fd_o[5]2default:default2
12default:defaultZ8-3917h px? 
?
+design %s has port %s driven by constant %s3447*oasys2&
qspi_simulator_top2default:default2
usb_fd_o[4]2default:default2
12default:defaultZ8-3917h px? 
?
+design %s has port %s driven by constant %s3447*oasys2&
qspi_simulator_top2default:default2
usb_fd_o[3]2default:default2
12default:defaultZ8-3917h px? 
?
+design %s has port %s driven by constant %s3447*oasys2&
qspi_simulator_top2default:default2
usb_fd_o[2]2default:default2
12default:defaultZ8-3917h px? 
?
+design %s has port %s driven by constant %s3447*oasys2&
qspi_simulator_top2default:default2
usb_fd_o[1]2default:default2
12default:defaultZ8-3917h px? 
?
+design %s has port %s driven by constant %s3447*oasys2&
qspi_simulator_top2default:default2
usb_fd_o[0]2default:default2
12default:defaultZ8-3917h px? 
?
+design %s has port %s driven by constant %s3447*oasys2&
qspi_simulator_top2default:default2
pa02default:default2
12default:defaultZ8-3917h px? 
?
!design %s has unconnected port %s3331*oasys2&
qspi_simulator_top2default:default2
csn2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2&
qspi_simulator_top2default:default2
wpn2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2&
qspi_simulator_top2default:default2
holdn2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2&
qspi_simulator_top2default:default2
	usb_flagb2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2&
qspi_simulator_top2default:default2
	usb_flagc2default:defaultZ8-3331h px? 
?
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2K
7i_76/\cyp2sdram_inst/fifo_wr_sdram_inst/wr_addr_reg[0] 2default:defaultZ8-3333h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2I
5sdram_ctrl_inst/sdram_core_inst/cur_work_state_reg[4]2default:default2
FDC2default:default2C
/sdram_ctrl_inst/sdram_data_inst/wr_state_reg[4]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2C
/sdram_ctrl_inst/sdram_data_inst/rd_state_reg[3]2default:default2
FDC2default:default2C
/sdram_ctrl_inst/sdram_data_inst/wr_state_reg[4]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2C
/sdram_ctrl_inst/sdram_data_inst/rd_state_reg[4]2default:default2
FDC2default:default2C
/sdram_ctrl_inst/sdram_data_inst/wr_state_reg[4]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2C
/sdram_ctrl_inst/sdram_data_inst/wr_state_reg[4]2default:default2
FDC2default:default2C
/sdram_ctrl_inst/sdram_data_inst/wr_state_reg[3]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2C
/sdram_ctrl_inst/sdram_data_inst/wr_state_reg[3]2default:default2
FDC2default:default2C
/sdram_ctrl_inst/sdram_data_inst/wr_state_reg[2]2default:defaultZ8-3886h px? 
?
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2E
1\sdram_ctrl_inst/sdram_data_inst/wr_state_reg[2] 2default:defaultZ8-3333h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2F
2cyp2sdram_inst/cy_wr_fifo_inst/usb_fifoaddr_reg[0]2default:default2
FDCE2default:default2F
2cyp2sdram_inst/cy_wr_fifo_inst/usb_fifoaddr_reg[1]2default:defaultZ8-3886h px? 
?
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2H
4\cyp2sdram_inst/cy_wr_fifo_inst/usb_fifoaddr_reg[1] 2default:defaultZ8-3333h px? 
?
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2G
3\sdram_ctrl_inst/sdram_cmd_inst/sdram_cmd_r_reg[3] 2default:defaultZ8-3333h px? 
?
6propagating constant %s across sequential element (%s)3333*oasys2
12default:default2G
3\sdram_ctrl_inst/sdram_cmd_inst/sdram_cmd_r_reg[4] 2default:defaultZ8-3333h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:07 ; elapsed = 00:00:08 . Memory (MB): peak = 710.820 ; gain = 379.453
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?---------------------------------------------------------------------------------
Start ROM, RAM, DSP and Shift Register Reporting
2default:defaulth px? 
~
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px? 
k
%s*synth2S
?
Distributed RAM: Preliminary Mapping  Report (see note below)
2default:defaulth px? 
?
%s*synth2?
?+-------------------+-------------------------------------------------------------+-----------+----------------------+--------------+
2default:defaulth px? 
?
%s*synth2?
?|Module Name        | RTL Object                                                  | Inference | Size (Depth x Width) | Primitives   | 
2default:defaulth px? 
?
%s*synth2?
?+-------------------+-------------------------------------------------------------+-----------+----------------------+--------------+
2default:defaulth px? 
?
%s*synth2?
?|qspi_simulator_top | sdram_ctrl_inst/sdram_data_inst/temp_rdata_reg              | Implied   | 4 x 16               | RAM32M x 3   | 
2default:defaulth px? 
?
%s*synth2?
?|qspi_simulator_top | qspi2sdram_inst/fifo_rd_sdram_inst/rdfifo_inst/fifo/mem_reg | Implied   | 16 x 16              | RAM32M x 3   | 
2default:defaulth px? 
?
%s*synth2?
?|qspi_simulator_top | cyp2sdram_inst/cy_wr_fifo_inst/wrfifo_inst/fifo/mem_reg     | Implied   | 16 x 16              | RAM32M x 3   | 
2default:defaulth px? 
?
%s*synth2?
?|qspi_simulator_top | sdram_ctrl_inst/sdram_data_inst/temp_wdata_reg              | Implied   | 4 x 16               | RAM32M x 3   | 
2default:defaulth px? 
?
%s*synth2?
?+-------------------+-------------------------------------------------------------+-----------+----------------------+--------------+

2default:defaulth px? 
?
%s*synth2?
?Note: The table above is a preliminary report that shows the Distributed RAMs at the current stage of the synthesis flow. Some Distributed RAMs may be reimplemented as non Distributed RAM primitives later in the synthesis flow. Multiple instantiated RAMs are reported only once.
2default:defaulth px? 
?
%s*synth2?
?---------------------------------------------------------------------------------
Finished ROM, RAM, DSP and Shift Register Reporting
2default:defaulth px? 
~
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px? 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
|Finished Timing Optimization : Time (s): cpu = 00:00:07 ; elapsed = 00:00:08 . Memory (MB): peak = 710.820 ; gain = 379.453
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2?
?---------------------------------------------------------------------------------
Start ROM, RAM, DSP and Shift Register Reporting
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
T
%s
*synth2<
(
Distributed RAM: Final Mapping  Report
2default:defaulth p
x
? 
?
%s
*synth2?
?+-------------------+-------------------------------------------------------------+-----------+----------------------+--------------+
2default:defaulth p
x
? 
?
%s
*synth2?
?|Module Name        | RTL Object                                                  | Inference | Size (Depth x Width) | Primitives   | 
2default:defaulth p
x
? 
?
%s
*synth2?
?+-------------------+-------------------------------------------------------------+-----------+----------------------+--------------+
2default:defaulth p
x
? 
?
%s
*synth2?
?|qspi_simulator_top | sdram_ctrl_inst/sdram_data_inst/temp_rdata_reg              | Implied   | 4 x 16               | RAM32M x 3   | 
2default:defaulth p
x
? 
?
%s
*synth2?
?|qspi_simulator_top | qspi2sdram_inst/fifo_rd_sdram_inst/rdfifo_inst/fifo/mem_reg | Implied   | 16 x 16              | RAM32M x 3   | 
2default:defaulth p
x
? 
?
%s
*synth2?
?|qspi_simulator_top | cyp2sdram_inst/cy_wr_fifo_inst/wrfifo_inst/fifo/mem_reg     | Implied   | 16 x 16              | RAM32M x 3   | 
2default:defaulth p
x
? 
?
%s
*synth2?
?|qspi_simulator_top | sdram_ctrl_inst/sdram_data_inst/temp_wdata_reg              | Implied   | 4 x 16               | RAM32M x 3   | 
2default:defaulth p
x
? 
?
%s
*synth2?
?+-------------------+-------------------------------------------------------------+-----------+----------------------+--------------+

2default:defaulth p
x
? 
?
%s
*synth2?
?---------------------------------------------------------------------------------
Finished ROM, RAM, DSP and Shift Register Reporting
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
{Finished Technology Mapping : Time (s): cpu = 00:00:07 ; elapsed = 00:00:08 . Memory (MB): peak = 710.820 ; gain = 379.453
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
uFinished IO Insertion : Time (s): cpu = 00:00:08 ; elapsed = 00:00:09 . Memory (MB): peak = 710.820 ; gain = 379.453
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
D
%s
*synth2,

Report Check Netlist: 
2default:defaulth p
x
? 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
? 
u
%s
*synth2]
I|      |Item              |Errors |Warnings |Status |Description       |
2default:defaulth p
x
? 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
? 
u
%s
*synth2]
I|1     |multi_driven_nets |      0|        0|Passed |Multi driven nets |
2default:defaulth p
x
? 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Instances : Time (s): cpu = 00:00:08 ; elapsed = 00:00:09 . Memory (MB): peak = 710.820 ; gain = 379.453
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:08 ; elapsed = 00:00:09 . Memory (MB): peak = 710.820 ; gain = 379.453
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Ports : Time (s): cpu = 00:00:08 ; elapsed = 00:00:09 . Memory (MB): peak = 710.820 ; gain = 379.453
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Handling Custom Attributes : Time (s): cpu = 00:00:08 ; elapsed = 00:00:09 . Memory (MB): peak = 710.820 ; gain = 379.453
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Nets : Time (s): cpu = 00:00:08 ; elapsed = 00:00:09 . Memory (MB): peak = 710.820 ; gain = 379.453
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
J
%s
*synth22
| |BlackBox name |Instances |
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px? 
D
%s*synth2,
+------+-------+------+
2default:defaulth px? 
D
%s*synth2,
|      |Cell   |Count |
2default:defaulth px? 
D
%s*synth2,
+------+-------+------+
2default:defaulth px? 
D
%s*synth2,
|1     |BUFG   |     3|
2default:defaulth px? 
D
%s*synth2,
|2     |CARRY4 |    26|
2default:defaulth px? 
D
%s*synth2,
|3     |LUT1   |    17|
2default:defaulth px? 
D
%s*synth2,
|4     |LUT2   |    78|
2default:defaulth px? 
D
%s*synth2,
|5     |LUT3   |    65|
2default:defaulth px? 
D
%s*synth2,
|6     |LUT4   |    93|
2default:defaulth px? 
D
%s*synth2,
|7     |LUT5   |    55|
2default:defaulth px? 
D
%s*synth2,
|8     |LUT6   |   142|
2default:defaulth px? 
D
%s*synth2,
|9     |RAM32M |    12|
2default:defaulth px? 
D
%s*synth2,
|10    |FDCE   |   461|
2default:defaulth px? 
D
%s*synth2,
|11    |FDPE   |    25|
2default:defaulth px? 
D
%s*synth2,
|12    |IBUF   |    38|
2default:defaulth px? 
D
%s*synth2,
|13    |OBUF   |    63|
2default:defaulth px? 
D
%s*synth2,
|14    |OBUFT  |     1|
2default:defaulth px? 
D
%s*synth2,
+------+-------+------+
2default:defaulth px? 
E
%s
*synth2-

Report Instance Areas: 
2default:defaulth p
x
? 
e
%s
*synth2M
9+------+-----------------------+----------------+------+
2default:defaulth p
x
? 
e
%s
*synth2M
9|      |Instance               |Module          |Cells |
2default:defaulth p
x
? 
e
%s
*synth2M
9+------+-----------------------+----------------+------+
2default:defaulth p
x
? 
e
%s
*synth2M
9|1     |top                    |                |  1079|
2default:defaulth p
x
? 
e
%s
*synth2M
9|2     |  cyp2sdram_inst       |cyp2sdram_top   |   231|
2default:defaulth p
x
? 
e
%s
*synth2M
9|3     |    cy_wr_fifo_inst    |cyp_wr_fifo     |   153|
2default:defaulth p
x
? 
e
%s
*synth2M
9|4     |      wrfifo_inst      |asyn_fifo_top_0 |   150|
2default:defaulth p
x
? 
e
%s
*synth2M
9|5     |        empty_gen      |empty_1         |    40|
2default:defaulth p
x
? 
e
%s
*synth2M
9|6     |        fifo           |fifomem_2       |    19|
2default:defaulth p
x
? 
e
%s
*synth2M
9|7     |        full_gen       |full_3          |    45|
2default:defaulth p
x
? 
e
%s
*synth2M
9|8     |        sync_r2w       |sync_r2w_4      |    23|
2default:defaulth p
x
? 
e
%s
*synth2M
9|9     |        sync_w2r       |sync_w2r_5      |    23|
2default:defaulth p
x
? 
e
%s
*synth2M
9|10    |    fifo_wr_sdram_inst |fifo_wr_sdram   |    78|
2default:defaulth p
x
? 
e
%s
*synth2M
9|11    |  qspi2sdram_inst      |qspi2sdram_top  |   315|
2default:defaulth p
x
? 
e
%s
*synth2M
9|12    |    fifo_rd_sdram_inst |fifo_rd_sdram   |   165|
2default:defaulth p
x
? 
e
%s
*synth2M
9|13    |      rdfifo_inst      |asyn_fifo_top   |   129|
2default:defaulth p
x
? 
e
%s
*synth2M
9|14    |        empty_gen      |empty           |    40|
2default:defaulth p
x
? 
e
%s
*synth2M
9|15    |        fifo           |fifomem         |     3|
2default:defaulth p
x
? 
e
%s
*synth2M
9|16    |        full_gen       |full            |    40|
2default:defaulth p
x
? 
e
%s
*synth2M
9|17    |        sync_r2w       |sync_r2w        |    23|
2default:defaulth p
x
? 
e
%s
*synth2M
9|18    |        sync_w2r       |sync_w2r        |    23|
2default:defaulth p
x
? 
e
%s
*synth2M
9|19    |    qspi_rd_fifo_inst  |qspi_rd_fifo    |   150|
2default:defaulth p
x
? 
e
%s
*synth2M
9|20    |  sdram_ctrl_inst      |sdram_top       |   428|
2default:defaulth p
x
? 
e
%s
*synth2M
9|21    |    sdram_cmd_inst     |sdram_cmd       |    40|
2default:defaulth p
x
? 
e
%s
*synth2M
9|22    |    sdram_core_inst    |sdram_core      |   138|
2default:defaulth p
x
? 
e
%s
*synth2M
9|23    |    sdram_data_inst    |sdram_data      |   112|
2default:defaulth p
x
? 
e
%s
*synth2M
9|24    |    sdram_t_inst       |sdram_t         |   138|
2default:defaulth p
x
? 
e
%s
*synth2M
9+------+-----------------------+----------------+------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Writing Synthesis Report : Time (s): cpu = 00:00:08 ; elapsed = 00:00:09 . Memory (MB): peak = 710.820 ; gain = 379.453
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
s
%s
*synth2[
GSynthesis finished with 0 errors, 0 critical warnings and 73 warnings.
2default:defaulth p
x
? 
?
%s
*synth2?
~Synthesis Optimization Runtime : Time (s): cpu = 00:00:08 ; elapsed = 00:00:09 . Memory (MB): peak = 710.820 ; gain = 379.453
2default:defaulth p
x
? 
?
%s
*synth2?
Synthesis Optimization Complete : Time (s): cpu = 00:00:08 ; elapsed = 00:00:09 . Memory (MB): peak = 710.820 ; gain = 379.453
2default:defaulth p
x
? 
B
 Translating synthesized netlist
350*projectZ1-571h px? 
f
-Analyzing %s Unisim elements for replacement
17*netlist2
382default:defaultZ29-17h px? 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
793.9492default:default2
0.0002default:defaultZ17-268h px? 
?
!Unisim Transformation Summary:
%s111*project2?
?  A total of 12 instances were transformed.
  RAM32M => RAM32M (RAMD32, RAMD32, RAMD32, RAMD32, RAMD32, RAMD32, RAMS32, RAMS32): 12 instances
2default:defaultZ1-111h px? 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
942default:default2
732default:default2
02default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:00:132default:default2
00:00:142default:default2
793.9492default:default2
475.6022default:defaultZ17-268h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
793.9492default:default2
0.0002default:defaultZ17-268h px? 
K
"No constraints selected for write.1103*constraintsZ18-5210h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2\
HD:/88-ISE_share/vivado_sim/ip_vivado.runs/synth_1/qspi_simulator_top.dcp2default:defaultZ17-1381h px? 
?
%s4*runtcl2?
zExecuting : report_utilization -file qspi_simulator_top_utilization_synth.rpt -pb qspi_simulator_top_utilization_synth.pb
2default:defaulth px? 
?
Exiting %s at %s...
206*common2
Vivado2default:default2,
Wed Jul  6 11:05:48 20222default:defaultZ17-206h px? 


End Record