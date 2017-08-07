//
//  HKMarco.h
//  HKBaseDemo
//
//  Created by hukaiyin on 16/7/31.
//  Copyright © 2016年 hukaiyin. All rights reserved.
//

#ifndef HKMarco_h
#define HKMarco_h

#import "UIView+HKExtension.h"
#import "UIColor+HKExtends.h"

#pragma mark -

//weak self
#define __weakSelf __weak typeof(self) weakSelf = self;
//strong self
#define __strongSelf __strong typeof(self) strongSelf = weakSelf;

#pragma mark - Frame

#define kScWidth [UIScreen mainScreen].bounds.size.width
#define kScHeight [UIScreen mainScreen].bounds.size.height

#define kViewHeight [UIScreen mainScreen].bounds.size.height - 64

#define HKLog(format, ...) NSLog(format, ## __VA_ARGS__)
#define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

#endif
