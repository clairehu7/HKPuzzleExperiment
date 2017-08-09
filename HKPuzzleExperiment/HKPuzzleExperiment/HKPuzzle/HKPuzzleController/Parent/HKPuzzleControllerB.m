//
//  HKPuzzleControllerB.m
//  HKPuzzleExperiment
//
//  Created by hukaiyin on 2017/8/6.
//  Copyright © 2017年 hky. All rights reserved.
//

#import "HKMarco.h"
#import "HKPuzzleBtn.h"
#import "HKPuzzleChildController.h"

#import "HKPuzzleControllerB.h"

@interface HKPuzzleControllerB () 
@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UIView *bottomView;
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
}

- (CGRect)childFrame {
    CGFloat childHeight = kViewHeight - self.topView.y_max - self.bottomView.height;

    CGSize childSize = CGSizeMake(kScWidth - 30, childHeight);

    CGRect childFrame = CGRectMake(15, self.topView.y_max, childSize.width, childSize.height);
    return childFrame;
}

- (void)switchTUI:(UIButton *)sender {
    NSUInteger index = sender.tag;
    [self turnTo:index];
}

#pragma mark - Setters & Getters

- (UIView *)topView {
    if (!_topView) {
        _topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScWidth, 57)];
        [self.view addSubview:_topView];

        UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, kScWidth, 36)];
        label1.textColor = [UIColor colorFromRGBHex:0x333333];
        label1.font = [UIFont systemFontOfSize:18];
        label1.textAlignment = NSTextAlignmentCenter;
        label1.text = @"选择模版";
        [_topView addSubview:label1];


        UIView *promptView = [[UIView alloc]initWithFrame:CGRectMake(0, label1.y_max, 105, _topView.height - label1.y_max - 6)];
        [_topView addSubview:promptView];


        UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 12, 12)];
        imgView.image = [UIImage imageNamed:@"exclamation"];
        imgView.centerY = promptView.height/2;
        [promptView addSubview:imgView];

        CGFloat labelX = imgView.x_max + 5;
        UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(labelX, 0, promptView.width - labelX, _topView.height - label1.y_max - 6)];
        label2.textColor = [UIColor colorFromRGBHex:0x999999];
        label2.font = [UIFont systemFontOfSize:12];
        label2.text = @"点按图片替换";
        [label2 sizeToFit];
        label2.centerY = imgView.centerY;
        [promptView addSubview:label2];

        promptView.width = label2.x_max;
        promptView.centerX = kScWidth / 2;

    }
    return _topView;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        CGFloat height = 90;
        _bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, kViewHeight - height, kScWidth, height)];
        _bottomView.backgroundColor = [UIColor colorFromRGBHex:0xEFEFEF];
        [self.view addSubview:_bottomView];

        CGFloat btnY = 6;
        CGFloat btnWidth = 40;
        CGFloat btnHeight = 84;
        CGFloat space = 15;

        HKPuzzleBtn *btn0 = [[HKPuzzleBtn alloc]initWithFrame:CGRectMake(0, btnY, btnWidth, btnHeight) type:PuzzleViewType2Imgs];
        btn0.tag = 0;
        btn0.x = kScWidth / 2 - btn0.width - space;
        [_bottomView addSubview:btn0];
        [btn0 addTarget:self action:@selector(switchTUI:) forControlEvents:UIControlEventTouchUpInside];


        HKPuzzleBtn *btn1 = [[HKPuzzleBtn alloc]initWithFrame:CGRectMake(0, btnY, btnWidth, btnHeight) type:PuzzleViewType4ImgsOne];
        btn1.tag = 1;
        btn1.x = kScWidth / 2 + space;
        [_bottomView addSubview:btn1];
        [btn1 addTarget:self action:@selector(switchTUI:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _bottomView;
}

@end
