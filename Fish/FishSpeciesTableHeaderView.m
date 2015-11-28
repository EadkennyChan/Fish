//
//  FishSpeciesTableHeaderView.m
//  Fish
//
//  Created by Thanh Pham on 11/28/15.
//  Copyright © 2015 Thanh Pham. All rights reserved.
//

#import "FishSpeciesTableHeaderView.h"
#import "FishSpecies.h"

@interface FishSpeciesTableHeaderView ()

@property (nonatomic) IBOutlet UIView *speciesDetailsView;
@property (nonatomic) IBOutlet UILabel *speciesDetailsLabel;

@end

@implementation FishSpeciesTableHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [[NSBundle mainBundle] loadNibNamed:@"FishSpeciesTableHeaderContentView" owner:self options:nil];
        [self.contentView addSubview:_speciesDetailsView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _speciesDetailsView.frame = self.contentView.bounds;
}

- (void)prepareForReuse {
    self.species = nil;
}

- (void)setSpecies:(FishSpecies *)species {
    _species = species;
    [self reloadData];
}

- (void)reloadData {
    _speciesDetailsLabel.text = [NSString stringWithFormat:@"%@.\nC: %lu. i: %lu. Cm: %lu. S: %lu. T: %lu.", _species.name, _species.maxAmount, _species.biteAmount, _species.hungryPoint, _species.biteInterval, _species.digestionSpeed];
}

- (IBAction)addedButtonTapped {
    [_delegate fishSpeciesTableHeaderViewAddButtonTapped:self];
}

@end
