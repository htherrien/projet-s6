/*******************************************************************************
 *
 * Copyright (c) Projet S6, Équipe P4
 *
 ******************************************************************************/

#include <avr/io.h>

#include "Timers.h"

void setupWirelessTimers(void)
{
    TCCR1B |= (1 << WGM12); // Configure timer 1 for CTC mode
    OCR1A = 8000; // Set CTC compare channel A value to 1Hz at 8MHz AVR clock
                  // with a prescaler of 1024 for send data
    OCR1B = 2000; // Set CTC compare channel B value to 5Hz at 8MHz AVR clock
                  // with a prescaler of 1024 for ACK 

    TCCR1B |= ((1 << CS10) | (1 << CS12)); // Set up timer 1 prescaler at 1024
}

void resetWirelessTimers(void)
{
    TIFR1 |= (1 << OCF1A) | (1 << OCF1B);
}

bool checkSendDataTimer(void)
{
    return TIFR1 & (1 << OCF1A);
}

bool checkAckTimer(void)
{
    return TIFR1 & (1 << OCF1B);
}

