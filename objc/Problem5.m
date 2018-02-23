#import <Foundation/Foundation.h>

static NSInteger gcd(NSInteger x, NSInteger y) {
    if (y > 0) {
        return gcd(y, x % y);
    } else {
        return x;
    }
}

static NSInteger lcm(NSInteger x, NSInteger y) {
    return x * y / gcd(x, y);
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        __block NSUInteger reduced = 1;
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(2, 21)];
        [indexSet enumerateIndexesUsingBlock:^(NSUInteger index, BOOL *stop){
            reduced = lcm(reduced, index);
        }];
        NSLog(@"%lu", reduced);
    }
    return 0;
}
