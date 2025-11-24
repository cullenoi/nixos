#ifndef LOADCELL_H
#define LOADCELL_H
#include <stdint.h>
#define DEFAULT_OFFSETV  1060.90f
#define DEFAULT_GAIN 2200.0f

typedef struct 
{
    int adc_channel;
    float offsetV;
    float gain;
    uint16_t adcVal;
}LoadCells; 

uint16_t adc_register(int adc_channel);//get voltage 

void calibrate_cell(LoadCells * cell, float offset, float gain); //calibration



#endif