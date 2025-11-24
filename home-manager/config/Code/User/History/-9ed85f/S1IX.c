#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#define TABLE_SIZE 128  // ASCII range


int lengthOfLongestSubstring(char* s) {

    int hashTable[TABLE_SIZE] = {0};
    printf("%d", hashTable);
    // for i in s:

    //     loop throuh
    //     put every entry in hash table, add to counter. 
    //     when failes get length 
    // for (int i = 0; i < TABLE_SIZE; i++) {
    //     hashTable[i] = -1;
    // }
    int count = 0;
    for (int i = 0; s[i] != '\0'; i++) {
        unsigned char c = s[i];  
        int a = hashTable[c];
        hashTable[c] = a+ 1; 
        if(hashTable[c] >0){
            printf("Second time seen exiting loop!\n\n");
            break;
        }
        count = count + 1;
        a = 0;
    }
return count;
}

int main() {
     char* s = "hello";
  
    int a = lengthOfLongestSubstring(s);
    printf("a = %d\n",a);
    return 0;
}