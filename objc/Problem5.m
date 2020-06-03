/*
 * 2520 is the smallest number that can be divided by each of the numbers from 1
 * to 10 without any remainder.
 *
 * What is the smallest positive number that is evenly divisible by all of the
 * numbers from 1 to 20?
 */

#import <Foundation/Foundation.h>

static NSInteger gcd(NSInteger x, NSInteger y) {
    if (!y) {
        return x;
    }
    return gcd(y, x % y);
}

static NSInteger lcm(NSInteger x, NSInteger y) {
    return x * y / gcd(x, y);
}

int main(void) {
    @autoreleasepool {
        __block NSUInteger reduced = 1;
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(2, 21)];
        [indexSet enumerateIndexesUsingBlock:^(NSUInteger index, BOOL *stop){
            reduced = lcm(reduced, index);
        }];
        NSLog(@"%lu", reduced);
    }
    return EXIT_SUCCESS;
}
