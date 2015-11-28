//
//  FishTableViewCell.h
//  Fish
//
//  Created by Thanh Pham on 11/28/15.
//  Copyright © 2015 Thanh Pham. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Fish;

@class FishTableViewCell;

@protocol FishTableViewCellDelegate <NSObject>

- (void)fishTableViewCellDeleteButtonTapped:(FishTableViewCell *)fishTableViewCell;

@end

@interface FishTableViewCell : UITableViewCell

@property (weak, nonatomic) id<FishTableViewCellDelegate> delegate;
@property (nonatomic) Fish *fish;

@end
