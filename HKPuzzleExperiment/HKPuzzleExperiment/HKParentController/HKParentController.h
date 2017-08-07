//
//  HKParentController.h
//  HKPuzzleExperiment
//
//  Created by hukaiyin on 2017/8/6.
//  Copyright © 2017年 hky. All rights reserved.
//

#import "HKViewController.h"

@interface HKParentController : HKViewController

- (void)loadWithVcs:(NSArray <UIViewController *>*)vcs childFrame:(CGRect)frame;

- (void)turnTo:(NSUInteger)index;
@end
