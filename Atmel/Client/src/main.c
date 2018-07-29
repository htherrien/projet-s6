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

void APP_TaskHandler(void)
{
    static int sendDataRealtime = 0; // Send data to server flag
    int sendDataOnce = 0;
    int sendPong = 0;

	// Receive data
    {
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
                case REQUEST_DATA_PACKET:
                    sendDataOnce = 1;
                case PING_PACKET:
                    sendPong = 1;
                default:
                    break;
            }
            resetReceivedWireless();
        }
    }

	// Send data
    if(sendDataRealtime || sendDataOnce)
    {
        sendDataOnce = 0;
        ADE9000Data_t ade9000Data;
        ade9000Data.pf = getPF();
        ade9000Data.thd = getTHD();
        ade9000Data.vRms = getVrms();
        ade9000Data.iRms = getIrms();
        Packet txPacket;
        write_Wireless((uint8_t*)&txPacket,
                       buildDataPacket(&txPacket, &ade9000Data));
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
