#ifndef BOARD_H
#define BOARD_H


#define DEFAULT_OFFSETV =  1060.90
// Board
    // Load Cells



typedef struct{

}Board;

typedef struct 
{
    float offsetV = DEFAULT_OFFSETV;
    float gainVoltage;
}LoadCells;


#endif