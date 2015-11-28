//
//  Lake.m
//  Fish
//
//  Created by Thanh Pham on 11/26/15.
//  Copyright © 2015 Thanh Pham. All rights reserved.
//

#import "Lake.h"

@implementation Lake

- (void)addAmount:(NSUInteger)amount {
    _foodCount += amount;
}

- (NSUInteger)takeMaxAmount:(NSUInteger)maxAmount {
    NSUInteger amount = MIN(_foodCount, maxAmount);
    _foodCount -= amount;
    return amount;
}

@end
