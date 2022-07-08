Note:

Only surpport FastRead mode (0Bh)

One read commend  for 32 bits data(4Bytes)

DUMMY 8bits

Sdram controllor only worked in 133mhz for device  mt48lc16m16a2-75-PC133-CL3

qspi clk  <= 50mhz

usb clk = 48mhz(cypress 68013)



//   PIN SITE           J6
//                    --1+2-- 
//  qspi_di(io0)      --3+4--  qspi_do (io1)
//                    --5+6-- 
//  qspi_wpn(io2)     --7+8--  qspi_holdn (io3)
//  qspi_CSN          --9+10--  qspi_CLK 
//

