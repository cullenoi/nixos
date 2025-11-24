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

    if(board == NULL || board->totalWeight == -1.0f)
    {
        printf("Error during Measurement please Retry\n");
    } 
    else
    printf("\n--- Measurement  ---\n");
    printf("Total Weight: %8.3f kg\n", board->totalWeight);
    printf("------------------------\n");
    fflush(stdout);
}

void init_board(Board * board){ 
    board->totalWeight = -1.0f; //set to undefined for error handling
    calibrate_cell_init(board->C0);
    calibrate_cell_init(board->C1);
    calibrate_cell_init(board->C2);
    calibrate_cell_init(board->C3);
}
