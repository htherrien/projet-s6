/*******************************************************************************
 *
 * Copyright (c) Projet S6, Équipe P4
 *
 ******************************************************************************/

/**
 * @file main.c
 * @brief Wireless power analyzer server's main loop. The goal of the server is
 * to bridge the gap between the wireless signal of the wireless power analyzer
 * and the computer.
 */

#include "UART.h"
#include "wireless.h"
#include "menu.h"
#include "Frame.h"

struct ADE9000Data_t ADE9000Data;

void APP_TaskHandler(void)
{
	uint8_t receivedUART = UARTRead();
	
	if(receivedUART)		//est-ce qu'un caractere a été recu par l'UART?
	{
		uint8_t command = updateMenuUART(receivedUART);
		if (command)
		{
			
		}
	}
	if (hasReceivedWireless())
	{
		uint8_t size = getWirelessSize();
		for (uint8_t i = 0; i < size; i++)
		{
			UARTWrite(getWirelessData()[i]);
		}
		
		resetReceivedWireless();
	}
}
int main(void)
{
	UARTInit();
	SYS_Init();
	showMenu();
	for(;;)
	{
		PHY_TaskHandler();
		APP_TaskHandler();
	}
    return 1;
}

