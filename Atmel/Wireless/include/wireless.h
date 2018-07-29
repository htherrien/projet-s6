/*******************************************************************************
 *
 * Copyright (c) Projet S6, Équipe P4
 *
 ******************************************************************************/

#pragma once

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