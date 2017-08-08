//
//  HKPuzzleChildController.h
//  HKPuzzleExperiment
//
//  Created by hukaiyin on 2017/8/6.
//  Copyright © 2017年 hky. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HKPuzzleConfiger.h"

@class HKPuzzlePhoto, HKPuzzleChildController;

@protocol HKPuzzleChildControllerDelegate <NSObject>

@required
- (NSArray <HKPuzzlePhoto *>*)refreshPuzzlePieceAt:(NSUInteger)index inController:(HKPuzzleChildController *)puzzleController;

@end

#import "HKViewController.h"

@interface HKPuzzleChildController : HKViewController

@property (nonatomic, assign, readonly) PuzzleViewType type;
@property (nonatomic, strong, setter=updateWith:) NSArray <HKPuzzlePhoto *>*photos;

@property (nonatomic, weak) id <HKPuzzleChildControllerDelegate> puzzleCtlDelegate;

- (instancetype)initWithType:(PuzzleViewType)type photos:(NSArray <HKPuzzlePhoto *>*)photos contentFrame:(CGRect)frame;

@end
