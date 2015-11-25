//
//  FishAlewife.m
//  Fish
//
//  Created by Thanh Pham on 11/25/15.
//  Copyright © 2015 Thanh Pham. All rights reserved.
//

#import "FishAlewife.h"

@implementation FishAlewife

- (instancetype)init {
    return [super initWithMaxAmount:100 hungryPoint:10 biteAmount:2 biteInterval:2 digestionSpeed:20];
}

- (instancetype)initWithMaxAmount:(NSUInteger)maxAmount hungryPoint:(NSUInteger)hungryPoint biteAmount:(NSUInteger)biteAmount biteInterval:(NSUInteger)biteInterval digestionSpeed:(NSUInteger)digestionSpeed {
    return [self init]; // revent altering the properties of the fish species
}

@end
