//-----------------------------------------------------------------------------
//   File:      bulkloop.c
//   Contents:  Hooks required to implement USB peripheral function.
//
// $Archive: /USB/Examples/FX2LP/bulkloop/bulkloop.c $
//
//
//-----------------------------------------------------------------------------
// Copyright (c) 2011, Cypress Semiconductor Corporation All rights reserved
//-----------------------------------------------------------------------------
#pragma NOIV               // Do not generate interrupt vectors

#include "..\inc\fx2.h"
#include "..\inc\fx2regs.h"
#include "..\inc\syncdly.h"            // SYNCDELAY macro

extern BOOL GotSUD;             // Received setup data flag
extern BOOL Sleep;
extern BOOL Rwuen;
extern BOOL Selfpwr;

BYTE Configuration;             // Current configuration
BYTE AlternateSetting;          // Alternate settings

// sam add

//------end sam add

#define VR_NAKALL_ON    0xD0
#define VR_NAKALL_OFF   0xD1

//-----------------------------------------------------------------------------
// Task Dispatcher hooks
//   The following hooks are called by the task dispatcher.
//-----------------------------------------------------------------------------

void TD_Init(void)             // Called once at startup
{


   // set the CPU clock to 48MHz
   CPUCS = ((CPUCS & ~bmCLKSPD) | bmCLKSPD1) ;
	SYNCDELAY;

   REVCTL = 0x03; // REVCTL.0 and REVCTL.1 to set to 1
	SYNCDELAY;  

   // [7] IFCLKSRC: 0- EXTEND 1-INTERNAL;[6] 30/48: 0-30MHZ 1-48MHZ; [5]IFCLKOE:0-IN 1-OUT; [4]IFCLKPOL: 0
   // [3] ASYNC:0-SYNC 1-ASYNC; [2]G_STATE 0-XX 1-PORT[0:2]; [1:0] IFCFG:00-PORT 01-RSV 11-SLAVE FIFO
   //IFCONFIG |= 0x43; // set the slave FIFO interface to 48MHz / slave fifo
	//IFCONFIG |= 0x53; // IFCLK 48MHz / IFCLK REVERT/ slave fifo
	//IFCONFIG |= 0x13; // IFCLK 30MHz/ IFCLK REVERT / slave fifo
   IFCONFIG |= 0xE3; // 1110 0011  INTERNAL CLK  OUTPUT OE SLAVE FIFO
	SYNCDELAY;	 

  // Registers which require a synchronization delay, see section 15.14
  // FIFORESET        FIFOPINPOLAR
  // INPKTEND         OUTPKTEND
  // EPxBCH:L         REVCTL
  // GPIFTCB3         GPIFTCB2
  // GPIFTCB1         GPIFTCB0
  // EPxFIFOPFH:L     EPxAUTOINLENH:L
  // EPxFIFOCFG       EPxGPIFFLGSEL
  // PINFLAGSxx       EPxFIFOIRQ
  // EPxFIFOIE        GPIFIRQ
  // GPIFIE           GPIFADRH:L
  // UDMACRCH:L       EPxGPIFTRIG
  // GPIFTRIG
  
  // Note: The pre-REVE EPxGPIFTCH/L register are affected, as well...
  //      ...these have been replaced by GPIFTC[B3:B0] registers

  // default: all endpoints have their VALID bit set
  // default: TYPE1 = 1 and TYPE0 = 0 --> BULK  
  // default: EP2 and EP4 DIR bits are 0 (OUT direction)
  // default: EP6 and EP8 DIR bits are 1 (IN direction)
  // default: EP2, EP4, EP6, and EP8 are double buffered


  // we are just using the default values, yes this is not necessary...
  // see TRM section 15.14
  
  //EP2CFG = 0xA0;                // OUT  valid bulk 512B 4buf
  EP2CFG = 0xA8;                // OUT  valid bulk 1024B 4buf
  //EP2CFG = 0xA2;                  // OUT  valid bulk 512B 2buf
  SYNCDELAY;                    
  
  //EP4CFG = 0xA0;                // OUT  valid 512B 2BUF
  //SYNCDELAY;                    
  //EP6CFG = 0x7f;                // IN   invalid
  //SYNCDELAY;                    
  //EP8CFG = 0x7f;                // IN   invalid
  //SYNCDELAY;


  FIFORESET = 0x80; // Reset the FIFO
  SYNCDELAY;
  FIFORESET = 0x82;
  SYNCDELAY;
  FIFORESET = 0x00;
  SYNCDELAY;

  OUTPKTEND = 0x82;  //
  SYNCDELAY;
  OUTPKTEND = 0x82;  //
  SYNCDELAY;
  OUTPKTEND = 0x82;  //
  SYNCDELAY;
  OUTPKTEND = 0x82;  //
  SYNCDELAY;
  // 
  //SYNCDELAY;
  //EP2FIFOCFG = 0x00;              // AUTO=0, WORDWIDE=0(0-8bit 1-16bits)                    
  EP2FIFOCFG = 0x11;              // AUTO=1, WORDWIDE=1
  SYNCDELAY;

  //EP4FIFOCFG = 0x11;              // AUTO=1, WORDWIDE=1
  //SYNCDELAY;  
        
  //EP6FIFOCFG = 0x00;              // AUTO=0, WORDWIDE=0
  //SYNCDELAY;                    
  //EP6FIFOCFG = 0x0D;              // AUTO=1, WORDWIDE=1
  //SYNCDELAY;
                

	// [7:4] flagb: 
	// [3:0] flaga:
	//  0100-EP2PF  0101-EP4PF 0110-EP6PF 0111-EP8PF
   //  1000-EP2EF  1001-EP4EF 1010EP6EF  1011-EP8EF
	//  1100-EP2FF  1101-EP4FF 1110-EP6FF 1111-EP8FF
	//  OTHER-RSV
   PINFLAGSAB = 0xC8;     // FLAGB - fixed EP2FF FLAGA - EP2EF  
   SYNCDELAY;

   PINFLAGSCD = 0xDE;     // FLAGD - unvalid  FLAGC - fixed EP6FF
   SYNCDELAY;

   PORTACFG = 0x40;       // func of PA7 pin is SLCS#
   SYNCDELAY;

   FIFOPINPOLAR = 0x00;   // ACTIVE LOW
	SYNCDELAY;

  // out endpoints do not come up armed
  
  // since the defaults are double buffered we must write dummy byte counts twice
                   
//  EP2BCL = 0x80;                // arm EP2OUT by writing byte count w/skip.
//  SYNCDELAY;                                        
//  EP2BCL = 0x80;
//  SYNCDELAY;
//  EP2BCL = 0x80;
//  SYNCDELAY;
//  EP2BCL = 0x80;
//  SYNCDELAY;                  

  //EP4BCL = 0x80;
  //SYNCDELAY;                  
  //EP4BCL = 0x80;
  //SYNCDELAY;


                   
  //EP2FIFOBCL = 0x00;
  //SYNCDELAY;
  //EP2FIFOBCH = 0x04;
  //SYNCDELAY;   

  // enable dual autopointer feature
  //AUTOPTRSETUP |= 0x01;
  //SYNCDELAY;


}


