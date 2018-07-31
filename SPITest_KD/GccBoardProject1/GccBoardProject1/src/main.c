/*
 * Include header files for all drivers that have been imported from
 * Atmel Software Framework (ASF).
 */
/*
 * Support and FAQ: visit <a href="http://www.atmel.com/design-support/">Atmel Support</a>
 */

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
#define SS P0
#define F_CPU 8.0E6

#include <asf.h>
#include <spi_megarf.h>
#include <util/delay.h>
#include <avr/io.h>
#include <avr/cpufunc.h>


void port_init(void);
void spi_init(bool);
void spi_enableK(void);
void spi_disableK(void);
void spi_putK(uint8_t data);
uint8_t spi_getK(void);
void ecriture_registre(short nb_bytes,unsigned short cmd_hdr,unsigned long val);
unsigned long lecture_registre(short nb_bytes,unsigned short cmd_hdr);




int main (void)
{
	
	/* Insert system clock initialization code here (sysclk_init()). */
	// The XTAL on the dev board is 16MHZ
	port_init();
	board_init();
	spi_init(SPI_MASTER);
	spi_enableK();
	
	while(1)
	{
	ecriture_registre(2,0x4800,0x0000);
	ecriture_registre(4,0x4800,0x00021211);
	}

	
}

void port_init()
{
	// Initialization of all port as an input
	
	DDRA = 0x00;
	DDRB = 0x00;
	DDRC = 0x00;
	DDRD = 0x00;
	DDRE = 0x00;
	DDRF = 0x00;
	DDRG = 0x00;
	
	// Configuring all ports to 0
	PORTA = 0x00;
	PORTB = 0x00;
	PORTC = 0x00;
	PORTD = 0x00;
	PORTE = 0x00;
	PORTF = 0x00;
	PORTG = 0x00;		
	
}

void spi_init(bool TYPE)
{
	/*
	PD6 Slave select (ATmega256RFR2 is Master)
	PB1 SPI SCK (Clock Out)
	PB2 SPI MOSI (Master Out, Slave in)
	PB3 SPI MISO (Master In, Slave Out)
	*/
	
	// SPI is not enabled here, must create a function do allow turning it on and off
	
	
	if (TYPE == SPI_SLAVE)
	{
		// -- Port config -- 
		DDRD &= ~P6;			//Setting PD6 as an input;
		DDRB &= 0xF0;			//Reseting previous config on PB0-PB3
		DDRB |= P3;				//Configuring as output
		
		// -- Control register config --
		SPCR = 0x00;
		SPCR |= P3|P2|P0;		//SPI mode 3 is selected (CPHA et CPOL = 1) //Clock configured as Fosc/16
		SPSR |= P0;				//Double the clock frequency to bring it to Fosc/8

	}
	else //MASTER == true
	{
		// -- Port config -- 
		DDRB &= 0xF0;			//Reseting previous config on PB0-PB3
		DDRB |= P2|P1;			//Configuring as output
		DDRD |= P6;				//Configuring as output
	}
		
		// -- Control register config --
		SPCR = 0x00;
		SPCR |= P4|P3|P2|P0;	//Clock configured as Fosc/16 in case it's the XTAL frequency, must be confirmed
		SPSR |= P0;				//Double the clock frequency to bring it to Fosc/8
}

void spi_enableK(void)
{
	int dummy_read = 0;
	
	PORTD |= P6;	//SS set to high
	SPCR |= P6;
	dummy_read = SPSR;
	dummy_read = SPDR;	
}

void spi_disableK(void)
{
	SPCR &= ~P6;
	PORTD &= ~P6;	//SS set to high
}
	
// -- Copié du Arduino --

void ecriture_registre(short nb_bytes,unsigned short cmd_hdr,unsigned long val)
{
	// cmd_hdr: 16bits non signé incluant le bit3=0 pour le write
	//val: 32 bits où les 16 msb sont des don't care si nb_bytes
	uint8_t msb=cmd_hdr>>8;
	uint8_t lsb=(cmd_hdr<<8)>>8;
	
	uint8_t byte1=0;
	uint8_t byte2=0;
	uint8_t byte3=0;
	uint8_t byte4=0;

	if (nb_bytes==2)
	{
		byte1=val>>8;//isole les bytes et supprime les don't care qui seraient non-nul
		byte2=(val<<8)>>8;
	}
	else
	{
		byte1=val>>24;//isole les bytes et supprime les don't care qui seraient non-nul
		byte2=(val<<8)>>24;
		byte3=(val<<16)>>24;
		byte4=(val<<24)>>24;
	}
	PORTD &= ~P6;	//SS set to low
	
	spi_putK(msb);  //le command header
	// Wait for transmission complete 
	while(!(SPSR & (1<<SPIF)));
	spi_putK(lsb);
	// Wait for transmission complete 
	while(!(SPSR & (1<<SPIF)));
	spi_putK(byte1);  //la valeur à écrire
	// Wait for transmission complete 
	while(!(SPSR & (1<<SPIF)));
	spi_putK(byte2);
	// Wait for transmission complete 
	while(!(SPSR & (1<<SPIF)));
	if (nb_bytes==4)
	{
		spi_putK(byte3);
		// Wait for transmission complete 
		while(!(SPSR & (1<<SPIF)));
		spi_putK(byte4);
		// Wait for transmission complete 
		while(!(SPSR & (1<<SPIF)));
	}
	PORTD |= P6;	//SS set to high
}

unsigned long lecture_registre(short nb_bytes,unsigned short cmd_hdr)  //faire quelque chose de similaire pour notre application
{
	// cmd_hdr: 16bits non signé incluant le bit3=1 pour le read
	
	unsigned long result=0;
	uint8_t newbyte=0;
	uint8_t msb=cmd_hdr>>8;
	uint8_t lsb=(cmd_hdr<<8)>>8;
	
	PORTD &= ~P6;	//SS set to low
	spi_putK(msb);
	// Wait for transmission complete 
	while(!(SPSR & (1<<SPIF)));
	spi_putK(lsb);
	// Wait for transmission complete 
	while(!(SPSR & (1<<SPIF)));
	
	result= spi_getK();				//Valider si il faut envoyer une trame bidon
	nb_bytes--;

	while (nb_bytes>0)
	{
		result = result<<8;			//decale tout d'un uint8_t
		newbyte = spi_getK();		//Valider si il faut envoyer une trame bidon
		result=result | newbyte;	//combine le vieux stock avec le newbyte
		nb_bytes--;
	}
	PORTB |= P6;	//SS set to high
	return result;
}
	
void spi_putK(uint8_t data)
{
	SPDR = data;
}

uint8_t spi_getK(void)
{
	return SPDR;
}

