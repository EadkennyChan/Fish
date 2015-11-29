//
//  Feeder.h
//  Fish
//
//  Created by Thanh Pham on 11/26/15.
//  Copyright © 2015 Thanh Pham. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FoodPackage;
@class Lake;

@interface Feeder : NSObject

@property (nonatomic) FoodPackage *foodPackage;
@property (nonatomic) Lake *lake;

- (void)feed;

@end
