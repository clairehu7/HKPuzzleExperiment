//
//  HKPuzzleView.h
//  HKPuzzleExperiment
//
//  Created by hukaiyin on 2017/8/6.
//  Copyright © 2017年 hky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HKPuzzleView : UIView

@property (nonatomic, assign) BOOL canEdit;
/**
 传入要显示的图片

 @param imgs 数组每项为图片地址
 */
- (void)updateWith:(NSArray <NSString *> *)imgs;

@end
