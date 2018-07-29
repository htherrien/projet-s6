/*******************************************************************************
 *
 * Copyright (c) Projet S6, Équipe P4
 *
 ******************************************************************************/

#pragma once

#include <stdint.h>
#include <stdlib.h>
#include <stdbool.h>

typedef struct ADE9000Data_t
{
    float pf;   // power factor
    float thd;  // total harmonic distortion
    float vRms; // line A RMS voltage
    float iRms; // line A RMS current
} ADE9000Data_t;

typedef enum PacketFlags
{
    ADE9000_DATA_PACKET = 1,
    TOGGLE_REALTIME_PACKET,
    PING_PACKET,
    REQUEST_DATA_PACKET
} PacketFlags;

typedef struct Packet
{
    struct HeaderStruct
    {
        uint8_t h1 : 1; // 0xAD
        uint8_t h2 : 1; // 0xE9
        uint8_t h3 : 1; // 0x00
        PacketFlags flags : 1;// TODO fit enum into a byte
    } header;
    ADE9000Data_t payload;
    uint32_t crc32;
} Packet;

/**
 * Build a data packet from ADE9000 data
 * @param[out] packet the preallocated packet buffer where the packet will be
 * built.
 * @param[in] data the struct containing the ADE9000 measurements to be sent.
 * @return the size of the packet
 */
size_t buildDataPacket(Packet* packet, const ADE9000Data_t* data);

/**
 * Build a command packet.
 * @param[out] packet the preallocated packet buffer where the packet will be
 * built.
 * @param[in] flags the flags of the packet
 * @return the size of the packet, in bytes
 */
size_t buildCommandPacket(Packet* packet, const PacketFlags flags);

/**
 * Verifies that the packet is valid by checking its header and CRC
 * @param[in] packet the preallocated packet buffer to validate
 * @return true if the packet is valid, false otherwise
 */
bool isPacketValid(const Packet* packet);

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
uint32_t
crc32(uint8_t* data, size_t len, uint32_t poly, uint32_t initialValue);
