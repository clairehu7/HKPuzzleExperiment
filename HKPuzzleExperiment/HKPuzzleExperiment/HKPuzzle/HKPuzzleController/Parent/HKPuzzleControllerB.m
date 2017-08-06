//
//  HKPuzzleControllerB.m
//  HKPuzzleExperiment
//
//  Created by hukaiyin on 2017/8/6.
//  Copyright © 2017年 hky. All rights reserved.
//

#import "HKPuzzleControllerB.h"
#import "HKPuzzleChildController.h"

@interface HKPuzzleControllerB ()

@end

@implementation HKPuzzleControllerB

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self commonInit];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)commonInit {
    self.title = @"PuzzleB";
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadChild];
}

- (void)loadChild {

    CGSize childSize = CGSizeMake(self.view.frame.size.width - 30, 100);

    CGRect childBounds = CGRectMake(0,0, childSize.width, childSize.height);

    CGRect childFrame = CGRectMake(15, 100, childSize.width, childSize.height);

    HKPuzzleChildController *vc1 = [[HKPuzzleChildController alloc]initWithType:PuzzleViewType2Imgs contentFrame:childBounds];
    HKPuzzleChildController *vc2 = [[HKPuzzleChildController alloc]initWithType:PuzzleViewType4ImgsOne contentFrame:childBounds];
    [self loadWithVcs:@[vc1,vc2] childFrame:childFrame];
    [self turnInindex:0];
}

@end
