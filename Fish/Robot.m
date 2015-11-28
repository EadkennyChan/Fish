//
//  Robot.m
//  Fish
//
//  Created by Thanh Pham on 11/26/15.
//  Copyright © 2015 Thanh Pham. All rights reserved.
//

#import "Robot.h"
#import "FoodPackage.h"
#import "Lake.h"

@interface Robot () {
    FoodPackage *_foodPackage;
    Lake *_lake;
}

@end

@implementation Robot
@synthesize foodPackage=_foodPackage, lake=_lake;

- (void)feed {
    // TODO: to be implemented
}

@end
