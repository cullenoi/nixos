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

    int add;
    int carry = 0;
    struct ListNode *head = NULL;
    struct ListNode** current = &head; 
    while(l1 != NULL && l2 != NULL){
        *current = malloc(sizeof(struct ListNode));

        add = l1->val + l2->val;
        if (add >9){
            carry = 1;
            (*current)->val = add % 10; 
        }
        else
        (*current)->val = add; 
        (*current)->next = NULL;
        current = &((*current)->next);
        // iterate to next node
        l1 = l1->next;
        l2 = l2->next;
    }


    return head;
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