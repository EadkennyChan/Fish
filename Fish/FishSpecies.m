//
//  FishSpecies.m
//  Fish
//
//  Created by Thanh Pham on 11/25/15.
//  Copyright © 2015 Thanh Pham. All rights reserved.
//

#import "FishSpecies.h"

@implementation FishSpecies

#pragma mark - initializers

// overriding to make -initWithName:maxAmount:biteAmount:hungryPoint:biteInterval:digestionSpeed: the designated initializer
- (instancetype)init {
    return [self initWithName:nil maxAmount:2 biteAmount:1 hungryPoint:1 biteInterval:1 digestionSpeed:1]; // default unspecified species
}


// designated initializer
- (instancetype)initWithName:(NSString *)name maxAmount:(NSUInteger)maxAmount biteAmount:(NSUInteger)biteAmount hungryPoint:(NSUInteger)hungryPoint biteInterval:(NSUInteger)biteInterval digestionSpeed:(NSUInteger)digestionSpeed {
    self = [super init];
    if (self) {
        _name = name;
        _maxAmount = maxAmount;
        _biteInterval = biteAmount;
        _hungryPoint = hungryPoint; // for simplification, the program does not check for the condition 0 < hungryPoint < maxAmount
        _biteInterval = biteInterval; // can biteInterval be 0?
        _digestionSpeed = digestionSpeed;
    }
    return self;
}

@end
