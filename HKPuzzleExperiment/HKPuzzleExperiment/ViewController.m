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
    [vc loadPhotosDic:@{@"20":@[@{
                                    @"code":@"0",
                                    @"url":@"http://img1.sc115.com/uploads/sc/jpg/137/1401.jpg",
                                    @"width":@"700",
                                    @"height":@"933"
                                  },
                                @{
                                    @"code":@"",
                                    @"url":@"http://www.9ly.com.cn/files/2014-3/f20140312174950176392.jpg",
                                    @"width":@"436",
                                    @"height":@"500"
                                    }
                                ],

                        @"41":@[@{
                                    @"code":@"0",
                                    @"url":@"",
                                    @"width":@"",
                                    @"height":@""
                                    },
                                @{
                                    @"code":@"",
                                    @"url":@"",
                                    @"width":@"",
                                    @"height":@""
                                    },
                                @{
                                    @"code":@"0",
                                    @"url":@"",
                                    @"width":@"",
                                    @"height":@""
                                    },
                                @{
                                    @"code":@"",
                                    @"url":@"",
                                    @"width":@"",
                                    @"height":@""
                                    }

                                ]}];

    [self.navigationController pushViewController:vc animated:YES];
}

@end
