/*******************************************************************************
 *
 * Copyright (c) Projet S6, Équipe P4
 *
 ******************************************************************************/

/**
 * @file main.c
 * @brief Wireless power analyzer measuring station's board main loop.
 */

#include <string.h>

#include "SPI.h"
#include "ADE9000/Commands.h"

#include "wireless.h"
#include "Frame.h"

float i = 0.0;
void APP_TaskHandler(void);
void APP_TaskHandler(void)
{
    static int sendDataRealtime = 0; // Send data to server flag
    int sendDataOnce = 0;
    int sendPong = 0;


        Packet rxPacket;
        if(hasReceivedWireless() && storePacketIfValid(&rxPacket))
        {
            PacketFlags flags = rxPacket.header.flags;
            switch(flags)
            {
                case ADE9000_DATA_PACKET:
                    break;
                case TOGGLE_REALTIME_PACKET:
                    sendDataRealtime ^= 0x1;
					break;
                case REQUEST_DATA_PACKET:
                    sendDataOnce = 1;
					break;
                case PING_PACKET:
                    sendPong = 1;
					break;
                default:
                    break;
            }
            resetReceivedWireless();
        }

	// Send data
    if(sendDataRealtime || sendDataOnce)
    {
        sendDataOnce = 0;
        ADE9000Data_t ade9000Data;
        ade9000Data.pf = i;//getPF();
        ade9000Data.thd = 2*i;//getTHD();
        ade9000Data.vRms = 3*i;//getVrms();
        ade9000Data.iRms = 4*i;//getIrms();
		if(i++ > 10) i=0; //TODO : TO BE REMOVED WHEN ADE9000 CIRCUIT IS THERE
        Packet txPacket;
        write_Wireless((uint8_t*)&txPacket,
                       buildDataPacket(&txPacket, &ade9000Data));
    }

    if(sendPong)
    {
        Packet txPacket;
        write_Wireless((uint8_t*)&txPacket,
                       buildCommandPacket(&txPacket, PING_PACKET));
		sendPong = 0;
    }
}

int main(void)
{
    SpiInitMaster();
    ADE9000Setup();
    SYS_Init();

    for(;;)
    {
        PHY_TaskHandler();
        APP_TaskHandler();
    }

    return 1;
}
