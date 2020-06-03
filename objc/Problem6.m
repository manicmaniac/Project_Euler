/*
 * The sum of the squares of the first ten natural numbers is,
 * 
 * $$1^2 + 2^2 + ... + 10^2 = 385$$
 * 
 * The square of the sum of the first ten natural numbers is,
 * 
 * $$(1 + 2 + ... + 10)^2 = 55^2 = 3025$$
 * 
 * Hence the difference between the sum of the squares of the first ten natural
 * numbers and the square of the sum is $3025 - 385 = 2640$.
 * 
 * Find the difference between the sum of the squares of the first one hundred
 * natural numbers and the square of the sum.
 */

#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        __block NSInteger sumOfSquares = 0;
        __block NSInteger squareOfSum = 0;
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(1, 100)];
        [indexSet enumerateIndexesUsingBlock:^(NSUInteger index, BOOL *stop) {
            sumOfSquares += (NSInteger)(index * index);
            squareOfSum += (NSInteger)index;
        }];
        squareOfSum *= squareOfSum;
        NSInteger difference = squareOfSum - sumOfSquares;
        NSLog(@"%ld", difference);
    }
    return EXIT_SUCCESS;
}
