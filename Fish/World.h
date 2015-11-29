//
//  World.h
//  Fish
//
//  Created by Thanh Pham on 11/26/15.
//  Copyright © 2015 Thanh Pham. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Farmer;
@class Robot;
@class Lake;
@class FoodPackage;

@interface World : NSObject

@property (nonatomic, readonly) Farmer *farmer;
@property (nonatomic, readonly) Robot *robot;
@property (nonatomic, readonly) Lake *lake;
@property (nonatomic, readonly) FoodPackage *foodPackage;

@end
