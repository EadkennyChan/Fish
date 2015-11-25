//
//  FishSpecies.h
//  Fish
//
//  Created by Thanh Pham on 11/25/15.
//  Copyright © 2015 Thanh Pham. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FishSpecies : NSObject

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSUInteger maxAmount; // C
@property (nonatomic, readonly) NSUInteger biteAmount; // i
@property (nonatomic, readonly) NSUInteger hungryPoint; // Cm
@property (nonatomic, readonly) NSUInteger biteInterval; // S
@property (nonatomic, readonly) NSUInteger digestionSpeed; // T

- (instancetype)initWithName:(NSString *)name maxAmount:(NSUInteger)maxAmount biteAmount:(NSUInteger)biteAmount hungryPoint:(NSUInteger)hungryPoint biteInterval:(NSUInteger)biteInterval digestionSpeed:(NSUInteger)digestionSpeed;

@end
