#ifndef LOADCELL_H
#define LOADCELL_H

#include <stdint.h>
#include <stddef.h>
#define DEFAULT_OFFSETV  1060
#define DEFAULT_GAIN 2200

typedef struct 
{
    int adc_channel;
    float offsetV;
    float gain;
    float pressure;
    uint16_t adcVal;
}LoadCells; 

uint16_t adc_register(int adc_channel);//get voltage 
void get_pressure(LoadCells * cell); // assuming load voltage will correlate to some mathematical scale similar to RTD sensors
void calibrate_cell(LoadCells * cell, float offset, float gain); //calibration
void calibrate_cell_init(LoadCells * cell); //calibration with DEFAULT values



#endif