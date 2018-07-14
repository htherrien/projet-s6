/*******************************************************************************
 *
 * Copyright (c) Projet S6, Équipe P4
 *
 ******************************************************************************/

/**
 * @file Fuses.c
 * @brief Contains the fuses configurations for the ATmega256RFR2.
 * The default fuse configurations are used, saved for:
 * Low fuse: 
 *     * CKDIV8 un-programmed. System clock is not divided by 8.
 * High fuse:
 * Extended fuse:  
 */

#include <avr/io.h>
#include <avr/fuse.h>

FUSES = {
    
    .low = (FUSE_CKSEL_SUT0 & FUSE_CKSEL_SUT2 & FUSE_CKSEL_SUT3 &
            FUSE_CKSEL_SUT4), 
    .high = HFUSE_DEFAULT,
    .extended = EFUSE_DEFAULT,
};
