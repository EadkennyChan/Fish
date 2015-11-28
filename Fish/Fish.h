//
//  Fish.h
//  Fish
//
//  Created by Thanh Pham on 11/25/15.
//  Copyright © 2015 Thanh Pham. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FishSpecies;
@class Lake;

@interface Fish : NSObject

@property (nonatomic, readonly) FishSpecies *species;
@property (nonatomic, readonly) NSUInteger leftAmount; // Ci

@property (weak, nonatomic) Lake *lake;

- (instancetype)initWithSpecies:(FishSpecies *)species;
- (BOOL)isHungry;
- (BOOL)isDead;

@end
