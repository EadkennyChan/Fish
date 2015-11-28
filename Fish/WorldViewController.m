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
#import "Clock.h"
#import "FishTableViewCell.h"
#import "FishSpeciesTableHeaderView.h"
#import "AddFishSpeciesViewController.h"

static NSString *const FishCellIdentifier = @"FishCellIdentifier";
static NSString *const FishSpeciesTableHeaderViewIdentifier = @"FishSpeciesTableHeaderViewIdentifier";

@interface WorldViewController () <FishSpeciesTableHeaderViewDelegate, FishTableViewCellDelegate>

@end

@implementation WorldViewController

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:ClockTickNotification object:_world];
}

#pragma mark - UIViewController life cycle methods

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[FishTableViewCell class] forCellReuseIdentifier:FishCellIdentifier];
    [self.tableView registerClass:[FishSpeciesTableHeaderView class] forHeaderFooterViewReuseIdentifier:FishSpeciesTableHeaderViewIdentifier];
    self.tableView.allowsSelection = NO;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addButtonTapped)];
    [self updateTitle];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tick) name:ClockTickNotification object:nil];
}

#pragma mark - setters and getters

- (void)setWorld:(World *)world {
    _world = world;
    [self updateTitle];
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

    FishTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:FishCellIdentifier];
    cell.delegate = self;
    cell.fish = fish;
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    FishSpeciesTableHeaderView *headerView = [self.tableView dequeueReusableHeaderFooterViewWithIdentifier:FishSpeciesTableHeaderViewIdentifier];
    headerView.delegate = self;
    headerView.species = _world.lake.fishSpeciesList[section];
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 60.f;
}

#pragma mark - NSNotificationCenter related methods

- (void)tick {
    [self updateTitle];
    [self.tableView reloadData];
}

#pragma mark - FishSpeciesTableHeaderViewDelegate

- (void)fishSpeciesTableHeaderViewAddButtonTapped:(FishSpeciesTableHeaderView *)fishSpeciesTableHeaderView {
    [_world.lake addFish:[[Fish alloc] initWithSpecies:fishSpeciesTableHeaderView.species]];
    [self.tableView reloadData];
}

#pragma mark - FishTableViewCellDelegte

- (void)fishTableViewCellDeleteButtonTapped:(FishTableViewCell *)fishTableViewCell {
    [_world.lake removeFish:fishTableViewCell.fish];
    [self.tableView reloadData];
}

#pragma mark - "private" methods

- (void)updateTitle {
    self.title = [NSString stringWithFormat:@"Clock: %lu second(s)", (unsigned long)[Clock sharedClock].time];
}

- (void)addButtonTapped {
    AddFishSpeciesViewController *addFishSpeciesViewController = [[AddFishSpeciesViewController alloc] initWithLake:_world.lake];
    [self presentViewController:[[UINavigationController alloc] initWithRootViewController:addFishSpeciesViewController] animated:YES completion:nil];
}

@end
