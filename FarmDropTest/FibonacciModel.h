//
//  FibonacciModel.h
//  FarmDropTest
//
//  Created by Nuno Salvador on 09/03/16.
//  Copyright © 2016 Nuno Salvador. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FibonacciProtocol.h"

@interface FibonacciModel : NSObject <FibonacciProtocol>

- (instancetype)initWithNumber:(NSUInteger)number;

@property (assign, readonly) NSUInteger number;

@end
