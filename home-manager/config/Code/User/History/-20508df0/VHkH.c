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


void get_pressure(LoadCells * cell)
{
    if (cell != NULL) {
        uint16_t adcV = adc_register(cell->adc_channel);
        //Then subract / add by voltage and gain 
        
    }
    return;
}

uint16_t adc_register(int adc_channel)//get voltage 
{
    return rand() % 4096;
}