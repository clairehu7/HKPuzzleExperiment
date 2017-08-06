//
//  HKPuzzleViewFactory.m
//  HKPuzzleExperiment
//
//  Created by hukaiyin on 2017/8/6.
//  Copyright © 2017年 hky. All rights reserved.
//


#import "HKPuzzle2ImgsView.h"
#import "HKPuzzle4Imgs1View.h"
#import "HKPuzzle4Imgs2View.h"
#import "HKPuzzle6ImgsView.h"
#import "HKPuzzle8ImgsView.h"

#import "HKPuzzleViewFactory.h"

@implementation HKPuzzleViewFactory

+ (HKPuzzleView *)createViewWith:(PuzzleViewType)type frame:(CGRect)frame canEdit:(BOOL)canEdit{
    HKPuzzleView *view;
    switch (type) {
        case PuzzleViewType2Imgs: {
            view = [[HKPuzzle2ImgsView alloc]initWithFrame:frame];
            break;
        }
        case PuzzleViewType4ImgsNormal: {
            view = [[HKPuzzle4Imgs1View alloc]initWithFrame:frame];
            break;
        }
        case PuzzleViewType4ImgsOne: {
            view = [[HKPuzzle4Imgs2View alloc]initWithFrame:frame];
            break;
        }
        case PuzzleViewType6Imgs: {
            view = [[HKPuzzle6ImgsView alloc]initWithFrame:frame];
            break;
        }
        case PuzzleViewType8Imgs: {
            view = [[HKPuzzle8ImgsView alloc]initWithFrame:frame];
            break;
        }
    }

    view.canEdit = canEdit;
    return view;
}
@end
