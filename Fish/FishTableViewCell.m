//
//  FishTableViewCell.m
//  Fish
//
//  Created by Thanh Pham on 11/28/15.
//  Copyright © 2015 Thanh Pham. All rights reserved.
//

#import "FishTableViewCell.h"
#import "Fish.h"

@implementation FishTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    if (self) {
        self.detailTextLabel.textColor = [UIColor redColor];
    }
    return self;
}

- (void)prepareForReuse {
    [super prepareForReuse];
    self.fish = nil;
}

- (void)setFish:(Fish *)fish {
    _fish = fish;
    [self reloadData];
}

- (void)reloadData {
    self.textLabel.text = [NSString stringWithFormat:@"Ci: %lu", (unsigned long)_fish.leftAmount];
    self.detailTextLabel.text = [_fish isDead] ? @"Dead - Swipe left to delete" : [_fish isHungry] ? @"Hungry" : nil;
}

@end
