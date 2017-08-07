//
//  HKPuzzleChildController.h
//  HKPuzzleExperiment
//
//  Created by hukaiyin on 2017/8/6.
//  Copyright © 2017年 hky. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HKPuzzleConfiger.h"

#import "HKViewController.h"

@interface HKPuzzleChildController : HKViewController
- (instancetype)initWithType:(PuzzleViewType)type contentFrame:(CGRect)frame;
@end
