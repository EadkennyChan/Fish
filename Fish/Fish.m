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

        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tick) name:ClockTickNotification object:nil];
    }
    return self;
}

#pragma mark - object life cycle methods

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:ClockTickNotification object:nil];
}

#pragma mark - "public" methods

- (BOOL)isHungry {
    return _leftAmount < _species.hungryPoint;
}

#pragma mark - "private" methods

- (void)bite {
    if ([self canBite]) {
        NSUInteger realBiteAmount = [_lake takeMaxAmount:_species.biteAmount];
        _leftAmount += realBiteAmount;
        _lastBiteTime = [Clock sharedClock].time;
    }
}

- (BOOL)canBite {
    return !_dead && [Clock sharedClock].time - _lastBiteTime >= _species.biteInterval;
}

- (void)digest {
    _leftAmount -= MIN(_leftAmount, self.species.digestionSpeed);

    if (_leftAmount == 0) {
        [self die];
    }
}

- (void)die {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:ClockTickNotification object:nil];

    _dead = YES;
}

#pragma mark - NSNotificationCenter related methods

- (void)tick {
    [self digest];
}

@end