void TD_Poll(void)              // Called repeatedly while the device is idle
{
/*  
WORD count;
  WORD  i;


// no code necessary to xfr data from host to master! AUTOOUT=1 auto-commits packets
if (!(EP2468STAT & bmEP2EMPTY))
{
	APTR1H = MSB( &EP2FIFOBUF ); // Initializing the first data pointer
	SYNCDELAY;
	APTR1L = LSB( &EP2FIFOBUF ); 
	SYNCDELAY;
	count = (EP2BCH << 8) + EP2BCL; // The count value is loaded from the byte
   // count registers
	for( i = 0x0000; i < count; i++ )
	{
	// setup to transfer EP2OUT buffer to EP6IN buffer using AUTOPOINTER(s)
	//EXTAUTODAT2 = EXTAUTODAT1;
	} 

	
   EP2BCL = 0x80; // re (arm) EP2OUT

   SYNCDELAY;
}


*/

/*
  WORD i;
  WORD count;

  if(!(EP2468STAT & bmEP2EMPTY))
  { // check EP2 EMPTY(busy) bit in EP2468STAT (SFR), core set's this bit when FIFO is empty
     if(!(EP2468STAT & bmEP6FULL))
     {  // check EP6 FULL(busy) bit in EP2468STAT (SFR), core set's this bit when FIFO is full
        APTR1H = MSB( &EP2FIFOBUF );
        APTR1L = LSB( &EP2FIFOBUF );

        AUTOPTRH2 = MSB( &EP6FIFOBUF );
        AUTOPTRL2 = LSB( &EP6FIFOBUF );

        count = (EP2BCH << 8) + EP2BCL;

        // loop EP2OUT buffer data to EP6IN
        for( i = 0x0000; i < count; i++ )
        {
           // setup to transfer EP2OUT buffer to EP6IN buffer using AUTOPOINTER(s)
           EXTAUTODAT2 = EXTAUTODAT1;
        }
        EP6BCH = EP2BCH;  
        SYNCDELAY;  
        EP6BCL = EP2BCL;        // arm EP6IN
        SYNCDELAY;                    
        EP2BCL = 0x80;          // re(arm) EP2OUT
     }
  }

  if(!(EP2468STAT & bmEP4EMPTY))
  { // check EP4 EMPTY(busy) bit in EP2468STAT (SFR), core set's this bit when FIFO is empty
     if(!(EP2468STAT & bmEP8FULL))
     {  // check EP8 FULL(busy) bit in EP2468STAT (SFR), core set's this bit when FIFO is full
        APTR1H = MSB( &EP4FIFOBUF );
        APTR1L = LSB( &EP4FIFOBUF );

        AUTOPTRH2 = MSB( &EP8FIFOBUF );
        AUTOPTRL2 = LSB( &EP8FIFOBUF );

        count = (EP4BCH << 8) + EP4BCL;

        // loop EP4OUT buffer data to EP8IN
        for( i = 0x0000; i < count; i++ )
        {
           // setup to transfer EP4OUT buffer to EP8IN buffer using AUTOPOINTER(s)
           EXTAUTODAT2 = EXTAUTODAT1;
        }
        EP8BCH = EP4BCH;  
        SYNCDELAY;  
        EP8BCL = EP4BCL;        // arm EP8IN
        SYNCDELAY;                    
        EP4BCL = 0x80;          // re(arm) EP4OUT
     }
  }
*/
}

