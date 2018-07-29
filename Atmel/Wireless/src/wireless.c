/*******************************************************************************
 *
 * Copyright (c) Projet S6, Équipe P4
 *
 ******************************************************************************/

#include "wireless.h"

/*- Includes ---------------------------------------------------------------*/
#include "sys.h"
#include "phy.h"

/*- Definitions ------------------------------------------------------------*/
// Put your preprocessor definitions here

/*- Types ------------------------------------------------------------------*/
// Put your type definitions here

/*- Prototypes -------------------------------------------------------------*/
// Put your function prototypes here
void SYS_Init(void);

/*- Variables --------------------------------------------------------------*/
// Put your variables here
uint8_t receivedWireless;	//cette variable deviendra 1 lorsqu'un nouveau paquet aura été recu via wireless (et copié dans "PHY_DataInd_t ind"
							//il faut la mettre a 0 apres avoir géré le paquet; tout message recu via wireless pendant que cette variable est a 1 sera jeté

PHY_DataInd_t ind; //cet objet contiendra les informations concernant le dernier paquet qui vient de rentrer





//FONCTION D'INITIALISATION
/*************************************************************************//**
*****************************************************************************/
void SYS_Init(void)
{
receivedWireless = 0;
wdt_disable(); 
PHY_Init(); //initialise le wireless
PHY_SetRxState(1); //TRX_CMD_RX_ON
}

uint8_t hasReceivedWireless(void)
{
	return receivedWireless;
}
void resetReceivedWireless(void)
{
	receivedWireless = 0;
}

uint8_t* getWirelessData()
{
	return ind.data;
}
uint8_t getWirelessSize()
{
	return ind.size;
}
uint8_t getWirelessLQI()
{
	return ind.lqi;
}
uint8_t getWirelessRSSI()
{
	return ind.rssi;
}

void write_Wireless(uint8_t *data, uint8_t size)
{
	return _write_Wireless(data, size);
}

void PHY_TaskHandler(void)
{
	_PHY_TaskHandler();
}


