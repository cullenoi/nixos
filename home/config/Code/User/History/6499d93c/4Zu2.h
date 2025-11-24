#ifndef LOADCELL_H
#define LOADCELL_H

#define DEFAULT_OFFSETV =  1060.90

typedef struct 
{
    float offsetV = DEFAULT_OFFSETV;
    float gainVoltage;
}LoadCells;


#endif