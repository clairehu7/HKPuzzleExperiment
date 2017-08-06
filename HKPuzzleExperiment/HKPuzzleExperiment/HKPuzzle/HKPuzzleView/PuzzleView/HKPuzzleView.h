//
//  HKPuzzleView.h
//  HKPuzzleExperiment
//
//  Created by hukaiyin on 2017/8/6.
//  Copyright © 2017年 hky. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HKPuzzlePhoto.h"

@interface HKPuzzleView : UIView

@property (nonatomic, assign) BOOL canEdit;
@property (nonatomic, strong, setter=updateWith:) NSArray <HKPuzzlePhoto *>*photos;

/**
 显示照片

 @param photos 未经处理的原始数组（code 可能缺失），数组每项为 HKPuzzlePhoto

 */
- (void)updateWith:(NSArray <HKPuzzlePhoto *>*)photos;
@end
