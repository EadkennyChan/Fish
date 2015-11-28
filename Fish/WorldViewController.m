//
//  WorldViewController.m
//  Fish
//
//  Created by Thanh Pham on 11/28/15.
//  Copyright © 2015 Thanh Pham. All rights reserved.
//

#import "WorldViewController.h"
#import "World.h"
#import "Lake.h"
#import "Fish.h"
#import "FishSpecies.h"

static NSString *const FishCellIdentifier = @"FishCellIdentifier";

@implementation WorldViewController

#pragma mark - UIViewController life cycle methods

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Fish";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:FishCellIdentifier];
    self.tableView.allowsSelection = NO;
}

#pragma mark - setters and getters

- (void)setWorld:(World *)world {
    _world = world;
    [self.tableView reloadData];
}

#pragma mark - UITableView related methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [_world.lake.fishSpeciesList count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[_world.lake fishListOfSpecies:_world.lake.fishSpeciesList[section]] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FishSpecies *species = _world.lake.fishSpeciesList[indexPath.section];
    Fish *fish = [_world.lake fishListOfSpecies:species][indexPath.row];

    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:FishCellIdentifier];
    cell.textLabel.text = [NSString stringWithFormat:@"Ci: %lu%@", (unsigned long)fish.leftAmount, [fish isDead] ? @" - Dead. Swipe left to remove." : @""];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    FishSpecies *species = _world.lake.fishSpeciesList[section];

    return [NSString stringWithFormat:@"%@: (%lu). C: %lu. i: %lu. Cm: %lu. S: %lu, T: %lu.", species.name, (unsigned long)[[_world.lake fishListOfSpecies:species] count], species.maxAmount, species.biteAmount, species.hungryPoint, species.biteInterval, species.digestionSpeed];
}

@end
