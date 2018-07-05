/*******************************************************************************
 *
 * Copyright (c) Projet S6, Équipe P4
 *
 ******************************************************************************/

#include "ADE9000/Addresses.h"

#include "SPI.h"

int main(void)
{
    SpiInitMaster();
    ADE9000Setup();
    for(;;)
    {
        uint32_t partId = ADE9000Read32(ADDR_PART_ID);
        uint16_t lastCommand = ADE9000Read16(ADDR_LAST_CMD);
    }
}
