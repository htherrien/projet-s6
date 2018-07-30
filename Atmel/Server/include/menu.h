/*
 * menu.h
 *
 * Created: 2018-07-29 1:55:30 PM
 *  Author: danae
 */ 

#pragma once

#include <stdint.h>


#define MENU_MAIN 0
#define MENU_REQUEST_DATA 3
#define MENU_VIEW_DATA 2

#define COMMAND_TOGGLE_REALTIME 1
#define COMMAND_REQUEST 3

#define REQUEST_ALL 1
#define REQUEST_THD 2
#define REQUEST_PF 3
#define REQUEST_IRMS 4
#define REQUEST_VRMS 5

void showMenu(void);
uint8_t updateMenuUART(uint8_t data);
const uint8_t* displayRealtimeStatus(void);
void writeMeasurements(uint8_t thd,uint8_t pf, uint8_t irms, uint8_t vrms);
void clearDisplay(void);
void updateMenuWireless(void);