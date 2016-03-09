//
//  MainViewControllerDataSourceManager.h
//  FarmDropTest
//
//  Created by Nuno Salvador on 09/03/16.
//  Copyright © 2016 Nuno Salvador. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^MainViewControllerDataSourceManagerPopulationCompletionBlock)(NSArray *items);


@protocol MainViewControllerDataSourceManagerDelegate <NSObject>

// Empty protocol

@end

@interface MainViewControllerDataSourceManager : NSObject

- (instancetype)initWithDelegate:(id<MainViewControllerDataSourceManagerDelegate>)delegate;

- (NSInteger)numberOfSections;
- (NSUInteger)numberOfRowsInSection:(NSInteger)section;
- (id)modelObjectAtIndexPath:(NSIndexPath *)indexPath;
- (void)populateArrayWithFibNumbersFromOneToValue:(NSUInteger)value completionBlock:(MainViewControllerDataSourceManagerPopulationCompletionBlock)completionBlock;

@end
