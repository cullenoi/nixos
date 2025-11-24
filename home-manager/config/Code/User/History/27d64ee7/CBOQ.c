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
    struct ListNode*  temp1 = l1;
    struct ListNode*  temp2 = l2;
    int add;
    int carry = 0;
    struct ListNode *sum = malloc(sizeof(struct ListNode));
    while(temp1->next != NULL && temp2->next != NULL){
      
        
        add = temp1->val + temp2->val;
        if (add >9){
            carry = 1;
            sum->val = add % 10; 
        }
        else
        sum->val = add; 
        sum->next =malloc(sizeof(struct ListNode));
        sum->next->next = NULL;
        sum = sum->next;
        // iterate to next node
        temp1 = temp1->next;
        temp2 = temp2->next;
    }


    return sum;
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