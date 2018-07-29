/*******************************************************************************
 *
 * Copyright (c) Projet S6, Équipe P4
 *
 ******************************************************************************/

#include <assert.h>
#include <string.h>

#include "wireless.h"

#include "Frame.h"

static const uint32_t CRC_32_IEEE_POLY = 0x04C11DB7;
static const uint8_t FIRST_HEADER_BYTE = 0xAD;
static const uint8_t SECOND_HEADER_BYTE = 0xE9;
static const uint8_t THIRD_HEADER_BYTE = 0x00;

uint8_t buildDataPacket(Packet* packet, const ADE9000Data_t* data)
{
    // Clear packet data
    memset(packet, 0, sizeof(Packet));

    // Build header
    packet->header.h1 = FIRST_HEADER_BYTE;
    packet->header.h2 = SECOND_HEADER_BYTE;
    packet->header.h3 = THIRD_HEADER_BYTE;
    packet->header.flags = ADE9000_DATA_PACKET;

    // Fill payload
    packet->payload = *data;

    // Compute crc32 and store it in the packet
    packet->crc32 = crc32((uint8_t*)packet,
                          sizeof(Packet) - sizeof(uint32_t),
                          CRC_32_IEEE_POLY,
                          0);

    return sizeof(Packet);
}

uint8_t buildCommandPacket(Packet* packet, const uint8_t flags)
{
    // Clear packet data
    memset(packet, 0, sizeof(Packet));

    // Build header
    packet->header.h1 = FIRST_HEADER_BYTE;
    packet->header.h2 = SECOND_HEADER_BYTE;
    packet->header.h3 = THIRD_HEADER_BYTE;
    packet->header.flags = flags;

    // No data to store

    // Compute crc32 and store it in the packet
    packet->crc32 = crc32((uint8_t*)packet,
                          sizeof(Packet) - sizeof(uint32_t),
                          CRC_32_IEEE_POLY,
                          0);

    return sizeof(Packet);
}

bool isPacketValid(const Packet* packet)
{
    if(packet->header.h1 != FIRST_HEADER_BYTE ||
       packet->header.h1 != SECOND_HEADER_BYTE ||
       packet->header.h1 != THIRD_HEADER_BYTE)
    {
        return false;
    }

    if(crc32((uint8_t*)packet, sizeof(Packet), CRC_32_IEEE_POLY, 0) != 0)
    {
        return false;
    }

    return true;
}

bool storePacketIfValid(Packet* packet)
{
	// Precondition
	assert(hasReceivedWireless());
	
    uint8_t rawDataSize = getWirelessSize();
    if(rawDataSize != sizeof(Packet))
    {
        return 0;
    }
    uint8_t* rawData = getWirelessData();
    memcpy(packet, rawData, rawDataSize);

    return isPacketValid(packet);
}

uint32_t crc32(uint8_t* data, size_t len, uint32_t poly, uint32_t initialValue)
{
    uint32_t crc = initialValue;
    size_t dataIterator;

    for(dataIterator = 0; dataIterator < len; ++dataIterator)
    {
        crc ^= ((uint32_t)data[dataIterator] << 24);
        for(int i = 0; i < 8; ++i)
        {
            if(crc & 0x80000000) // Perform XOR if the highest bit is set
            {
                crc = (crc << 1) ^ poly;
            }
            else
            {
                crc <<= 1;
            }
        }
    }
    return crc;
}
