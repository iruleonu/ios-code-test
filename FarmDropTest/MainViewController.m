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
static const NSUInteger ViewControllerDefaultMaximunFibbonaciNumber = 7;

@interface MainViewController () <UITableViewDataSource, UITableViewDelegate, MainViewControllerDataSourceManagerDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet UIActivityIndicatorView *activityIndicatorView;
@property (nonatomic, strong) MainViewControllerDataSourceManager *dataSourceManager;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSourceManager = [[MainViewControllerDataSourceManager alloc] initWithDelegate:self];
    
    [self setupUI];
    
    [self changeMaximunFibonacciNumberTo:ViewControllerDefaultMaximunFibbonaciNumber];
}

#pragma mark - Build UI

- (void)setupUI {
    self.title = ViewControllerTitle;
    
    [self setupNavigationBar];
    [self hideAndStopNetworkIndicator];
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

- (void)showAndStartNetworkIndicator {
    [self.activityIndicatorView startAnimating];
    self.activityIndicatorView.alpha = 1.0f;
}

- (void)hideAndStopNetworkIndicator {
    [self.activityIndicatorView stopAnimating];
    self.activityIndicatorView.alpha = 0.0f;
}

- (void)handleSettingsTap:(id)sender {
    __weak typeof(self) welf = self;
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Choose the maximun number value"
                                                                             message:@"(from 1 to n)"
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addTextFieldWithConfigurationHandler:nil];
    
    [alertController addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"OK", nil)
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction * _Nonnull action) {
                                                          UITextField *textField = [alertController.textFields firstObject];
                                                          NSUInteger value = [textField.text longLongValue];
                                                          if (value) {
                                                              [welf changeMaximunFibonacciNumberTo:value];
                                                          }
                                                      }]];
    
    [self presentViewController:alertController animated:YES completion:nil];
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

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    FibonacciModel *model = [self.dataSourceManager modelObjectAtIndexPath:indexPath];
    [model fibonacciValue];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Custom

// Asynchronous method
- (void)changeMaximunFibonacciNumberTo:(NSUInteger)maximum {
    if (!maximum) {
        return;
    }
    
    [self showAndStartNetworkIndicator];
    
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        [self.dataSourceManager populateArrayWithFibNumbersFromOneToValue:maximum completionBlock:^(NSArray *items) {
            dispatch_async(dispatch_get_main_queue(), ^(void){
                [self hideAndStopNetworkIndicator];
                [self.tableView reloadData];
            });
        }];
    });
}

@end
