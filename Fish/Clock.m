//
//  Clock.m
//  Fish
//
//  Created by Thanh Pham on 11/28/15.
//  Copyright © 2015 Thanh Pham. All rights reserved.
//

#import "Clock.h"

NSString *const ClockTickNotification = @"ClockTickNotification";

@interface Clock () {
    __weak NSTimer *timer; // __weak is to avoid strong reference cycle and as the timer is already retained by the run loop.
}

@end

@implementation Clock

+ (instancetype)sharedClock {
    static Clock *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (void)start {
    _time = 0;
    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(tick) userInfo:nil repeats:YES];
}

- (void)stop {
    [timer invalidate];
}

- (void)tick {
    _time++;
    [[NSNotificationCenter defaultCenter] postNotificationName:ClockTickNotification object:self];
}

@end
