/* File: string_match.cpp
 * Description: A program that finds the number of entries in an array which 
 *		contains a 4-bit string. For example, if the string is 0101, then 
 *		11010110  would count. The array starts at position 32 and is 64 bytes 
 *		long. The string you search for will be in the lower 4 bits of memory 
 *		address 6. The result should be written to location 7.
 * Date: 
 * 
 * "You will have a string of bits. You will be loading one byte at a time because that's 
 * your processor's limit, but the string's "characters" are the individual bits and that's 
 * what you have to compare against." Piazza@20
 */

#include <iostream>
using namespace std;

int string_match(string pattern, string bit_string) {
	int i = 0; 
        int j = 0; 
        int num_hits = 0;
        int bit_string_length = 0;
         
        // Get length of bit string
        while (bit_string[i] != '\0') {
            bit_string_length++;
            i++;
        }
        //cout << "bit_string_length: " << bit_string_length << endl;        

	while (j < (bit_string_length-3)) {
            if (pattern[0] == bit_string[j]   &&
                pattern[1] == bit_string[j+1] &&
                pattern[2] == bit_string[j+2] && 
                pattern[3] == bit_string[j+3]) { num_hits++; } 
            j++; 
	}

        //cout << "num_hits: " << num_hits << endl;
	return num_hits;
}

// Tester
int main() {
        string pattern = "1001";
        string bit_string = "1001111001";
        string_match(pattern, bit_string);
 	return  0;
 }
