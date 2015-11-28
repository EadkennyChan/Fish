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

        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [button setTitle:@"-" forState:UIControlStateNormal];
        button.frame = CGRectMake(0, 0, 44, 41);
        [button addTarget:self action:@selector(deleteButtonTapped) forControlEvents:UIControlEventTouchUpInside];
        self.accessoryView = button;

        self.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
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
    self.detailTextLabel.text = [_fish isDead] ? @"Dead" : [_fish isHungry] ? @"Hungry" : nil;
    self.accessoryView.hidden = ![_fish isDead];
}

- (void)deleteButtonTapped {
    [_delegate fishTableViewCellDeleteButtonTapped:self];
}

@end
