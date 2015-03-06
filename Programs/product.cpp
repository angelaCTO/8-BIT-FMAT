/* File: product.cpp
 * Description: A program that finds the product of three unsigned number A*B*C. 
 * 		The operands are found in memory locations 1(A), 2(B), and 3(C). 
 *		The results will be written into locations 4(high bits) and 5(low bits).
 *		If overflow, need only store lower 16 bits.
 * Authors: Angela To, Frank Mezzatesta
 * Date: 1/18/15
 */

#include <iostream>
using namespace std;

int product (int a, int b, int c) {
    int i, j, m; 
    int product = 0;
    
    // A*B
    for (i = 0; i < a; i++) {
        product += b;
    }
    
    m = product;
    product = 0;

    // (A*B)*C
    for (j = 0; j < m; j++) {
        product += c;
    }

    return product;
}


// Tester
int main()
{
   cout << product(2, 3, 10) << endl;
   return 0;
}