BOOL TD_Suspend(void)          // Called before the device goes into suspend mode
{
   return(TRUE);
}

BOOL TD_Resume(void)          // Called after the device resumes
{
   return(TRUE);
}

//-----------------------------------------------------------------------------
// Device Request hooks
//   The following hooks are called by the end point 0 device request parser.
//-----------------------------------------------------------------------------

BOOL DR_GetDescriptor(void)
{
   return(TRUE);
}

BOOL DR_SetConfiguration(void)   // Called when a Set Configuration command is received
{
   Configuration = SETUPDAT[2];
   return(TRUE);            // Handled by user code
}

BOOL DR_GetConfiguration(void)   // Called when a Get Configuration command is received
{
   EP0BUF[0] = Configuration;
   EP0BCH = 0;
   EP0BCL = 1;
   return(TRUE);            // Handled by user code
}

BOOL DR_SetInterface(void)       // Called when a Set Interface command is received
{
   AlternateSetting = SETUPDAT[2];
   return(TRUE);            // Handled by user code
}

BOOL DR_GetInterface(void)       // Called when a Set Interface command is received
{
   EP0BUF[0] = AlternateSetting;
   EP0BCH = 0;
   EP0BCL = 1;
   return(TRUE);            // Handled by user code
}

BOOL DR_GetStatus(void)
{
   return(TRUE);
}

BOOL DR_ClearFeature(void)
{
   return(TRUE);
}

BOOL DR_SetFeature(void)
{
   return(TRUE);
}

BOOL DR_VendorCmnd(void)
{
  BYTE tmp;
  
  switch (SETUPDAT[1])
  {
     case VR_NAKALL_ON:
        tmp = FIFORESET;
        tmp |= bmNAKALL;      
        SYNCDELAY;                    
        FIFORESET = tmp;
        break;
     case VR_NAKALL_OFF:
        tmp = FIFORESET;
        tmp &= ~bmNAKALL;      
        SYNCDELAY;                    
        FIFORESET = tmp;
        break;
     default:
        return(TRUE);
  }

  return(FALSE);
}

//-----------------------------------------------------------------------------
// USB Interrupt Handlers
//   The following functions are called by the USB interrupt jump table.
//-----------------------------------------------------------------------------

