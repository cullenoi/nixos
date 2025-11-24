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