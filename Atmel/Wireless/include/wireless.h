/*
 * wireless.h
 *
 * Created: 2018-07-29 11:22:54 AM
 *  Author: danae
 */ 


#ifndef WIRELESS_H_
#define WIRELESS_H_

#include <stdint.h>

void SYS_Init(void);
uint8_t hasReceivedWireless(void);
void resetReceivedWireless(void);
uint8_t* getWirelessData(void);
uint8_t getWirelessSize(void);
uint8_t getWirelessLQI(void);
uint8_t getWirelessRSSI(void);
void write_Wireless(uint8_t *data, uint8_t size);
void PHY_TaskHandler(void);




#endif /* WIRELESS_H_ */