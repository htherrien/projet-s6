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

void APP_TaskHandler(void)
{
	uint8_t receivedUART = UARTRead();
	if(receivedUART)		//est-ce qu'un caractere a été recu par l'UART?
	{
		write_Wireless(&receivedUART, 1);
	}
	if (hasReceivedWireless())
	{
		UARTWrite(*(getWirelessData()));
		resetReceivedWireless();
	}
}
int main(void)
{
	UARTInit();
	SYS_Init();
	for(;;)
	{
		PHY_TaskHandler();
		APP_TaskHandler();
	}
    return 1;
}

