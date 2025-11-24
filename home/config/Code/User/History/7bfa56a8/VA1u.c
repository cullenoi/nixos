int* twoSum(int* nums, int numsSize, int target, int* returnSize) {
    int found = 0;
    int a;
    int b;
    int posA = -1, posB = -1;
    malloc(sizeof(int)*2);
    for(int i = 0; i < numsSize; i++){
     a = &nums[i];
        for(int t = 0; t< numsSize; t++){
        
            if(i != t){//if I and T are not on the same index, change it
                b = &nums[t];
            }
            
            if(target == a+b){
            posA = i;
            posB = t;
            break;// if we find a match once leave
            }
        }
    }
    //check that the search found a match
}
