//
//  WorldTableHeaderView.m
//  Fish
//
//  Created by Thanh Pham on 11/29/15.
//  Copyright © 2015 Thanh Pham. All rights reserved.
//

#import "WorldTableHeaderView.h"
#import "World.h"
#import "FoodPackage.h"
#import "Lake.h"
#import "Clock.h"

@interface WorldTableHeaderView ()

@property (nonatomic) IBOutlet UIView *contentView;
@property (nonatomic) IBOutlet UILabel *label;

@end

@implementation WorldTableHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [[NSBundle mainBundle] loadNibNamed:@"WorldTableHeaderView" owner:self options:nil];
        [self addSubview:_contentView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _contentView.frame = self.bounds;
}

- (void)setWorld:(World *)world {
    _world = world;
    [self reloadData];
}

- (void)reloadData {
    _label.text = [NSString stringWithFormat:@"Time: %lu seconds.\nM: %lu. N: %lu seconds. Usable: >=%lu.\nFood Package: %lu.\nLake: %lu.", (unsigned long)[Clock sharedClock].time, (unsigned long)_world.foodPackage.maxAmount, (unsigned long)_world.foodPackage.fullRefillInterval, (unsigned long)_world.foodPackage.minAmountUsable, (unsigned long)_world.foodPackage.amount, (unsigned long)_world.lake.foodCount];
}

@end
