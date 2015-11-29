//
//  World.m
//  Fish
//
//  Created by Thanh Pham on 11/26/15.
//  Copyright © 2015 Thanh Pham. All rights reserved.
//

#import "World.h"
#import "Farmer.h"
#import "Robot.h"
#import "Lake.h"
#import "FoodPackage.h"

@implementation World

- (instancetype)init {
    self = [super init];
    if (self) {
        _lake = [[Lake alloc] init];
        _foodPackage = [[FoodPackage alloc] initWithMaxAmount:500 fullRefillInterval:25 minAmountUsable:200];

        _farmer = [[Farmer alloc] init];
        _farmer.lake = _lake;
        _farmer.foodPackage = _foodPackage;

        _robot = [[Robot alloc] init];
        _robot.lake = _lake;
        _robot.foodPackage = _foodPackage;
    }
    return self;
}

@end
