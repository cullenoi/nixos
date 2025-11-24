#include "board.h"

void get_weight(Board * board)
{
    if(board != NULL) {
        
        get_load(board->C0);


        board->totalWeight = (board->C0.load) + board->C0.load + board->C0.load + board->C0.load) / 4;

    }
}
void display_weight(Board * board)
{
    printf("\n--- Measurement  ---\n");
    printf("Total Weight: %8.3f kg\n", board->totalWeight);
    printf("------------------------\n");
    fflush(stdout);
}