//
//  ViewController.m
//  FarmDropTest
//
//  Created by Nuno Salvador on 09/03/16.
//  Copyright © 2016 Nuno Salvador. All rights reserved.
//

#import "MainViewController.h"
#import "MainViewControllerTableViewCell.h"
#import "MainViewControllerDataSourceManager.h"
#import "FibonacciModel.h"

static NSString * const ViewControllerTitle = @"Fibbonaci Numbers List";
static NSString * const ViewControllerCellIdentifier = @"MainViewControllerCellIdentifier";
static NSString * const ViewControllerResourceSettingsIcon = @"settings-icon";

@interface MainViewController () <UITableViewDataSource, UITableViewDelegate, MainViewControllerDataSourceManagerDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) MainViewControllerDataSourceManager *dataSourceManager;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSourceManager = [[MainViewControllerDataSourceManager alloc] initWithDelegate:self];
    
    [self setupUI];
}

#pragma mark - Build UI

- (void)setupUI {
    self.title = ViewControllerTitle;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self setupNavigationBar];
}

- (void)setupNavigationBar {
    UIImage *settingsImage = [[UIImage imageNamed:ViewControllerResourceSettingsIcon]
                              imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *settingsBarButtonItem = [[UIBarButtonItem alloc] initWithImage:settingsImage
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(handleSettingsTap:)];
    self.navigationItem.rightBarButtonItem = settingsBarButtonItem;
}

#pragma mark - Actions and selectors

- (void)handleSettingsTap:(id)sender {
    // TODO:
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSourceManager numberOfRowsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MainViewControllerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ViewControllerCellIdentifier];
    
    FibonacciModel *model = [self.dataSourceManager modelObjectAtIndexPath:indexPath];
    [cell updateWithModel:model];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
