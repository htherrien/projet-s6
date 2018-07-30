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

#include <avr/io.h>
#include <string.h>
#include "UART.h"
#include "wireless.h"
#include "menu.h"
#include "Frame.h"


#define MAX_COMMANDS_IN_PILE 20
#define ACK_TIMER TCNT1

static const int TIMEOUT_ACKNOWLEDGE = 8000000 / 1024 / 5;
struct ADE9000Data_t ADE9000Data;
uint8_t Commands[MAX_COMMANDS_IN_PILE];
uint8_t CommandIndexEnd = 0;
uint8_t CommandIndexStart = 0;
uint8_t WaitingForAck = 0;
uint8_t WaitingForData = 0;

extern uint8_t Realtime;

void setupSendDataTimer(void)
{
	TCCR1B |= ((1 << CS10) | (1 << CS12)); // Set up timer at Fcpu/1024
	ACK_TIMER = 0;                   // reset timer
}

void APP_TaskHandler(void)
{
	
	int sendPong = 0;
	
	//If we received something from UART, interact with menu
	uint8_t receivedUART = UARTRead();
	if(receivedUART)		//est-ce qu'un caractere a été recu par l'UART?
	{
		uint8_t command = updateMenuUART(receivedUART);
		//We verify if the menu interaction triggers a command that has to be sent to the ADE9000
		if (command)
		{
			if (Commands[CommandIndexEnd])
			{
				writeStrUART("\r\n\r\nCommand could not be sent, too many commands awaiting to be sent.");
			}
			else
			{
				Commands[CommandIndexEnd] = command;
				if(CommandIndexEnd++ >= MAX_COMMANDS_IN_PILE)
					CommandIndexEnd = 0;
			}
		}
	}
	
	if(hasReceivedWireless())
	{
		resetReceivedWireless();
		Packet rxPacket;
		if (storePacketIfValid(&rxPacket))
		{
			writeStrUART("\r\n\r\nPacket Received : RSSI = %i", getWirelessRSSI());
			PacketFlags flags = rxPacket.header.flags;
			switch(flags)
			{
				case ADE9000_DATA_PACKET:
					WaitingForData = 0;
					ADE9000Data = rxPacket.payload;
					updateMenuWireless();
					sendCommand(ACK_PACKET);
					if (Commands[CommandIndexStart] == COMMAND_REQUEST)
					{
						Commands[CommandIndexStart++] = 0;
					}
					break;
				case PING_PACKET:
					sendPong = 1;
				case ACK_PACKET:
					WaitingForAck = 0;
					if (Commands[CommandIndexStart] == COMMAND_TOGGLE_REALTIME)
					{
						Commands[CommandIndexStart++] = 0;
						Realtime = !Realtime;
					}
				default:
					break;
			}
		}
	}
	
	if ((!WaitingForAck && !WaitingForData) || (ACK_TIMER >= TIMEOUT_ACKNOWLEDGE && (WaitingForAck || WaitingForData)))
	{
		if (Commands[CommandIndexStart])
		{
			switch (Commands[CommandIndexStart])
			{
				case COMMAND_REQUEST:
					sendCommand(REQUEST_DATA_PACKET);
					WaitingForData = 1;
					ACK_TIMER = 0;
					break;
				case COMMAND_TOGGLE_REALTIME:
					sendCommand(TOGGLE_REALTIME_PACKET);
					WaitingForAck = 1;
					ACK_TIMER = 0;
					break;
				default: //Invalid command is ignored and skipped
					Commands[CommandIndexStart++] = 0;
					break;
			}
		}
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
	setupSendDataTimer();
	memset(Commands, 0, MAX_COMMANDS_IN_PILE);
	for(;;)
	{
		PHY_TaskHandler();
		APP_TaskHandler();
	}
    return 1;
}

