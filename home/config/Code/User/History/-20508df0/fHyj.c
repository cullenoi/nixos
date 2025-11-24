#include "loadcell.h"


void calibrate_cell(LoadCells * cell, float offset, float gain) //calibration
{
    if (cell != NULL) {
        cell->offsetV = offset;
        cell->gain = gain;
    }
}