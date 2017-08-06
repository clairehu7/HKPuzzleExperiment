//
//  HKParentController.h
//  HKPuzzleExperiment
//
//  Created by hukaiyin on 2017/8/6.
//  Copyright © 2017年 hky. All rights reserved.
//

#import <UIKit/UIKit.h>

#warning HKViewController

@interface HKParentController : UIViewController

@property (nonatomic, strong) NSArray <UIViewController *>*vcs;

- (void)turnInindex:(NSUInteger)index;
@end
