/*
 * If we list all the natural numbers below 10 that are multiples of 3 or 5, we
 * get 3, 5, 6 and 9. The sum of these multiples is 23.
 *
 * Find the sum of all the multiples of 3 or 5 below 1000.
 */
#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    __block NSUInteger sum = 0;
    @autoreleasepool {
        [[[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 1000)] indexesPassingTest:^BOOL (NSUInteger index, BOOL *stop){
            return (index % 3 == 0) || (index % 5 == 0);
        }] enumerateIndexesUsingBlock:^(NSUInteger index, BOOL *stop){
            sum += index;
        }];
    }
    NSLog(@"%lu", sum);
    return 0;
}
