#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
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
    return 0;
}
