#include <stdio.h>
#include <stdlib.h>
#include "board.h"

int main()
{
    Board board;
    calibrate_cell_init(board.C0);
    calibrate_cell_init(board.C1);
    calibrate_cell_init(board.C2);
    calibrate_cell_init(board.C3);


    while(1) // loop function of system
    {
    

    };

}


//PROCCESS
// SLEEP MODE
// Stepped on is awaked
// if awaken gather pressure data
// calculate average Force
// 