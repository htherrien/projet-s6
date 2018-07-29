/*******************************************************************************
 *
 * Copyright (c) Projet S6, Équipe P4
 *
 ******************************************************************************/

/**
 * @file UART.h
 * @brief Defines the functions for using the UART of the ATmega256RFR2
 */

#pragma once

#include <stdint.h>

/**
 * Read a byte from the UART bus.
 * @return the current byte on the UART bus
 * @warning This function is blocking, since it waits
 *          for data to be available
 */
uint8_t UARTRead(void);

/**
 * Send a byte on the UART bus.
 * @param[in] the byte to be sent on the bus
 */
void UARTWrite(uint8_t);

/**
 * Enable and configure the UART bus for communication at 9600 bps.
 */
void UARTInit(void);
