//
//  Farmer.m
//  Fish
//
//  Created by Thanh Pham on 11/26/15.
//  Copyright © 2015 Thanh Pham. All rights reserved.
//

#import "Farmer.h"
#import "FoodPackage.h"
#import "Lake.h"

@interface Farmer () {
    FoodPackage *_foodPackage;
    Lake *_lake;
}

@end

@implementation Farmer
@synthesize foodPackage=_foodPackage, lake=_lake;

- (void)feed {
    NSUInteger amount = [_foodPackage use];
    [_lake addAmount:amount];
}

@end
