//
//  Fish.m
//  Fish
//
//  Created by Thanh Pham on 11/25/15.
//  Copyright © 2015 Thanh Pham. All rights reserved.
//

#import "Fish.h"
#import "FishSpecies.h"

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

#pragma mark - other methods

- (BOOL)isHungry {
    return self.leftAmount < self.species.hungryPoint;
}

- (BOOL)isDead {
    return self.leftAmount == 0;
}

@end
