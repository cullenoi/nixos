#include "board.h"

void get_weight(Board * board)
{
    if(board != NULL) {
        
        // get_load(board->C0); ASSUME ISR calls this
        // get_load(board->C1); ASSUME ISR calls this
        // get_load(board->C2); ASSUME ISR calls this
        // get_load(board->C3); ASSUME ISR calls this
        if(board->C1 == NULL || board->C2 == NULL || board->C3 == NULL 
            || board->C0 == NULL)
        { //if any cell not init properlly return -1 weight error
            board->totalWeight = -1.0f;
            return;
        }
        if(board->C1->load == -1.0f || board->C2->load == -1.0f || board->C3->load == -1.0f 
        || board->C0->load == -1.0f) // if any cells had an error prop the total to error
        {
            board->totalWeight = -1.0f;
            return;
        }             
        //average out
        board->totalWeight = (board->C0->load + board->C1->load + board->C2->load + board->C3->load) / 4.0f;
        printf("Total Weight: %8.3f kg\n", board->totalWeight);

    }
}
void display_weight(Board * board)
{

    if(board == NULL || board->totalWeight == -1.0f)
    {
        printf("Error during Measurement please Retry\n");
    } 
    else{
    printf("\n--- Measurement  ---\n");
    printf("Total Weight: %8.3f kg\n", board->totalWeight);
    printf("------------------------\n");
    }
    fflush(stdout);
}

void init_board(Board * board){ 
    board->totalWeight = -1.0f; //set to undefined for error handling
    calibrate_cell_init(board->C0);
    calibrate_cell_init(board->C1);
    calibrate_cell_init(board->C2);
    calibrate_cell_init(board->C3);
}
