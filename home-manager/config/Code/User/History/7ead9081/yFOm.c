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

int main()
{
    CU_initialize_registry();
    CU_pSuite suite = CU_add_suite("AdcTestSuite", 0, 0);
    CU_add_test(suite, "test of adc_register()", test_adc_reg);
    CU_basic_run_tests();
    CU_cleanup_registry();
    return 0;
}