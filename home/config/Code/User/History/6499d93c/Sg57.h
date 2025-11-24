#ifndef LOADCELL_H
#define LOADCELL_H
#include <stdint.h>
#define DEFAULT_OFFSETV  1060.90

typedef struct 
{
    int adc_channel;
    float offsetV = DEFAULT_OFFSETV;
    float gainVoltage;
    uint16_t adcVal;
}LoadCells; 

uint16_t adc_register(int adc_channel);//get voltage 


#endif