#include <stdio.h>
#include <stdlib.h>

int* twoSum(int* nums, int numsSize, int target, int* returnSize) {
    int found = 0;
    int a;
    int b;
    int posA = -1, posB = -1;
    int* ptr = (int*)malloc(2* sizeof(int));
    for(int i = 0; i < numsSize && found != 1; i++){
     a = nums[i];
        for(int t = 0; t< numsSize  && found != 1; t++){
            b = nums[t];

            if(i == t){//if I and T are not on the same index, change it
            continue;
            }

            if(target == a+b){
            posA = i;
            posB = t;
            found = 1;
            // break;// if we find a match once leave
            }
        }
    }
    //check that the search found a match
    if(posA == -1 && posB == -1){
        printf("ERROR PAIR Not found\n\n");
    }
    printf("I = %d. T = %d\n", posA, posB);

    ptr[0] = posA;
    ptr[1] = posB;
    return ptr;
}



