/*******************************************************************************
 *
 * Copyright (c) Projet S6, Équipe P4
 *
 ******************************************************************************/

/*******************************************************************************
 * @file Addresses.h
 * @brief Definitions of commonly used addresses for the ADE9000.
 ******************************************************************************/
 
#pragma once

/* Measurements addresses */
#define ADDR_APF 0x216   /* Phase A Power Factor, updated every 1.024s. */
#define ADDR_AVTHD 0x217 /* Phase A voltage THD, updated every 1.024s. */

/* Control addresses */
#define ADDR_RUN 0x480      /* Write 1 to start the measurements, 0 to stop. */
#define ADDR_LAST_CMD 0x4AE /* Address of the last command. */
