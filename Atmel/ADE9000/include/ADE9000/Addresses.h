/*******************************************************************************
 *
 * Copyright (c) Projet S6, Équipe P4
 *
 ******************************************************************************/

/**
 * @file Addresses.h
 * @brief Definitions of commonly used addresses for the ADE9000.
 */

#pragma once

/* Measurements addresses */

/** Phase A Power Factor, updated every 1.024s. */
#define ADDR_APF 0x216
/** Phase A voltage THD, updated every 1.024s. */
#define ADDR_AVTHD 0x217
/** Phase A RMS current, updated every 0.125ms. */
#define ADDR_AIRMS 0x20C
/** Phase A RMS voltage, updated every 0.125ms. */
#define ADDR_AVRMS 0x20D

/* Control addresses */

/** Reference voltage level register */
#define ADDR_VLEVEL 0x40F
/** Reading the 20th bit of this address should yield 1. */
#define ADDR_PART_ID 0x472
/** Write 1 to this address to start the measurements, 0 to stop. */
#define ADDR_RUN 0x480
/** Accumulation mode register. Configures the frequency. */
#define ADDR_ACCMODE 0x492
/** This register sets the phase used as the reference period and the phase
 * used as zero-crossing reference. 
 */
#define ADDR_ZX_LP_SEL 0x49A
/** Reading this address will yield the address of the last command. */
#define ADDR_LAST_CMD 0x4AE
/** Energy and power accumulation configuration register. */
#define ADDR_EP_CFG 0x4B0
