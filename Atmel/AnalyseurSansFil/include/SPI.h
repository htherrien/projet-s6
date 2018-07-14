/*******************************************************************************
 *
 * Copyright (c) Projet S6, Équipe P4
 *
 ******************************************************************************/

/**
 * @file SPI.h
 * @brief Defines the functions for using the SPI bus on the ATmega256RFR2
 */

#pragma once

#include <stdint.h>

/**
 * Configures the SPI bus as a SPI master in mode 3
 * On the ATmega256RFR2 Xplained Pro devkit, the SPI is configured to be used
 * on the EXT5 header:
 *
 *     EXT5         SPI slave
 *     +-----+      +----+
 *     |PIN15|------|SS  |
 *     |PIN16|------|MOSI|
 *     |PIN17|------|MISO|
 *     |PIN18|------|SCK |
 *     |PIN19|------|GND |
 *     +-----+      +----+ 
 *
 * @note No pull-ups are needed
 */
void SpiInitMaster(void);

/**
 * Pulls high the SS, then enables the SPI peripheral
 */
void SpiBeginTransfer(void);

/**
 * Disables the the SPI peripheral, then pulls SS low
 */
void SpiEndTransfer(void);

/**
 * Writes a byte to the SPI peripheral
 * @param[in] byte the byte to be written
 * @warning This function is blocking, since it waits
 *          for the transfer to finish
 */
void SpiWriteByte(uint8_t byte);

/**
 * Reads a byte to the SPI peripheral
 * @return the byte from the SPI
 */
uint8_t SpiReadByte(void);
