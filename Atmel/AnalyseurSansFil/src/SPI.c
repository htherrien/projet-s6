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

#include <assert.h>

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
    SPCR |= _BV(3) | _BV(2); // CPOL = 1, CPHA = 1 (mode 3)
    SPCR |= _BV(0);          // SCK = Fosc/16
}

void SpiBeginTransfer(void)
{
    PORTD |= _BV(6); // Set SS to high
    SPCR |= _BV(6);  // Enable SPI peripheral
}

void SpiEndTransfer(void)
{
    SPCR &= ~_BV(6);  // Disable SPI peripheral
    PORTD &= ~_BV(6); // Set SS to low
}

void SpiWriteByte(uint8_t byte)
{
    SPDR = byte;
    while(!(SPSR & (1 << SPIF)))
    {
        ; // Wait for transfer to complete
    }
}

inline uint8_t SpiReadByte(void)
{
    assert(SPSR & (1 << SPIF)); // Make sure there is data to be read
    return SPDR;
}
