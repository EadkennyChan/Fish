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

- (void)start;
- (void)stop;

@end
