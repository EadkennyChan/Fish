//
//  FoodPackage.m
//  Fish
//
//  Created by Thanh Pham on 11/26/15.
//  Copyright © 2015 Thanh Pham. All rights reserved.
//

#import "FoodPackage.h"
#import "Clock.h"

@implementation FoodPackage

#pragma mark - initializers

- (instancetype)init {
    return [self initWithMaxAmount:0 fullRefillInterval:0 minAmountUsable:0];
}

// designated initializer
- (instancetype)initWithMaxAmount:(NSUInteger)maxAmount fullRefillInterval:(NSUInteger)fullRefillInterval minAmountUsable:(NSUInteger)minAmountUsable {
    self = [super init];
    if (self) {
        _maxAmount = maxAmount;
        _fullRefillInterval = fullRefillInterval;
        _minAmountUsable = minAmountUsable;

        _amount = maxAmount; // assuming the package is initially full

        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tick) name:ClockTickNotification object:nil];
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:ClockTickNotification object:nil];
}

#pragma mark - "public" methods

- (BOOL)isReady {
    return _amount >= _minAmountUsable;
}

- (NSUInteger)use {
    if ([self isReady]) {
        NSUInteger amount = _amount;
        _amount = 0;
        return amount;
    } else {
        return 0;
    }
}

#pragma mark - NSNotificationCenter related methods

- (void)tick {
    _amount += MIN(_maxAmount - _amount, _maxAmount / _fullRefillInterval); // ignore fraction
}

@end
