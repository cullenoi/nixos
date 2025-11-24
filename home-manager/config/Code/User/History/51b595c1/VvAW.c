#include <stdio.h>
#include <stdlib.h>
#include "board.h"
#include <unistd.h>  
int main()
{
    LoadCells C0 = {0, 0.5f, 0.02f, 20.0f, 2048};
    LoadCells C1 = {1, 0.5f, 0.02f, 20.0f, 2048};
    LoadCells C2 = {2, 0.5f, 0.02f, 20.0f, 2048};
    LoadCells C3 = {3, 0.5f, 0.02f, 20.0f, 2048};
    Board board;

    Board B = {
        .totalWeight = 0.0f,
        .C0 = &C0,
        .C1 = &C1,
        .C2 = &C2,
        .C3 = &C3
    };

    while(1) // loop function of system
    {
    get_loads(&board);
    get_weight(&board);
    delay(300);
    display_weight(&board);
    };

}


//PROCCESS
// SLEEP MODE
// Stepped on is awaked
// if awaken gather pressure data
// calculate average Force
// 