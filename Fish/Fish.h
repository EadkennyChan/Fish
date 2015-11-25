//
//  Fish.h
//  Fish
//
//  Created by Thanh Pham on 11/25/15.
//  Copyright © 2015 Thanh Pham. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fish : NSObject

@property (nonatomic, readonly) NSUInteger maxAmount; // C
@property (nonatomic, readonly) NSUInteger hungryPoint; // Cm
@property (nonatomic, readonly) NSUInteger biteAmount; // i
@property (nonatomic, readonly) NSUInteger biteInterval; // S
@property (nonatomic, readonly) NSUInteger digestionSpeed; // T
@property (nonatomic, readonly) NSUInteger leftAmount; // Ci

- (instancetype)initWithMaxAmount:(NSUInteger)maxAmount hungryPoint:(NSUInteger)hungryPoint biteAmount:(NSUInteger)biteAmount biteInterval:(NSUInteger)biteInterval digestionSpeed:(NSUInteger)digestionSpeed;

@end
