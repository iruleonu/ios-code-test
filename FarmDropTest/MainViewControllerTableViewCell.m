//
//  MainViewControllerTableViewCell.m
//  FarmDropTest
//
//  Created by Nuno Salvador on 09/03/16.
//  Copyright © 2016 Nuno Salvador. All rights reserved.
//

#import "MainViewControllerTableViewCell.h"
#import "FibonacciModel.h"

@interface MainViewControllerTableViewCell ()

@property (nonatomic, weak) IBOutlet UILabel *number;
@property (nonatomic, weak) IBOutlet UILabel *fibValue;

@end

@implementation MainViewControllerTableViewCell

- (void)updateWithModel:(FibonacciModel *)model {
    self.number.text = [NSString stringWithFormat:@"Number: %ld", model.number];
    self.fibValue.text = [NSString stringWithFormat:@"Fibonacci value: %ld", [model fibonacciValue]];
}

@end
