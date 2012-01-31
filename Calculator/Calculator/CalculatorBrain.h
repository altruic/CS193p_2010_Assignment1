//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Ed Sibbald on 10/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CalculatorBrain : NSObject {
    double operand;
	NSString *waitingOperation;
	double waitingOperand;
	double memory;
}

- (void)setOperand:(double)aDouble;
- (double)performOperation:(NSString *)operation;

@end
