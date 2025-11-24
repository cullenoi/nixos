#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#define TABLE_SIZE 128  // ASCII range


int lengthOfLongestSubstring(char* s) {

    int hashTable[TABLE_SIZE] = {0};

    int count = 0 , highest = 0, position = 0;
    
    for (int i = 0; s[i] != '\0'; i++) {
        unsigned char c = s[i];  
        int a = hashTable[c];
        
        printf("DId it reset? %d\n", a);
        if(hashTable[c] >0){
            printf("Second time seen exiting loop!\n\n");
            if (count > highest){
                highest = count;
            }
            memset(hashTable, 0, sizeof(hashTable));
            count =0;
            position = position + 1;
            i = position;
            // continue;
        }
        
        hashTable[c] =  1; 
        count = count + 1;
        printf("count %d\n", count);// a = 0;
    }
    if (count > highest) {
        highest = count;
    }
    
    return highest;
}

int main() {
     char* s = "aab";
  
    int a = lengthOfLongestSubstring(s);
    printf("a = %d\n",a);
    return 0;
}