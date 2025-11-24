#include "loadcell.h"


void calibrate_cell(LoadCells * cell, float offset, float gain) //calibration
{
    if (cell != NULL) {
        cell->offsetV = offset;
        cell->gain = gain;
    }
}


void calibrate_cell_init(LoadCells * cell) //calibration
{
    if (cell != NULL) {
        cell->offsetV = DEFAULT_OFFSETV;
        cell->gain = DEFAULT_GAIN;
    }
}


void get_load(LoadCells * cell)
{
    if (cell != NULL) {
        uint16_t adcV = adc_register(cell->adc_channel);
        float voltageReading = adcV * (2.5f / 4095.0f);
        if( voltageReading < cell->offsetV)
        {
        cell->load  =-1.0f; //if we get a voltage below cal voltage error occured, 
        }
        cell->load = (voltageReading - cell->offsetV) / cell->gain;
    }
    return;
}

uint16_t adc_register(int adc_channel)//get voltage 
{
    return rand() % 4096;
}