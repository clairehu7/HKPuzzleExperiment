//
//  HKPuzzleChildController.m
//  HKPuzzleExperiment
//
//  Created by hukaiyin on 2017/8/6.
//  Copyright © 2017年 hky. All rights reserved.
//

#import "HKPuzzleChildController.h"
#import "HKPuzzleViewFactory.h"

@interface HKPuzzleChildController ()
@property (nonatomic, assign) PuzzleViewType type;
@end

@implementation HKPuzzleChildController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (instancetype)initWithContentFrame:(CGRect)frame type:(PuzzleViewType)type {
    self = [super init];
    if (self) {
        self.type = type;
        HKPuzzleView *view = [HKPuzzleViewFactory createViewWith:type frame:frame canEdit:YES];
        [self.view addSubview:view];
    }
    return self;
}

@end
