#include <stdio.h>
#include <stdlib.h>

  struct ListNode {
      int val;
      struct ListNode *next;
  };

struct ListNode* addTwoNumbers(struct ListNode* l1, struct ListNode* l2) {
    //while next != null
    //take v1 and add
    //if over 9 take remainder + carry
    struct ListNode a = malloc(sizeof(ListNode));
    while(l1->next != NULL && l2->next != NULL){

    }
}


int main() {
    int nums[] = {2, 7, 11, 15};
    int target = 9;
    int returnSize;
    
    int* result = twoSum(nums, 4, target, &returnSize);
    
    if(result[0] != -1) {
        printf("Indices: %d, %d\n", result[0], result[1]);
        printf("Values: %d, %d\n", nums[result[0]], nums[result[1]]);
    }
    
    free(result);
    return 0;
}