/*******************************************************************************
 *
 * Copyright (c) Projet S6, Équipe P4
 *
 ******************************************************************************/

#pragma once

typedef struct ADE9000Data_t
{
    float pf;   // power factor
    float thd;  // total harmonic distortion
    float vRms; // line A RMS voltage
    float iRms; // line A RMS current
} ADE9000Data_t;






/**
 * Perform crc-32 on a buffer
 * @param[in] data the buffer on which crc will be performed
 * @param[in] len the length of the buffer
 * @param[in] poly the crc polynomial generator
 * @param[in] intialValue the initial value of the crc. This parameter is
 * used for performing crc on non-contiguous areas of memory (ie. structs)
 * by chaining calls to this function.
 * @return the crc-32 value
 */
uint32_t crc32(uint8_t* data, size_t len, uint32_t poly, uint32_t initialValue);
