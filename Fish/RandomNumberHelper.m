//
//  RandomNumberHelper.m
//  Fish
//
//  Created by Thanh Pham on 11/29/15.
//  Copyright © 2015 Thanh Pham. All rights reserved.
//

#import "RandomNumberHelper.h"

@implementation RandomNumberHelper

+ (u_int32_t)randomNumberBetweenMin:(u_int32_t)min max:(u_int32_t)max {
    return arc4random_uniform(max - min + 1) + min;
}

@end
