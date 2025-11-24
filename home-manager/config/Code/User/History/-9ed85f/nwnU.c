#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#define TABLE_SIZE 128  // ASCII range


int lengthOfLongestSubstring(char* s) {

    int hashTable[TABLE_SIZE] = {0};
    printf("%d", hashTable);

    int count = 0 , highest = 0, position = 0;
    
    for (int i = 0; s[i] != '\0'; i++) {
        unsigned char c = s[i];  
        int a = hashTable[c];
        
        if(hashTable[c] >0){
            printf("Second time seen exiting loop!\n\n");
            if (count > highest){
                highest = count;
            }
            memset(hashTable, 0, sizeof(hashTable));
            count =0;
            i--;
            continue;
        }
        
        hashTable[c] = a+ 1; 
        count = count + 1;
        a = 0;
    }
    if (count > highest) {
        highest = count;
    }
    
    return highest;}

int main() {
     char* s = "pwwkew";
  
    int a = lengthOfLongestSubstring(s);
    printf("a = %d\n",a);
    return 0;
}