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
        // add a random number (from 6 to 9 inclusively) of fish of each species
        for (FishSpecies *species in _fishSpeciesList) {
            [_fishGroupList addObject:[NSMutableArray array]];

            NSUInteger randomFishIndividualsNumber = arc4random_uniform(4) + 6;
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
}

- (NSUInteger)takeMaxAmount:(NSUInteger)maxAmount {
    NSUInteger amount = MIN(_foodCount, maxAmount);
    _foodCount -= amount;
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
