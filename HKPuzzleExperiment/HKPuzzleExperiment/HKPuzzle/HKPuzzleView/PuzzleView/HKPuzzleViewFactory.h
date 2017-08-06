//
//  HKPuzzleViewFactory.h
//  HKPuzzleExperiment
//
//  Created by hukaiyin on 2017/8/6.
//  Copyright © 2017年 hky. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HKPuzzleConfiger.h"
#import "HKPuzzleView.h"



@interface HKPuzzleViewFactory : NSObject

+ (HKPuzzleView *)createViewWith:(PuzzleViewType)type
                           frame:(CGRect)frame
                         canEdit:(BOOL)canEdit;

@end
