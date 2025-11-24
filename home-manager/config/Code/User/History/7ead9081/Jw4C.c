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


void test_get_weight(void)
{

}
int main()
{
    CU_initialize_registry();
    CU_pSuite suite = CU_add_suite("LoadCellSuite", 0, 0);
    CU_add_test(suite, "test of adc_register()", test_adc_reg);
    CU_add_test(suite, "test of get_load()", test_get_load);
    CU_add_test(suite, "test of get_weigth()", test_get_weight);

    CU_basic_run_tests();
    CU_cleanup_registry();
    return 0;
}