//
//  HKPuzzleController.m
//  HKPuzzleExperiment
//
//  Created by hukaiyin on 2017/8/6.
//  Copyright © 2017年 hky. All rights reserved.
//

#import "HKPuzzleChildController.h"

#import "HKPuzzleController.h"
#import "HKPuzzleConfiger.h"

@interface HKPuzzleController ()<HKPuzzleChildControllerDelegate>
@property (nonatomic, strong) NSDictionary *photosDic;
@end

@implementation HKPuzzleController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGRect)childFrame {
    CGRect frame = CGRectZero;
    return frame;
}

- (void)loadPhotosDic:(NSDictionary *)dic {
    self.photosDic = dic;
    CGRect childFrame = [self childFrame];
    
    CGRect childBounds = CGRectMake(0, 0, childFrame.size.width, childFrame.size.height);

    NSMutableArray *childVCs = [NSMutableArray array];

    for (NSString *key in [dic allKeys]) {
        //dic 的 key 对应了 相应的 PuzzleViewType 模版类型
        PuzzleViewType type = [key intValue];
        NSArray *photos = [dic objectForKey:key];

        HKPuzzleChildController *vc = [[HKPuzzleChildController alloc]initWithType:type photos:photos contentFrame:childBounds];
        vc.puzzleCtlDelegate = self;
        [childVCs addObject:vc];
    }

    [self loadWithVcs:childVCs.copy childFrame:childFrame];
    [self turnTo:0];
}


#pragma mark - HKPuzzleChildControllerDelegate

- (NSArray<HKPuzzlePhoto *> *)refreshPuzzlePieceAt:(NSUInteger)index inController:(HKPuzzleChildController *)puzzleController {

    PuzzleViewType type = puzzleController.type;
    NSString *key = [NSString stringWithFormat:@"%@",@(type)];
    NSArray *photos = [self.photosDic objectForKey:key];
    HKPuzzlePhoto *photo = [photos objectAtIndex:index];

    
#warning 取 photo 的宽高，裁剪后重新装载 photos，赋值并回传
    NSArray *newPhotos;
    return newPhotos;
}

@end
