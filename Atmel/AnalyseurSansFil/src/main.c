/*******************************************************************************
 *
 * Copyright (c) Projet S6, Équipe P4
 *
 ******************************************************************************/

#include <stdio.h>

#include "ADE9000/Addresses.h"
#include "ADE9000/Commands.h"

#include "SPI.h"

// Measurement magic numbers
static const float CONV_PF_THD = 0.000000007450580597f; // 2^-27
static const float FULL_SCALE_RMS = 52702092.0f; // ADE9000 factor for RMS values
static const float V_NOMINAL = 120.0f; // Denormalizing factor 1V to 120V
static const float V_CORR = 1.188f;  // Normalizing factor when on the 10uF cap
static const float I_NOMINAL = 5.0f; // Denormalizing factor 1A to 5A
static const float I_CORR = 1.1f;    // Normalizing factor when on the 10uF cap

int main(void)
{
    SpiInitMaster();
    ADE9000Setup();
    float thd, pf, v, i;
    for(;;)
    {
        thd = (float)ADE9000Read32(ADDR_AVTHD) * CONV_PF_THD * 100.0f;
        pf = (float)ADE9000Read32(ADDR_APF) * CONV_PF_THD;
        v = (float)ADE9000Read32(ADDR_AVRMS) / FULL_SCALE_RMS * V_NOMINAL * V_CORR;
        i = (float)ADE9000Read32(ADDR_AIRMS) / FULL_SCALE_RMS * I_NOMINAL * I_CORR;
    }
}
