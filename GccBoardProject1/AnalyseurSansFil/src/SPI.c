/*******************************************************************************
 *
 * Copyright (c) Projet S6, Équipe P4
 *
 ******************************************************************************/

/**
 * @file SPI.c
 * @brief Implements the functions for using the SPI bus on the ATmega256RFR2
 */

#include <avr/io.h>

#include "SPI.h"

void SpiInitMaster(void)
{
    // Ports directions
    DDRB |= _BV(2);  // Set MOSI as output
    DDRB |= _BV(1);  // Set SCK as output
    DDRB &= ~_BV(3); // Set MISO as input
    DDRD |= _BV(6);  // Set SS as output

    // SPI control register
    SPCR = 0x00;             // Disable and reset SPI
    SPCR |= _BV(4);          // Put SPI in master mode
    SPCR |= _BV(3) | _BV(2); // CPOL = 1, CPHA = 1
    SPCR |= _BV(0);          // SCK = Fosc/16
}
