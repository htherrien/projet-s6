/*******************************************************************************
 *
 * Copyright (c) Projet S6, Équipe P4
 *
 ******************************************************************************/

/**
 * @file Commands.h
 * @brief Interface for reading, writing and initializing the ADE9000.
 */

#pragma once

#include <stdint.h>

/**
 * Send data to the specified ADE9000 address using SPI.
 * Consider using ADE9000Write[16|32] instead.
 * @param[in] address the address, in 0xFFF (12-bit) format, where the data
 *            will be written.
 * @param[in] n the number of bytes to write. Either 2 or 4 bytes.
 *            Verify the number using the datasheet.
 * @param[in] data the data that will be written. Points to the LSB so that on
 *            big endian machines this can be done:
 *
 *                uint16_t buffer = 0x1234;
 *                uint8_t* data = (uint8_t*) &buffer;
 *
 *            Data sent to the ADE9000 will be sent MSB first.
 *
 *            memory layout example (32-bit) :
 *
 *                +---+---+---+---+
 *                | 0 | 1 | 2 | 3 |
 *                +---+---+---+---+
 *                  ^           ^
 *                  |           |
 *                 data        MSB
 *
 */
void ADE9000Write(uint16_t address, size_t n, const uint8_t* data);

/**
 * Send 16 bits of data to the specified ADE9000 address using SPI.
 * @param[in] address the address, in 0xFFF (12-bit) format, where the data
 *            will be written.
 * @param[in] data the 16 bits of data that will be written MSB first.
 */
void ADE9000Write16(uint16_t address, uint16_t data);

/**
 * Send 32 bits of data to the specified ADE9000 address using SPI.
 * @param[in] address the address, in 0xFFF (12-bit) format, where the data
 *            will be written.
 * @param[in] data the 32 bits of data that will be written MSB first.
 */
void ADE9000Write32(uint16_t address, uint32_t data);

/**
 * Read data from the specified ADE9000 address using SPI.
 * Consider using ADE9000Read[16|32] instead.
 * @param[in]  address the address, in 0xFFF (12-bit) format, from which the
 *             data will be read.
 * @param[in]  n the number of bytes to read, either 2 or 4 bytes.
 *             Verify the number using the datasheet.
 * @param[out] data the buffer where the result of the read will be stored.
 *             Points to the LSB.
 *
 *             memory layout example (16-bit) :
 *
 *                 +---+---+
 *                 | 0 | 1 |
 *                 +---+---+
 *                   ^   ^
 *                   |   |
 *                 data MSB
 */
void ADE9000Read(uint16_t address, size_t n, uint8_t* data);

/**
 * Read 16 bits of data from the specified ADE9000 address using SPI.
 * @param[in] address the address, in 0xFFF (12-bit) format, from which the
 *            data will be read.
 * @return    the 16 bits read from the ADE9000
 */
uint16_t ADE9000Read16(uint16_t address);

/**
 * Read 32 bits of data from the specified ADE9000 address using SPI.
 * @param[in] address the address, in 0xFFF (12-bit) format, from which the
 *            data will be read.
 * @return    the 32 bits read from the ADE9000 
 */
uint32_t ADE9000Read32(uint16_t address);

/**
 * Configures the ADE9000 chip for reading data
 */
void ADE9000Setup(void);
