/* File: closest_pair.cpp
 * Description: A program to find the least distance between all pairs of 
 *              values in an array of 20 bytes. All values assumed to be 
 *              signed 8-bit integers. The array of integers starts at 
 *              location 128. Write the minimum distance in location 127.
 * Authors: Angela To, Frank Mezzatesta
 * Date: 1/18/15
 */

#include <iostream>
using namespace std;

int closest_pair(int arr[], int size) {
	int i, j, 
        int diff = 0;
	int min = abs(arr[0] - arr[1]);  // arbitrary assignment 

	for (i=0; i < size - 1; i++) {
		for (j = i + 1; j < size; j++) {
		    diff = abs(arr[i] - arr[j]);
		    // cout << arr[i] << " - " << arr[i] << " = " << diff << endl;
		    if (diff < min) min = diff;
		}
	}
	return min;
}


// Tester
int main() {
	int arr[5] = {10, -8, -4, 6, 5};
   	int size = sizeof(arr) / sizeof(arr[0]);

    	//cout << "closest pair: " << closest_pair(arr, size) << endl;
   	closest_pair(arr, size);

   	return 0;
}

