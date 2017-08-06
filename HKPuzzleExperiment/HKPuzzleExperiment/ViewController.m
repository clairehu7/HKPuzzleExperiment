//
//  ViewController.m
//  HKPuzzleExperiment
//
//  Created by hukaiyin on 2017/8/6.
//  Copyright © 2017年 hky. All rights reserved.
//

#import "ViewController.h"
#import "HKPuzzleViewFactory.h"

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
    [self.navigationController pushViewController:vc animated:YES];
}

@end
