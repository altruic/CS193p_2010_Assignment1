//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Ed Sibbald on 10/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CalculatorBrain.h"


@implementation CalculatorBrain


- (void)performWaitingOperation
{
	if ([waitingOperation isEqual:@"+"])
		operand = waitingOperand + operand;
	else if ([waitingOperation isEqual:@"-"])
		operand = waitingOperand - operand;
	else if ([waitingOperation isEqual:@"*"])
		operand = waitingOperand * operand;
	else if ([waitingOperation isEqual:@"/"]) {
		if (operand)
			operand = waitingOperand / operand;
	}
}


- (void)setOperand:(double)aDouble
{
	operand = aDouble;
}


- (double)performOperation:(NSString *)operation
{
	if ([operation isEqual:@"Store"]) {
		memory = operand;
	}
	else if ([operation isEqual:@"Mem +"]) {
		memory += operand;
	}
	else if ([operation isEqual:@"Recall"]) {
		operand = memory;
	}
	else if ([operation isEqual:@"sqrt"]) {
		if (operand > 0)
			operand = sqrt(operand);
	}
	else if ([operation isEqual:@"1/x"]) {
		if (operand)
			operand = 1 / operand;
	}
	else if ([operation isEqual:@"sin"])
		operand = sin(operand);
	else if ([operation isEqual:@"cos"])
		operand = cos(operand);
	else if ([operation isEqual:@"C"]) {
		operand = 0;
		waitingOperation = nil;
		waitingOperand = 0;
		memory = 0;
	}
	else if ([operation isEqual:@"+ / -"])
		operand = -operand;
	else {
		[self performWaitingOperation];
		waitingOperation = operation;
		waitingOperand = operand;
	}
	return operand;
}


@end
