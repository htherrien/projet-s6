/*******************************************************************************
 *
 * Copyright (c) Projet S6, Équipe P4
 *
 ******************************************************************************/

/**
 * @file UART.c
 * @brief Implements the functions for using the UART of the ATmega256RFR2
 */

#include <avr/io.h>

#include "UART.h"

uint8_t UARTRead(void)
{
	uint8_t data = 0;

	if(UCSR1A & (0x01 << RXC1))
	{
		data = UDR1;
	}
	
	return data;
}


void UARTWrite(uint8_t data)
{
	UDR1 = data;
	while(!(UCSR1A & (0x01 << UDRE1)));
}


void UARTInit(void)
{
	//baud rate register = Fcpu / (16*baud rate - 1)
	//baud rate = 9600bps
	UBRR1H = 0x00;
	UBRR1L = 53;
	
	UCSR1A = 0x00;
	UCSR1B = 0x18; //receiver, transmitter enable, no parity
	UCSR1C = 0x06; //8-bits per character, 1 stop bit
}