//
//  Fish.m
//  Fish
//
//  Created by Thanh Pham on 11/25/15.
//  Copyright © 2015 Thanh Pham. All rights reserved.
//

#import "Fish.h"

@implementation Fish

// overriding to make -initWithMaxAmount:biteAmount:biteInterval:digestionSpeed: the designated initializer
- (instancetype)init {
    return [self initWithMaxAmount:2 hungryPoint:1 biteAmount:1 biteInterval:1 digestionSpeed:1]; // default general fish individual
}

- (instancetype)initWithMaxAmount:(NSUInteger)maxAmount hungryPoint:(NSUInteger)hungryPoint biteAmount:(NSUInteger)biteAmount biteInterval:(NSUInteger)biteInterval digestionSpeed:(NSUInteger)digestionSpeed {
    self = [super init];
    if (self) {
        _maxAmount = maxAmount;
        _hungryPoint = hungryPoint; // for simplification, the program does not check for the condition 0 < hungryPoint < maxAmount
        _biteAmount = biteAmount;
        _biteInterval = biteInterval; // can biteInterval be 0?
        _digestionSpeed = digestionSpeed;

        _leftAmount = _maxAmount; // assuming fish are born full (otherwise they will die immediately)
    }
    return nil;
}

@end
