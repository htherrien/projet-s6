/*
 * menu.c
 *
 * Created: 2018-07-29 1:55:18 PM
 *  Author: danae
 */ 

#include "menu.h"
#include "UART.h"
#include "Frame.h"

extern struct ADE9000Data_t ADE9000Data;

uint8_t MenuState = MENU_MAIN;
uint8_t Realtime = 0;
uint8_t Requested = 0;

void showMenu(void)
{
	clearDisplay();
	switch(MenuState)
	{
		case MENU_MAIN :
			writeStrUART("MAIN MENU\r\n");
			writeStrUART("%i : Toggle realtime transmission of measurements (%s)\r\n", COMMAND_TOGGLE_REALTIME, displayRealtimeStatus());
			writeStrUART("%i : Display measurements\r\n", MENU_VIEW_DATA);
			writeStrUART("%i : Request measurements\r\n", MENU_REQUEST_DATA);
			break;
		case MENU_VIEW_DATA:
			writeMeasurements(1,1,1,1);
			writeStrUART("PRESS %i TO RETURN TO MAIN MENU\r\n", MENU_MAIN);
			break;
		case MENU_REQUEST_DATA :
			writeStrUART("Possible data that can be requested from the ADE9000 :\r\n");
			writeStrUART("%i : All\r\n", REQUEST_ALL);
			writeStrUART("%i : THD\r\n", REQUEST_THD);
			writeStrUART("%i : PowerFactor\r\n", REQUEST_PF);
			writeStrUART("%i : I RMS\r\n", REQUEST_IRMS);
			writeStrUART("%i : V RMS\r\n", REQUEST_VRMS);
			switch (Requested)
			{
				case 0:
					break;
				case REQUEST_ALL : 
					writeMeasurements(1,1,1,1);
					break;
				case REQUEST_THD:
					writeMeasurements(1,0,0,0);
					break;
				case REQUEST_PF:
					writeMeasurements(0,1,0,0);
					break;
				case REQUEST_IRMS:
					writeMeasurements(0,0,1,0);
					break;
				case REQUEST_VRMS:
					writeMeasurements(0,0,0,1);
					break;
				default:
					break;
			}
			writeStrUART("PRESS %i TO RETURN TO MAIN MENU\r\n", MENU_MAIN);
			break;
		default:
		break;
	}
	
}

uint8_t updateMenuUART(uint8_t data)
{
	uint8_t command = 0;
	data -= '0';
	switch(MenuState)
	{
		case MENU_MAIN:
			switch (data)
			{
				case COMMAND_TOGGLE_REALTIME :
					command = COMMAND_TOGGLE_REALTIME;
					Realtime = !Realtime;
					showMenu();
					break;
				case MENU_VIEW_DATA : 
					MenuState = MENU_VIEW_DATA;
					showMenu();
					break;
				case MENU_REQUEST_DATA : 
					MenuState = MENU_REQUEST_DATA;
					showMenu();
					break;
				default:
					break;
			}
			break;
		case MENU_VIEW_DATA : 
			if (data == MENU_MAIN)
			{
				MenuState = MENU_MAIN;
				showMenu();
			}
			break;
		case MENU_REQUEST_DATA : 
			switch (data)
			{
				case REQUEST_ALL:
					Requested = REQUEST_ALL;
					command = COMMAND_REQUEST;
					break;
				case REQUEST_THD:
					Requested = REQUEST_THD;
					command = COMMAND_REQUEST;
					break;
				case REQUEST_PF:
					Requested = REQUEST_PF;
					command = COMMAND_REQUEST;
					break;
				case REQUEST_IRMS:
					Requested = REQUEST_IRMS;
					command = COMMAND_REQUEST;
					break;
				case REQUEST_VRMS:
					Requested = REQUEST_VRMS;
					command = COMMAND_REQUEST;
					break;
				case MENU_MAIN:
					MenuState = MENU_MAIN;
					showMenu();
					break;
				default:
					break;
			}
			
	}
	return command;
}

void writeMeasurements(uint8_t thd,uint8_t pf, uint8_t irms, uint8_t vrms)
{
	if(thd)		writeStrUART("THD          : %2.2f\r\n", ADE9000Data.thd);
	if(pf)		writeStrUART("Power Factor : %2.2f\r\n", ADE9000Data.pf);
	if(irms)	writeStrUART("I RMS        : %2.2f\r\n", ADE9000Data.iRms);
	if(vrms)	writeStrUART("V RMS        : %2.2f\r\n", ADE9000Data.vRms);
}

const uint8_t* displayRealtimeStatus(void)
{
	
	static const uint8_t* enabled = "Enabled";
	static const uint8_t* disabled = "Disabled";

	if (Realtime) return enabled;
	else return disabled;
}

void clearDisplay(void)
{
	UARTWrite(27); //Escape sequence start
	writeStrUART("[2J"); //CSI sequence clear display
	UARTWrite(27);
	writeStrUART("[H"); //CSI sequence return cursor to home
}

void updateMenuWireless(void)
{
	switch(MenuState)
	{
		case MENU_MAIN:
		break;
		
		case MENU_VIEW_DATA :
			showMenu();
		break;
		
		case MENU_REQUEST_DATA :
		if (Requested)
		{
			showMenu();
			Requested = 0;
		}
		break;
		
	}
}