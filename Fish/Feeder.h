//
//  Feeder.h
//  Fish
//
//  Created by Thanh Pham on 11/26/15.
//  Copyright © 2015 Thanh Pham. All rights reserved.
//

#ifndef Feeder_h
#define Feeder_h

@class FoodPackage;
@class Lake;

@protocol Feeder <NSObject>

@property (nonatomic) FoodPackage *foodPackage;
@property (nonatomic) Lake *lake;

- (void)feed;

@end

#endif /* Feeder_h */
