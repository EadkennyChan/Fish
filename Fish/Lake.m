//
//  Lake.m
//  Fish
//
//  Created by Thanh Pham on 11/26/15.
//  Copyright © 2015 Thanh Pham. All rights reserved.
//

#import "Lake.h"
#import "FishSpecies.h"
#import "Fish.h"
#import "RandomNumberHelper.h"

@interface Lake () {
    NSMutableArray *_fishSpeciesList;
    NSMutableArray *_fishGroupList;
}

@end

@implementation Lake

- (instancetype)init {
    self = [super init];
    if (self) {
        _fishSpeciesList = [NSMutableArray arrayWithCapacity:6];
        // add default fish species (read from plist instead?)
        [_fishSpeciesList addObject:[[FishSpecies alloc] initWithName:@"Alewife" maxAmount:100 biteAmount:2 hungryPoint:10 biteInterval:2 digestionSpeed:20]];
        [_fishSpeciesList addObject:[[FishSpecies alloc] initWithName:@"Betta" maxAmount:150 biteAmount:5 hungryPoint:20 biteInterval:3 digestionSpeed:60]];
        [_fishSpeciesList addObject:[[FishSpecies alloc] initWithName:@"Codlet" maxAmount:90 biteAmount:1 hungryPoint:30 biteInterval:1 digestionSpeed:10]];
        [_fishSpeciesList addObject:[[FishSpecies alloc] initWithName:@"Dory" maxAmount:160 biteAmount:4 hungryPoint:50 biteInterval:7 digestionSpeed:40]];
        [_fishSpeciesList addObject:[[FishSpecies alloc] initWithName:@"Eagle ray" maxAmount:200 biteAmount:10 hungryPoint:30 biteInterval:5 digestionSpeed:50]];
        [_fishSpeciesList addObject:[[FishSpecies alloc] initWithName:@"Firefish" maxAmount:7 biteAmount:1 hungryPoint:2 biteInterval:1 digestionSpeed:5]];

        _fishGroupList = [NSMutableArray arrayWithCapacity:6];
        // add a random number (from 5 to 10 inclusively) of fish of each species
        for (FishSpecies *species in _fishSpeciesList) {
            [_fishGroupList addObject:[NSMutableArray array]];

            NSUInteger randomFishIndividualsNumber = [RandomNumberHelper randomNumberBetweenMin:5 max:10];
            for (NSUInteger i = 0; i < randomFishIndividualsNumber; i++) {
                Fish *fish = [[Fish alloc] initWithSpecies:species];
                fish.lake = self;
                [[_fishGroupList lastObject] addObject:fish];
            }
        }
    }
    return self;
}

- (void)addAmount:(NSUInteger)amount {
    _foodCount += amount;

    for (NSArray *fishGroup in _fishGroupList) {
        NSMutableArray *aliveFishList = [NSMutableArray array];

        for (Fish *fish in fishGroup) {
            if (!fish.isDead) {
                [aliveFishList addObject:fish];
            }
        }

        if ([aliveFishList count] > 0) {
            NSUInteger randomFishIndex = [RandomNumberHelper randomNumberBetweenMin:0 max:(u_int32_t)([aliveFishList count] - 1)];
            Fish *fish = aliveFishList[randomFishIndex];
            fish.foodAware = YES;
        }
    }
}

- (NSUInteger)takeMaxAmount:(NSUInteger)maxAmount {
    NSUInteger amount = MIN(_foodCount, maxAmount);
    _foodCount -= amount;

    // run out of food
    if (_foodCount == 0) {
        for (NSArray *firstGroup in _fishGroupList) {
            for (Fish *fish in firstGroup) {
                fish.foodAware = NO;
            }
        }
    }

    return amount;
}

- (void)addFishSpecies:(FishSpecies *)species {
    [_fishSpeciesList addObject:species];
    [_fishGroupList addObject:[NSMutableArray array]];
}

- (void)addFish:(Fish *)fish {
    FishSpecies *species = fish.species;

    if (![_fishSpeciesList containsObject:species]) {
        [self addFishSpecies:species];
    }

    [_fishGroupList[[_fishSpeciesList indexOfObject:species]] addObject:fish];
    fish.lake = self;
}

- (void)removeFish:(Fish *)fish {
    NSMutableArray *fishList = (NSMutableArray *)[self fishListOfSpecies:fish.species];
    [fishList removeObject:fish];
}

- (NSArray *)fishListOfSpecies:(FishSpecies *)species {
    NSUInteger speciesIndex = [_fishSpeciesList indexOfObject:species];
    if (speciesIndex != NSNotFound) {
        return _fishGroupList[speciesIndex];
    }
    return nil;
}

@end
