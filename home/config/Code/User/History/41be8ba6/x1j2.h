#ifndef BOARD_H
#define BOARD_H
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include "loadcell.h"

#define DEFAULT_OFFSETV =  1060.90
// Board
    // Load Cells
    // DISPLAY



typedef struct{
    float totalWeight;
    LoadCells * C0, C1,C2,C3;
}Board;

void get_weight(Board * board);
void display_weight(Board * board);


#endif