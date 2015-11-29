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

    NSString *detailText;
    if (_fish.isDead) {
        detailText = @"Dead";
    } else {
        if ([_fish isHungry]) {
            detailText = @"Hungry";
        }
        if (_fish.foodAware) {
            if (detailText) {
                detailText = [detailText stringByAppendingString:@" FoodAware"];
            } else {
                detailText = @"FoodAware";
            }
        }
    }
    NSMutableAttributedString *attributedDetailText;
    if (detailText.length > 0) {
        attributedDetailText = [[NSMutableAttributedString alloc] initWithString:detailText];
        [attributedDetailText addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:[detailText rangeOfString:@"Dead"]];
        [attributedDetailText addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:[detailText rangeOfString:@"Hungry"]];
        [attributedDetailText addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:[detailText rangeOfString:@"FoodAware"]];
    }
    self.detailTextLabel.attributedText = attributedDetailText;

    self.accessoryView.hidden = !_fish.isDead;
}

- (void)deleteButtonTapped {
    [_delegate fishTableViewCellDeleteButtonTapped:self];
}

@end
