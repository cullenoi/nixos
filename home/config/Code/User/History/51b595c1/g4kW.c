#include <stdio.h>
#include <stdlib.h>
#include "board.h"

int main()
{
    Board board;
    init_board(&board);
    get_load(board.C0);

    while(1) // loop function of system
    {
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