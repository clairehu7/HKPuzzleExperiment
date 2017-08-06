//
//  HKPuzzlePhoto.h
//  HKPuzzleExperiment
//
//  Created by hukaiyin on 2017/8/6.
//  Copyright © 2017年 hky. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import <UIKit/UIKit.h>

#warning HKBaseJSONModel
@interface HKPuzzlePhoto : JSONModel

@property (nonatomic, strong) NSString *url;
@property (nonatomic, assign) NSUInteger code;

@property (nonatomic, strong) NSString *placeholderImgName;//本地用

@end
