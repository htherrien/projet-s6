/*******************************************************************************
 *
 * Copyright (c) Projet S6, Équipe P4
 *
 ******************************************************************************/



uint32_t crc32(uint8_t* data, size_t len, uint32_t poly, uint32_t initialValue)
{
	uint32_t crc = initialValue;
	size_t dataIterator;

	for(dataIterator = 0; dataIterator < len; ++dataIterator)
	{
		uint32_t a = (data[dataIterator] << 24);
		crc ^= (data[dataIterator] << 24);
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