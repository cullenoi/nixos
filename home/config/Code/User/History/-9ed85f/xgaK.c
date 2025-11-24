#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#define TABLE_SIZE 128  // ASCII range


int lengthOfLongestSubstring(char* s) {
    int hashTable[TABLE_SIZE];
    for (int i = 0; i < TABLE_SIZE; i++) hashTable[i] = -1;

    int maxLen = 0;
    int start = 0;

    for (int i = 0; s[i] != '\0'; i++) {
        unsigned char c = s[i];

        if (hashTable[c] >= start) {
            start = hashTable[c] + 1;
        }

        hashTable[c] = i;

        int windowLen = i - start + 1;
        if (windowLen > maxLen) {
            maxLen = windowLen;
        }
    }

    return maxLen;
}

int main() {
     char* s = "dvdf";
  
    int a = lengthOfLongestSubstring(s);
    printf("a = %d\n",a);
    return 0;
}