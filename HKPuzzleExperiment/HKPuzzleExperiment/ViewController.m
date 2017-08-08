//
//  ViewController.m
//  HKPuzzleExperiment
//
//  Created by hukaiyin on 2017/8/6.
//  Copyright © 2017年 hky. All rights reserved.
//

#import "ViewController.h"

#import "HKPuzzleControllerA.h"
#import "HKPuzzleControllerB.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)aTUI:(UIButton *)sender {
    HKPuzzleControllerA *vc = [HKPuzzleControllerA new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)bTUI:(UIButton *)sender {
    HKPuzzleControllerB *vc = [HKPuzzleControllerB new];
    NSDictionary *dic =  @{@"20":@[@{
                                       @"code":@(0),
                                       @"url":@"https://ohwflolko.qnssl.com/Fqq1ITFJa9UB4rlkjThU_9XTmW3R",
                                       @"width":@(2000),
                                       @"height":@(1134)
                                       },
                                   @{
                                       @"code":@(1),
                                       @"url":@"https://ohwflolko.qnssl.com/FtODbwp80FYC237XukdxhV_XyFkr",
                                       @"width":@(750),
                                       @"height":@(1125)
                                       }
                                   ],

                           @"41":@[@{
                                       @"code":@(0),
                                       @"url":@"https://ohwflolko.qnssl.com/FgupZTCDiKjcgs5Z41bAZ--lWVuX",
                                       @"width":@(2000),
                                       @"height":@(1134)
                                       },
                                   @{
                                       @"code":@(1),
                                       @"url":@"https://ohwflolko.qnssl.com/Fqq1ITFJa9UB4rlkjThU_9XTmW3R",
                                       @"width":@(2000),
                                       @"height":@(1134)
                                       },
                                   @{
                                       @"code":@(2),
                                       @"url":@"",
                                       @"width":@(0),
                                       @"height":@(0)
                                       },
                                   @{
                                       @"code":@(3),
                                       @"url":@"",
                                       @"width":@(0),
                                       @"height":@(0)
                                       }
                                   
                                   ]};

    [vc loadPhotosDic:dic];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
