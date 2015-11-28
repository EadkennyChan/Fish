//
//  World.m
//  Fish
//
//  Created by Thanh Pham on 11/26/15.
//  Copyright © 2015 Thanh Pham. All rights reserved.
//

#import "World.h"
#import "Clock.h"
#import "Farmer.h"
#import "Lake.h"
#import "FoodPackage.h"

@implementation World

- (instancetype)init {
    self = [super init];
    if (self) {
        _clock = [[Clock alloc] init];
        _feeder = [[Farmer alloc] init];
        _lake = [[Lake alloc] init];
        _foodPackage = [[FoodPackage alloc] init];
    }
    return self;
}

@end