// Setup Data Available Interrupt Handler
void ISR_Sudav(void) interrupt 0
{
   GotSUD = TRUE;            // Set flag
   EZUSB_IRQ_CLEAR();
   USBIRQ = bmSUDAV;         // Clear SUDAV IRQ
}

// Setup Token Interrupt Handler
void ISR_Sutok(void) interrupt 0
{
   EZUSB_IRQ_CLEAR();
   USBIRQ = bmSUTOK;         // Clear SUTOK IRQ
}

void ISR_Sof(void) interrupt 0
{
   EZUSB_IRQ_CLEAR();
   USBIRQ = bmSOF;            // Clear SOF IRQ
}

void ISR_Ures(void) interrupt 0
{
   // whenever we get a USB reset, we should revert to full speed mode
   pConfigDscr = pFullSpeedConfigDscr;
   ((CONFIGDSCR xdata *) pConfigDscr)->type = CONFIG_DSCR;
   pOtherConfigDscr = pHighSpeedConfigDscr;
   ((CONFIGDSCR xdata *) pOtherConfigDscr)->type = OTHERSPEED_DSCR;

   EZUSB_IRQ_CLEAR();
   USBIRQ = bmURES;         // Clear URES IRQ
}

void ISR_Susp(void) interrupt 0
{
   Sleep = TRUE;
   EZUSB_IRQ_CLEAR();
   USBIRQ = bmSUSP;
}

void ISR_Highspeed(void) interrupt 0
{
   if (EZUSB_HIGHSPEED())
   {
      pConfigDscr = pHighSpeedConfigDscr;
      ((CONFIGDSCR xdata *) pConfigDscr)->type = CONFIG_DSCR;
      pOtherConfigDscr = pFullSpeedConfigDscr;
      ((CONFIGDSCR xdata *) pOtherConfigDscr)->type = OTHERSPEED_DSCR;
   }

   EZUSB_IRQ_CLEAR();
   USBIRQ = bmHSGRANT;
}
void ISR_Ep0ack(void) interrupt 0
{
}
void ISR_Stub(void) interrupt 0
{
}
void ISR_Ep0in(void) interrupt 0
{
}
void ISR_Ep0out(void) interrupt 0
{
}
void ISR_Ep1in(void) interrupt 0
{
}
void ISR_Ep1out(void) interrupt 0
{
}
void ISR_Ep2inout(void) interrupt 0
{
}
void ISR_Ep4inout(void) interrupt 0
{
}
void ISR_Ep6inout(void) interrupt 0
{
}
void ISR_Ep8inout(void) interrupt 0
{
}
void ISR_Ibn(void) interrupt 0
{
}
void ISR_Ep0pingnak(void) interrupt 0
{
}
void ISR_Ep1pingnak(void) interrupt 0
{
}
void ISR_Ep2pingnak(void) interrupt 0
{
	EZUSB_IRQ_CLEAR();
    NAKIRQ = bmEP2PING;
}
void ISR_Ep4pingnak(void) interrupt 0
{
}
void ISR_Ep6pingnak(void) interrupt 0
{
}
void ISR_Ep8pingnak(void) interrupt 0
{
}
void ISR_Errorlimit(void) interrupt 0
{
}
void ISR_Ep2piderror(void) interrupt 0
{
}
void ISR_Ep4piderror(void) interrupt 0
{
}
void ISR_Ep6piderror(void) interrupt 0
{
}
void ISR_Ep8piderror(void) interrupt 0
{
}
void ISR_Ep2pflag(void) interrupt 0
{
}
void ISR_Ep4pflag(void) interrupt 0
{
}
void ISR_Ep6pflag(void) interrupt 0
{
}
void ISR_Ep8pflag(void) interrupt 0
{
}
void ISR_Ep2eflag(void) interrupt 0
{
}
void ISR_Ep4eflag(void) interrupt 0
{
}
void ISR_Ep6eflag(void) interrupt 0
{
}
void ISR_Ep8eflag(void) interrupt 0
{
}
void ISR_Ep2fflag(void) interrupt 0
{
}
void ISR_Ep4fflag(void) interrupt 0
{
}
void ISR_Ep6fflag(void) interrupt 0
{
}
void ISR_Ep8fflag(void) interrupt 0
{
}
void ISR_GpifComplete(void) interrupt 0
{
}
void ISR_GpifWaveform(void) interrupt 0
{
}
