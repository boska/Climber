//
//  RBHeightPlotViewController.h
//  climber
//
//  Created by Boska on 7/23/13.
//  Copyright (c) 2013 Boska. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CorePlot-CocoaTouch.h>
@interface RBHeightPlotViewController : UIViewController  <CPTPlotDataSource>
@property (nonatomic,strong) NSArray *heightsArray;
@end
