#include "board.h"

void get_weight(Board * board)
{
    if(board != NULL) {
        
        get_load(board->C0);
        get_load(board->C1);
        get_load(board->C2);
        get_load(board->C3);



        board->totalWeight = (board->C0->load + board->C1->load + board->C2->load + board->C3->load) / 4.0f;
    }
}
void display_weight(Board * board)
{
    printf("\n--- Measurement  ---\n");
    printf("Total Weight: %8.3f kg\n", board->totalWeight);
    printf("------------------------\n");
    fflush(stdout);
}