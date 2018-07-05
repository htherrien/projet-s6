/*******************************************************************************
 *
 * Copyright (c) Projet S6, Équipe P4
 *
 ******************************************************************************/

/**
 * @file Commands.c
 * @brief Implements ADE9000/Commands.h for the ATmega256RFR2.
 */

#include <stdint.h>
#include <assert.h>

#include <avr/io.h>

#include "SPI.h"

#include "ADE9000/Addresses.h"
#include "ADE9000/Commands.h"

// 16-bit type punning union
typedef uint8_t TwoBytesArray_t[2];
typedef union {
    uint16_t uint16;
    TwoBytesArray_t uint8_ptr;
} TwoBytes_t;

// 32-bit type punning union
typedef uint8_t FourBytesArray_t[4];
typedef union {
    uint32_t uint32;
    FourBytesArray_t uint8_ptr;
} FourBytes_t;

static const uint16_t ENABLE_DSP = 0x0001;

void ADE9000Write(uint16_t address, size_t n, const uint8_t* data)
{
    // Precondition
    assert(address <= 0xFFF);

    // Send address MSB first
    uint8_t address_high = (address >> 4);
    uint8_t address_low = (address << 4) & 0xF7; // Reset the address read bit

    SpiBeginTransfer();

    SpiWriteByte(address_high);
    SpiWriteByte(address_low);

    // Write MSB first
    while(n--)
    {
        SpiWriteByte(data[n]);
    }

    SpiEndTransfer();
}

void ADE9000Write16(uint16_t address, uint16_t data)
{
    TwoBytes_t buffer = {.uint16 = data};
    ADE9000Write(address, 2, buffer.uint8_ptr);
}

void ADE9000Write32(uint16_t address, uint32_t data)
{
    FourBytes_t buffer = {.uint32 = data};
    ADE9000Write(address, 4, buffer.uint8_ptr);
}

void ADE9000Read(uint16_t address, size_t n, uint8_t* data)
{
    // Precondition
    assert(address <= 0xFFF);

    // Send address MSB first
    uint8_t address_high = (address >> 4);
    uint8_t address_low = ((address << 4) | 0x08); // Set the address read bit

    SpiBeginTransfer();

    SpiWriteByte(address_high);
    SpiWriteByte(address_low);

    // Read MSB first
    while(n--)
    {
        SpiWriteByte(0x00); // dummy write
        data[n] = SpiReadByte();
    }

    SpiEndTransfer();
}

uint16_t ADE9000Read16(uint16_t address)
{
    TwoBytes_t buffer;
    ADE9000Read(address, 2, buffer.uint8_ptr);
    return buffer.uint16;
}

uint32_t ADE9000Read32(uint16_t address)
{
    FourBytes_t buffer;
    ADE9000Read(address, 4, buffer.uint8_ptr);
    return buffer.uint32;
}

void ADE9000Setup(void)
{
    // Enable measurements
    ADE9000Write16(ADDR_RUN, ENABLE_DSP);
}
