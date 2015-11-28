//
//  FishSpeciesTableHeaderView.h
//  Fish
//
//  Created by Thanh Pham on 11/28/15.
//  Copyright © 2015 Thanh Pham. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Lake;
@class FishSpecies;

@class FishSpeciesTableHeaderView;

@protocol FishSpeciesTableHeaderViewProtocol <NSObject>

- (void)fishSpeciesTableHeaderViewAddButtonTapped:(FishSpeciesTableHeaderView *)fishSpeciesTableHeaderView;

@end

@interface FishSpeciesTableHeaderView : UITableViewHeaderFooterView

@property (weak, nonatomic) id<FishSpeciesTableHeaderViewProtocol> delegate;
@property (nonatomic) FishSpecies *species;

@end
