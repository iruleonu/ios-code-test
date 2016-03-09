//
//  FibonacciModel.m
//  FarmDropTest
//
//  Created by Nuno Salvador on 09/03/16.
//  Copyright © 2016 Nuno Salvador. All rights reserved.
//

#import "FibonacciModel.h"

@interface FibonacciModel ()

@property (assign, readwrite) NSUInteger number;
@property (nonatomic) NSUInteger cachedValue;

@end

@implementation FibonacciModel

- (instancetype)initWithNumber:(NSUInteger)number {
    if (self = [super init]) {
        self.number = number;
        self.cachedValue = [self fibonacciValue];
    }
    return self;
}

#pragma mark - FibonacciProtocol

- (NSUInteger)fibonacciValue {
    if (!self.cachedValue) {
        self.cachedValue = [self fibonacciFormula:self.number];
    }
    return self.cachedValue;
}

#pragma mark - Custom

// Recursive method
- (NSUInteger)fibonacciFormula:(NSUInteger)fibNumber {
    return ( fibNumber<=2 ? 1 : [self fibonacciFormula:fibNumber-1] + [self fibonacciFormula:fibNumber-2] );
}

@end
