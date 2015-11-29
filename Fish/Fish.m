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

static NSString *const FishFoodNotification = @"FishFoodNotification";

@interface Fish ()

@property (nonatomic) BOOL hasBitten;
@property (nonatomic) NSUInteger lastBiteTime;
@property (nonatomic) NSUInteger listening;
@property (nonatomic) NSUInteger lastDigestTime;

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
        _foodAware = NO;
        _listening = YES;
        _hasBitten = NO;

        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tick) name:ClockTickNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(heard) name:FishFoodNotification object:nil];
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

#pragma mark - setters and getters

- (void)setFoodAware:(BOOL)foodAware {
    if (_foodAware == foodAware) return;
    _foodAware = foodAware;

    [self setListening:!_foodAware]; // only listen when not knowing about food

    if (_foodAware) {
        [self processEating];
    }
}

- (void)setListening:(NSUInteger)listening {
    _listening = listening;

    [[NSNotificationCenter defaultCenter] removeObserver:self name:FishFoodNotification object:nil]; // always remove first to avoid duplicated observer.

    if (_listening) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(heard) name:FishFoodNotification object:nil];
    }
}

#pragma mark - "private" methods

- (void)bite {
    if ([self canBite]) {
        NSUInteger maxBiteAmount = MIN(_species.maxAmount - _leftAmount, _species.biteAmount);
        NSUInteger realBiteAmount = [_lake takeMaxAmount:maxBiteAmount];
        if (realBiteAmount > 0) {
            _leftAmount += realBiteAmount;
            _hasBitten = YES;
            _lastBiteTime = [Clock sharedClock].time;
        }
    }
}

- (BOOL)canBite {
    return !_dead && (!_hasBitten || [Clock sharedClock].time - _lastBiteTime >= _species.biteInterval);
}

- (void)digest {
    NSUInteger currentTime = [Clock sharedClock].time;
    if (_leftAmount > 0 && currentTime - _lastDigestTime >= _species.digestionSpeed) {
        _leftAmount--;
        _lastDigestTime = currentTime;

        if (_leftAmount == 0) {
            [self die];
        }
    }
}

- (void)die {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:ClockTickNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:FishFoodNotification object:nil];

    _dead = YES;
}

- (void)notify {
    [[NSNotificationCenter defaultCenter] postNotificationName:FishFoodNotification object:self];
}

- (void)heard {
    self.foodAware = YES;
}

- (void)processEating {
    if ([self canBite]) {
        [self bite];
    }
    if (_lake.foodCount > 0 && ![self isHungry]) {
        [self notify];
    }
}

#pragma mark - NSNotificationCenter related methods

- (void)tick {
    [self digest];
    if (_foodAware) {
        [self processEating];
    }
}

@end
