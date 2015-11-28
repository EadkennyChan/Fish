//
//  WorldTableHeaderView.h
//  Fish
//
//  Created by Thanh Pham on 11/29/15.
//  Copyright © 2015 Thanh Pham. All rights reserved.
//

#import <UIKit/UIKit.h>

@class World;

@interface WorldTableHeaderView : UIView

@property (nonatomic) World *world;

- (void)reloadData;

@end
