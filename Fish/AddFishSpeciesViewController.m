//
//  AddFishSpeciesViewController.m
//  Fish
//
//  Created by Thanh Pham on 11/29/15.
//  Copyright © 2015 Thanh Pham. All rights reserved.
//

#import "AddFishSpeciesViewController.h"
#import "Lake.h"
#import "FishSpecies.h"

static NSString *const FishSpeciesAddErrorDomain = @"FishSpeciesAddErrorDomain";

@interface AddFishSpeciesViewController () {
    Lake *_lake;
}

@property (nonatomic) IBOutlet UITextField *nameLabel;
@property (nonatomic) IBOutlet UITextField *cLabel;
@property (nonatomic) IBOutlet UITextField *iLabel;
@property (nonatomic) IBOutlet UITextField *cmLabel;
@property (nonatomic) IBOutlet UITextField *sLabel;
@property (nonatomic) IBOutlet UITextField *tLabel;

@end

@implementation AddFishSpeciesViewController

- (instancetype)init {
    return [self initWithLake:nil];
}

- (instancetype)initWithLake:(Lake *)lake {
    self = [super init];
    if (self) {
        _lake = lake;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Add new fish kind";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelButtonTapped)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonTapped)];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [_nameLabel becomeFirstResponder];
}

- (NSError *)addFishSpecies {
    if (_nameLabel.text.length == 0) {
        return [NSError errorWithDomain:FishSpeciesAddErrorDomain code:0 userInfo:@{@"message": @"Please give the new fish kind a name.", @"field": _nameLabel}];
    }

    for (FishSpecies *species in _lake.fishSpeciesList) {
        if ([species.name isEqualToString:_nameLabel.text]) {
            return [NSError errorWithDomain:FishSpeciesAddErrorDomain code:1 userInfo:@{@"message": @"A fish kind with the same name already exists. Please choose another name.", @"field": _nameLabel}];
        }
    }

    NSNumber *cNumber = [self numberFromTextField:_cLabel];
    if (!cNumber) {
        return [NSError errorWithDomain:FishSpeciesAddErrorDomain code:2 userInfo:@{@"message": @"C should be a number.", @"field": _cLabel}];
    }

    NSNumber *iNumber = [self numberFromTextField:_iLabel];
    if (!iNumber) {
        return [NSError errorWithDomain:FishSpeciesAddErrorDomain code:2 userInfo:@{@"message": @"i should be a number.", @"field": _iLabel}];
    }

    NSNumber *cmNumber = [self numberFromTextField:_cmLabel];
    if (!cmNumber) {
        return [NSError errorWithDomain:FishSpeciesAddErrorDomain code:2 userInfo:@{@"message": @"Cm should be a number.", @"field": _cmLabel}];
    }

    NSNumber *sNumber = [self numberFromTextField:_sLabel];
    if (!sNumber) {
        return [NSError errorWithDomain:FishSpeciesAddErrorDomain code:2 userInfo:@{@"message": @"S should be a number.", @"field": _sLabel}];
    }

    NSNumber *tNumber = [self numberFromTextField:_tLabel];
    if (!tNumber) {
        return [NSError errorWithDomain:FishSpeciesAddErrorDomain code:2 userInfo:@{@"message": @"T should be a number.", @"field": _tLabel}];
    }

    if ([sNumber integerValue] <= 0) {
        return [NSError errorWithDomain:FishSpeciesAddErrorDomain code:3 userInfo:@{@"message": @"S should be greater than 0.", @"field": _sLabel}];
    }

    FishSpecies *species = [[FishSpecies alloc] initWithName:_nameLabel.text maxAmount:[cNumber integerValue] biteAmount:[iNumber integerValue] hungryPoint:[cmNumber integerValue] biteInterval:[sNumber integerValue] digestionSpeed:[tNumber integerValue]];
    [_lake addFishSpecies:species];

    return nil;
}

- (NSNumber *)numberFromTextField:(UITextField *)textField {
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    return [numberFormatter numberFromString:textField.text];
}

- (void)cancelButtonTapped {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)doneButtonTapped {
    NSError *inputError = [self addFishSpecies];
    if (inputError) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:inputError.userInfo[@"message"] preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            [((UITextField *)inputError.userInfo[@"field"]) becomeFirstResponder];
        }]];
        [self presentViewController:alertController animated:YES completion:nil];
    } else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
