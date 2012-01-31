//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Ed Sibbald on 10/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CalculatorViewController.h"

@implementation CalculatorViewController

- (CalculatorBrain *)brain
{
	if (!brain)
		brain = [[CalculatorBrain alloc] init];
	return brain;
}


- (IBAction)digitPressed:(UIButton *)sender
{
	NSString *digit = [[sender titleLabel] text];
	
	if (userIsTypingANumber)
		[display setText:[[display text] stringByAppendingString:digit]];
	else {
		[display setText:digit];
		userIsTypingANumber = YES;
	}
}


- (IBAction)operationPressed:(UIButton *)sender
{
	if (userIsTypingANumber) {
		[[self brain] setOperand:[[display text] doubleValue]];
		userIsTypingANumber = NO;
	}
	NSString *operation = [[sender titleLabel] text];
	double result = [[self brain] performOperation:operation];
	[display setText:[NSString stringWithFormat:@"%g", result]];
}


- (IBAction)decimalPointPressed
{
	if (userIsTypingANumber) {
		NSRange range = [[display text] rangeOfString:@"."];
		if (range.location == NSNotFound)
			[display setText:[[display text] stringByAppendingString:@"."]];
	}
	else {
		[display setText:@"0."];
		userIsTypingANumber = YES;
	}
}

@end
