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
    while(l1 != NULL || l2 != NULL || carry != 0){
        *current = malloc(sizeof(struct ListNode));
        
        int add = carry;
        if (l1 != NULL) {
            add += l1->val;
            l1 = l1->next;
        }
        if (l2 != NULL) {
            add += l2->val;
            l2 = l2->next;
        }
        printf("l1 = %d\n",l1->val);
        printf("l2 = %d\n",l2->val);
        printf("ADD = %d\n",add);
        carry = add / 10;
        (*current)->val = add % 10;
        (*current)->next = NULL;



        // iterate to next node
        current = &((*current)->next);
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