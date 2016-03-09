//
//  MainViewControllerTableViewCell.h
//  FarmDropTest
//
//  Created by Nuno Salvador on 09/03/16.
//  Copyright © 2016 Nuno Salvador. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FibonacciModel;

@interface MainViewControllerTableViewCell : UITableViewCell

- (void)updateWithModel:(FibonacciModel *)model;

@end
