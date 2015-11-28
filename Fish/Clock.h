//
//  Clock.h
//  Fish
//
//  Created by Thanh Pham on 11/28/15.
//  Copyright © 2015 Thanh Pham. All rights reserved.
//

#import <Foundation/Foundation.h>

FOUNDATION_EXPORT NSString *const ClockTickNotification;

@interface Clock : NSObject

@property (nonatomic, readonly) NSUInteger time; // NSUInteger can handle up to over 136 years on a 32-bit system.

+ (instancetype)sharedClock;

- (void)start;
- (void)stop;

@end
