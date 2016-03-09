//
//  FibonacciModel.m
//  FarmDropTest
//
//  Created by Nuno Salvador on 09/03/16.
//  Copyright © 2016 Nuno Salvador. All rights reserved.
//

#import "FibonacciModel.h"

@implementation FibonacciModel

#pragma mark - FibonacciProtocol

- (NSUInteger)fibonacciValue {
    return [self fibonacciFormula:self.number];
}

#pragma mark - Custom

// Recursive method
- (NSUInteger)fibonacciFormula:(NSUInteger)fibNumber {
    return ( fibNumber<=2 ? 1 : [self fibonacciFormula:fibNumber-1] + [self fibonacciFormula:fibNumber-2] );
}

@end
