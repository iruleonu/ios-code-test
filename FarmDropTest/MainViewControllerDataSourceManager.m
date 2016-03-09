//
//  MainViewControllerDataSourceManager.m
//  FarmDropTest
//
//  Created by Nuno Salvador on 09/03/16.
//  Copyright © 2016 Nuno Salvador. All rights reserved.
//

#import "MainViewControllerDataSourceManager.h"
#import "FibonacciModel.h"

@interface MainViewControllerDataSourceManager ()

@property (nonatomic, weak) id <MainViewControllerDataSourceManagerDelegate> delegate;
@property (nonatomic, strong) NSArray *items;

@end

@implementation MainViewControllerDataSourceManager

- (instancetype)initWithDelegate:(id<MainViewControllerDataSourceManagerDelegate>)delegate {
    if (self = [super init]) {
        self.delegate = delegate;
        self.items = [NSArray array];
    }
    return self;
}

#pragma mark - Public

- (NSInteger)numberOfSections {
    return 1;
}

- (NSUInteger)numberOfRowsInSection:(NSInteger)section {
    NSInteger rows = 0;
    
    rows = [self.items count];
    
    return rows;
}

- (id)modelObjectAtIndexPath:(NSIndexPath *)indexPath {
    return self.items[indexPath.row];
}

- (void)populateArrayWithFibNumbersFromOneToValue:(NSUInteger)value completionBlock:(MainViewControllerDataSourceManagerPopulationCompletionBlock)completionBlock {
    NSMutableArray *collection = [NSMutableArray arrayWithCapacity:value];
    
    for (int i=1; i<=value; i++) {
        FibonacciModel *aux = [[FibonacciModel alloc] initWithNumber:i];
        [collection addObject:aux];
    }
    
    self.items = collection;
    
    if (completionBlock) {
        completionBlock(collection);
    }
}

@end
