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
@property (nonatomic, strong)UIButton *leftBtn;
@property (nonatomic, strong)UIButton *rightBtn;
@end

@implementation HKViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.hidesBottomBarWhenPushed = YES;
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Btn init

- (void)creatLeftBtnWithTitle:(NSString *)title {
    if (!_leftBtn) {
        self.leftBtn = [[UIButton alloc] init];
        [self.leftBtn setFrame:CGRectMake(20, 20, TitleBarHeight, TitleBarHeight)];
        self.leftBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        [self.leftBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [self.leftBtn setTitle:title forState:UIControlStateNormal];
        [self.leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.leftBtn.titleLabel setFont:[UIFont systemFontOfSize:16]];
        [self.leftBtn addTarget:self action:@selector(leftBtnTUI:) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.leftBtn];
    }
    [self.leftBtn setTitle:title forState:UIControlStateNormal];
}

- (void)creatRightBtnWithTitle:(NSString *)title {
    if (!_rightBtn) {
        self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.rightBtn addTarget:self action:@selector(rightBtnTUI:) forControlEvents:UIControlEventTouchUpInside];
        [self.rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.rightBtn.layer.masksToBounds = YES;
        self.rightBtn.layer.cornerRadius = 8;
        [self.rightBtn.titleLabel setFont:[UIFont systemFontOfSize:16]];
    }

    [self.rightBtn setTitle:title forState:UIControlStateNormal];
    [self.rightBtn sizeToFit];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightBtn];
}

- (void)leftBtnTUI:(UIButton *)sender {

}

- (void)rightBtnTUI:(UIButton *)sender {

}

@end
