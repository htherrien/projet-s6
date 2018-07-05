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

/**
 * Configure the SPI bus as a SPI master
 * On the ATmega256RFR2 Xplained Pro devkit, the SPI is configured to be used
 * on the EXT5 header:
 *
 *     PIN15 ==> SS
 *     PIN16 ==> MOSI
 *     PIN17 ==> MISO
 *     PIN18 ==> SCK
 *     PIN19 ==> GND
 *
 * @note No pullups are needed
 */
void SpiInitMaster(void);
