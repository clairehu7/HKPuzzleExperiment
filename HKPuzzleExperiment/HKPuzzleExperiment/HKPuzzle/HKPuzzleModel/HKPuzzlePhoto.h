//
//  HKPuzzlePhoto.h
//  HKPuzzleExperiment
//
//  Created by hukaiyin on 2017/8/6.
//  Copyright © 2017年 hky. All rights reserved.
//

#import "HKBaseJSONModel.h"
#import <UIKit/UIKit.h>

@interface HKPuzzlePhoto : HKBaseJSONModel

@property (nonatomic, strong) NSString *url;
@property (nonatomic, assign) NSUInteger code;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize photoSize;

@property (nonatomic, strong) NSString *placeholderImgName;//本地用

@end
