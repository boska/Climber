//
//  RBHeightView.m
//  climber
//
//  Created by Boska on 13/7/24.
//  Copyright (c) 2013年 Boska. All rights reserved.
//

#import "RBHeightView.h"

@implementation RBHeightView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    //// Color Declarations
    UIColor* strokeColor = [UIColor colorWithRed: 0.657 green: 0 blue: 0 alpha: 1];
    UIColor* color = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0];
    
    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(0.5, 234.5)];
    [bezierPath addLineToPoint: CGPointMake(16.5, 225.5)];
    [bezierPath addLineToPoint: CGPointMake(36.5, 206.5)];
    [bezierPath addLineToPoint: CGPointMake(64.5, 234.5)];
    [bezierPath addLineToPoint: CGPointMake(96.5, 206.5)];
    [bezierPath addLineToPoint: CGPointMake(114.5, 178.5)];
    [bezierPath addLineToPoint: CGPointMake(136.5, 206.5)];
    [bezierPath addLineToPoint: CGPointMake(169.5, 129.5)];
    [bezierPath addLineToPoint: CGPointMake(199.5, 206.5)];
    [bezierPath addLineToPoint: CGPointMake(220.5, 110.5)];
    [bezierPath addLineToPoint: CGPointMake(250.5, 129.5)];
    [bezierPath addLineToPoint: CGPointMake(277.5, 86.5)];
    [bezierPath addLineToPoint: CGPointMake(290.5, 62.5)];
    [bezierPath addLineToPoint: CGPointMake(301.5, 110.5)];
    [color setFill];
    [bezierPath fill];
    [strokeColor setStroke];
    bezierPath.lineWidth = 2.5;
    [bezierPath stroke];

    
    

}


@end
