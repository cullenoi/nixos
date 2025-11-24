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
        }else
        cell->load = (voltageReading - cell->offsetV) / cell->gain;
        printf("Load = %f KG", cell->load);
    }
    return;
}

uint16_t adc_register(int adc_channel)//get voltage 
{
    // return rand() % 4096;
    if (adc_channel == 0) return 3090;
    if (adc_channel == 1) return 3090;
    if (adc_channel == 2) return 3090;
    if (adc_channel == 3) return 3090;
    else return 0;
}