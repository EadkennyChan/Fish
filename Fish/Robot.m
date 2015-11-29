//
//  Robot.m
//  Fish
//
//  Created by Thanh Pham on 11/26/15.
//  Copyright © 2015 Thanh Pham. All rights reserved.
//

#import "Robot.h"
#import "Clock.h"

@implementation Robot

- (void)start {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:ClockTickNotification object:nil]; // to avoid duplicated observer when start more than once.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tick) name:ClockTickNotification object:nil];
}

- (void)stop {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:ClockTickNotification object:nil];
}

- (void)tick {
    [self feed];
}

@end
