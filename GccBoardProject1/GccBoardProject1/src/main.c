/*******************************************************************************
 *
 * Copyright (c) Projet S6, Équipe P4
 *
 ******************************************************************************/

#include <avr/io.h>
#include <avr/fuse.h>

#include <stdbool.h>

#define SPI_MASTER	0
#define SPI_SLAVE	1
#define P0 1
#define P1 2
#define P2 4
#define P3 8
#define P4 16
#define P5 32
#define P6 64
#define P7 128

void port_init(void);
void spi_init(bool);

int main (void)
{
	/* Insert system clock initialization code here (sysclk_init()). */
	// The XTAL on the dev board is 16MHZ
	//CKDIV8 = 1; // See Page 506, when =1 the clock is not devided by 8. See how code it (in the config state)
	
	
	//board_init();

	/* Insert application code here, after the board has been initialized. */
}

void port_init() {
	// Initialization of all port as an input
	
	DDRA = 0x00;
	DDRB = 0x00;
	DDRC = 0x00;
	DDRD = 0x00;
	DDRE = 0x00;
	DDRF = 0x00;
	DDRG = 0x00;
	
	// Configuring all ports as active high logic
	PORTA = 0x00;
	PORTB = 0x00;
	PORTC = 0x00;
	PORTD = 0x00;
	PORTE = 0x00;
	PORTF = 0x00;
	PORTG = 0x00;		
	
}

void spi_init(bool TYPE) {
	/*
	PB0 Slave select (ATmega256RFR2 is Master)
	PB1 SPI SCK (Clock Out)
	PB2 SPI MOSI (Master Out, Slave in)
	PB3 SPI MISO (Master In, Slave Out)
	*/
	
	// SPI is not enabled here, must create a function do allow turning it on and off
	
	
	if (TYPE == SPI_SLAVE)
	{
		// -- Port config -- 
		DDRB &= 0xF0;			//Reseting previous config on PB0-PB3
		DDRB |= P3;				//Configuring as output
		
		// -- Control register config --
		SPCR = 0x00;
		SPCR |= P3|P2|P0;		//SPI mode 3 is selected (CPHA et CPOL = 1) //Clock configured as Fosc/16 in case it's the XTAL frequency, must be confirmed
		

	}
	else //MASTER == true
	{
		// -- Port config -- 
		DDRB &= 0xF0;			//Reseting previous config on PB0-PB3
		DDRB |= P2|P1|P0;		//Configuring as output
		PORTB |= P0;			//Configuring as active-low			//Seems not to be required, to be invistigated		}
		
		// -- Control register config --
		SPCR = 0x00;
		SPCR |= P4|P3|P2|P0;		//Clock configured as Fosc/16 in case it's the XTAL frequency, must be confirmed
		
	
	}
	
}