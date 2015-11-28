//
//  Fish.m
//  Fish
//
//  Created by Thanh Pham on 11/25/15.
//  Copyright © 2015 Thanh Pham. All rights reserved.
//

#import "Fish.h"
#import "FishSpecies.h"
#import "Clock.h"
#import "Lake.h"

@interface Fish ()

@property (nonatomic) NSUInteger lastBiteTime;

@end

@implementation Fish

#pragma mark - initializers

- (instancetype)init {
    return [self initWithSpecies:[[FishSpecies alloc] init]];
}

// designated initializer
- (instancetype)initWithSpecies:(FishSpecies *)species {
    self = [super init];
    if (self) {
        _species = species;
        _leftAmount = _species.maxAmount; // assuming fish are born full (otherwise they will die immediately)
    }
    return self;
}

#pragma mark - "public" methods

- (BOOL)isHungry {
    return _leftAmount < _species.hungryPoint;
}

- (BOOL)isDead {
    return _leftAmount == 0;
}

#pragma mark - "private" methods

- (void)bite {
    if ([self canBite]) {
        NSUInteger realBiteAmount = [_lake takeMaxAmount:_species.biteAmount];
        _leftAmount += realBiteAmount;
        _lastBiteTime = self.clock.time;
    }
}

- (BOOL)canBite {
    return self.clock.time - _lastBiteTime >= _species.biteInterval;
}

@end
