int* twoSum(int* nums, int numsSize, int target, int* returnSize) {
    int a;
    int b;
    int posA, posB;
    malloc(sizeof(int)*2);
    for(int i = 0; i < numsSize; i++){
     a = &nums[i];
        for(int t = 0; t< numsSize; t++){
        
            if(i != t){//if I and T are not on the same index, change it
                b = &nums[t];
            }
            
            if(target == a+b){
            
            }
        }
    }
}
