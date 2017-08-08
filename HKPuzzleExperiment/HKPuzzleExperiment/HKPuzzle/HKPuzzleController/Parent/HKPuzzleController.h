//
//  HKPuzzleController.h
//  HKPuzzleExperiment
//
//  Created by hukaiyin on 2017/8/6.
//  Copyright © 2017年 hky. All rights reserved.
//

#import "HKParentController.h"

#import "HKPuzzlePhoto.h"

@interface HKPuzzleController : HKParentController



/**
 需要显示的数据内容

 @param dic 格式：
 */
- (void)loadPhotosDic:(NSDictionary *)dic;

/**
 子类需要重写的方法，需确认 ChildController 的共用区域
 */
- (CGRect)childFrame;
@end
