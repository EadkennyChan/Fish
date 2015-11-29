//
//  Feeder.m
//  Fish
//
//  Created by Thanh Pham on 11/29/15.
//  Copyright © 2015 Thanh Pham. All rights reserved.
//

#import "Feeder.h"
#import "FoodPackage.h"
#import "Lake.h"

@implementation Feeder

- (void)feed {
    if ([_foodPackage isReady]) {
        NSUInteger amount = [_foodPackage use];
        [_lake addAmount:amount];
    }
}

@end
