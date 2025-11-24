#include <CUnit/Basic.h>
#include <CUnit/CUnit.h>
#include "board.h"
#include "loadcell.h"





void test_adc_reg(void)
{
    CU_ASSERT(adc_register(0) == 3090);
    CU_ASSERT(adc_register(-1) == 0);
    // CU_ASSERT(add(-1, -1) == -2);
}

void test_get_load(void)
{
    LoadCells *A = NULL;
    LoadCells B = {
        .adc_channel = 1,
        .offsetV = 2.5f,
        .gain = 3.2f,
        .load = 0.0,
        .adcVal = 0
    };
    LoadCells C = {
        .adc_channel = 1,
        .offsetV = 0.5f,
        .gain = 0.02f,
        .load = 0.0,
        .adcVal = 0
    };

    get_load(A); //No load inserted
    get_load(&B);// Less then calibration data // bad channel (both will equal < calibration)
    get_load(&C);   // Expected Load for voltage
   
    CU_ASSERT_PTR_NULL(A);
    CU_ASSERT_EQUAL(B.load, -1.0f);
    CU_ASSERT_EQUAL(C.load, 69.322350f);


}


void test_display_weight(void)
{
    // LoadCells cell0 = {0, 1.8f, 2.5f, 0.0f, 2048};
    // LoadCells cell1 = {1, 1.8f, 2.5f, 0.0f, 2048};
    // LoadCells cell2 = {2, 1.8f, 2.5f, 0.0f, 2048};
    // LoadCells cell3 = {3, 1.8f, 2.5f, 0.0f, 2048};
    Board A = {
        .totalWeight = 79.00095f,
        .C0 = NULL,
        .C1 = NULL,
        .C2 = NULL,
        .C3 = NULL
    };
    Board B = {
        .totalWeight = -1.0f,
        .C0 = NULL,
        .C1 = NULL,
        .C2 = NULL,
        .C3 = NULL
    };Board A = {
        .totalWeight = 79.00095f,
        .C0 = NULL,
        .C1 = NULL,
        .C2 = NULL,
        .C3 = NULL
    };
    display_weight(&A);
    CU_PASS("No Errors during test executions\n");
}
int main()
{
    CU_initialize_registry();
    CU_pSuite suite = CU_add_suite("LoadCellSuite", 0, 0);
    CU_add_test(suite, "test of adc_register()", test_adc_reg);
    CU_add_test(suite, "test of get_load()", test_get_load);
    // CU_add_test(suite, "test of get_weigth()", test_get_weight);

    CU_pSuite suite2 = CU_add_suite("BoardSuite", 0, 0);
    CU_add_test(suite2, "test of display_weight()", test_display_weight);


    CU_basic_run_tests();
    CU_cleanup_registry();
    return 0;
}