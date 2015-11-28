//
//  Lake.h
//  Fish
//
//  Created by Thanh Pham on 11/26/15.
//  Copyright © 2015 Thanh Pham. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FishSpecies;
@class Fish;

@interface Lake : NSObject

@property (nonatomic, readonly) NSUInteger foodCount;
@property (nonatomic, readonly) NSArray *fishSpeciesList;

- (void)addAmount:(NSUInteger)amount;
- (NSUInteger)takeMaxAmount:(NSUInteger)maxAmount;
- (void)addFishSpecies:(FishSpecies *)species;
- (void)addFish:(Fish *)fish;
- (void)removeFish:(Fish *)fish;
- (NSArray *)fishListOfSpecies:(FishSpecies *)species;

@end
