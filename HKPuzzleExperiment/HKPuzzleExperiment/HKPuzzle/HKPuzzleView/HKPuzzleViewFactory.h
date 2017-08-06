//
//  HKPuzzleViewFactory.h
//  HKPuzzleExperiment
//
//  Created by hukaiyin on 2017/8/6.
//  Copyright © 2017年 hky. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HKPuzzleView.h"

typedef NS_ENUM(NSUInteger,PuzzleViewType) {
    PuzzleViewType2Imgs = 20,
    PuzzleViewType4ImgsNormal = 40,
    PuzzleViewType4ImgsOne = 41,
    PuzzleViewType6Imgs = 60,
    PuzzleViewType8Imgs = 80,
};

@interface HKPuzzleViewFactory : NSObject

- (HKPuzzleView *)createViewWith:(PuzzleViewType)type
                           frame:(CGRect)frame
                         canEdit:(BOOL)canEdit;

@end
