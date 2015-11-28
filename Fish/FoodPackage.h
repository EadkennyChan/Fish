//
//  FoodPackage.h
//  Fish
//
//  Created by Thanh Pham on 11/26/15.
//  Copyright © 2015 Thanh Pham. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FoodPackage : NSObject

@property (nonatomic, readonly) NSUInteger maxAmount; // M
@property (nonatomic, readonly) NSUInteger fullRefillInterval; // N
@property (nonatomic, readonly) NSUInteger minAmountUsable;
@property (nonatomic, readonly) NSUInteger amount;

- (instancetype)initWithMaxAmount:(NSUInteger)maxAmount fullRefillInterval:(NSUInteger)fullRefillInterval minAmountUsable:(NSUInteger)minAmountUsable;

- (BOOL)isReady;
- (NSUInteger)use;

@end
