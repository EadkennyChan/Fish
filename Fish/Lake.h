//
//  Lake.h
//  Fish
//
//  Created by Thanh Pham on 11/26/15.
//  Copyright © 2015 Thanh Pham. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Lake : NSObject

@property (nonatomic, readonly) NSUInteger foodCount;

- (void)addAmount:(NSUInteger)amount;
- (NSUInteger)takeMaxAmount:(NSUInteger)maxAmount;

@end
