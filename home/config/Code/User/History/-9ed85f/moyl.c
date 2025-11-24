#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#define TABLE_SIZE 128  // ASCII range


int lengthOfLongestSubstring(char* s) {

    int hashTable[TABLE_SIZE];
    // for i in s:

    //     loop throuh
    //     put every entry in hash table, add to counter. 
    //     when failes get length 
    for (int i = 0; i < TABLE_SIZE; i++) {
        hashTable[i] = -1;
    }

    for (int i = 0; s[i] != '\0'; i++) {
        unsigned char c = s[i];  // Get ASCII value
        hashTable[c] = 1;          // Mark character as present
    }

}