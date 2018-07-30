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

#include "avr/io.h"

#include "SPI.h"
#include "ADE9000/Commands.h"

#include "wireless.h"
#include "Frame.h"

#define SEND_DATA_TIMER TCNT1
const static uint16_t SEND_DATA_TIMER_1SEC = 8000000 / 1024; // F_CPU/Prescaler
#define ACK_TIMER TCNT3
const static uint16_t SEND_DATA_TIMER_200MSEC = 8000000 / 1024 / 5;

float i = 0.0;
void APP_TaskHandler(void);
void setupSendDataTimer(void);

void setupSendDataTimer(void)
{
    TCCR1B |= ((1 << CS10) | (1 << CS12)); // Set up timer at Fcpu/1024
    SEND_DATA_TIMER = 0;                   // reset timer
}

void APP_TaskHandler(void)
{
    static int sendDataRealtime = 0; // Send data to server flag
    int sendDataOnce = 0;
    int sendPong = 0;

    if(hasReceivedWireless())
    {
        Packet rxPacket;
        resetReceivedWireless();
        if(storePacketIfValid(&rxPacket))
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
        }
    }

    // Send data in real time every second or if requested
    if((sendDataRealtime && SEND_DATA_TIMER >= SEND_DATA_TIMER_1SEC) ||
       sendDataOnce)
    {
        SEND_DATA_TIMER = 0; // reset timer
        ADE9000Data_t ade9000Data;
        ade9000Data.pf = i;       // getPF();
        ade9000Data.thd = 2 * i;  // getTHD();
        ade9000Data.vRms = 3 * i; // getVrms();
        ade9000Data.iRms = 4 * i; // getIrms();
        if(i++ > 10)
            i = 0; // TODO : TO BE REMOVED WHEN ADE9000 CIRCUIT IS THERE
        Packet txPacket;
        write_Wireless((uint8_t*)&txPacket,
                       buildDataPacket(&txPacket, &ade9000Data));
    }

    if(sendPong)
    {
        sendPong = 0;
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
    setupSendDataTimer();

    for(;;)
    {
        PHY_TaskHandler();
        APP_TaskHandler();
    }

    return 1;
}
