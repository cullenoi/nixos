#include "loadcell.h"


void loadcell_init_custom(LoadCell *cell, float offset, float gain)
{
    if (cell != NULL) {
        cell->offsetV = offset;
        cell->gainVoltage = gain;
    }
}