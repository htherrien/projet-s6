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
	
	int sendPong = 0;
	
	//If we received something from UART, interact with menu
	uint8_t receivedUART = UARTRead();
	if(receivedUART)		//est-ce qu'un caractere a été recu par l'UART?
	{
		uint8_t command = updateMenuUART(receivedUART);
		//We verify if the menu interaction triggers a command that has to be sent to the ADE9000
		switch (command)
		{
			case COMMAND_REQUEST:
				sendCommand(REQUEST_DATA_PACKET);
				break;
				
			case COMMAND_TOGGLE_REALTIME:
				sendCommand(TOGGLE_REALTIME_PACKET);
				break;
				
			default:
				break;
		}
	}
	
	
	Packet rxPacket;
	if(hasReceivedWireless() && storePacketIfValid(&rxPacket))
	{
		PacketFlags flags = rxPacket.header.flags;
		switch(flags)
		{
			case ADE9000_DATA_PACKET:
				ADE9000Data = rxPacket.payload;
				updateMenuWireless();
				break;
			case PING_PACKET:
				sendPong = 1;
			default:
				break;
		}
		resetReceivedWireless();
	}
	
	
	if(sendPong)
	{
		Packet txPacket;
		write_Wireless((uint8_t*)&txPacket,
						buildCommandPacket(&txPacket, PING_PACKET));
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

