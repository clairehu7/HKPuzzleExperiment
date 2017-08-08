//
//  HKPuzzleView.h
//  HKPuzzleExperiment
//
//  Created by hukaiyin on 2017/8/6.
//  Copyright © 2017年 hky. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HKPuzzlePhoto.h"

#define IMGPLACEHOLDERCOLOR [UIColor colorFromRGBHex:0xCCCCCC]

@class HKPuzzleView;
@protocol HKPuzzleViewDelegate <NSObject>

@required
- (void)refreshPuzzlePieceAt:(NSUInteger)index;

@end

@interface HKPuzzleView : UIScrollView

@property (nonatomic, assign) BOOL canEdit;
@property (nonatomic, strong) NSArray <HKPuzzlePhoto *>*photos;
@property (nonatomic, weak) id <HKPuzzleViewDelegate> puzzleDelegate;

/**
 显示照片

 @param photos 未经处理的原始数组（code 可能缺失），数组每项为 HKPuzzlePhoto

 */
- (void)updateWith:(NSArray <HKPuzzlePhoto *>*)photos;



/**
 子类 btn 绑定方法

 @param sender 传入的 btn.tag 要对应相应photo 的 code
 */
- (void)photoTUI:(UIButton *)sender;

@end
