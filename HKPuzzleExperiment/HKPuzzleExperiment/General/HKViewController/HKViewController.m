//
//  HKViewController.m
//  HKBaseNavigationDemo
//
//  Created by hukaiyin on 16/6/27.
//  Copyright © 2016年 hukaiyin. All rights reserved.
//

#import "HKViewController.h"
#import "HKMarco.h"

@interface HKViewController ()

@end

@implementation HKViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.hidesBottomBarWhenPushed = YES;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
