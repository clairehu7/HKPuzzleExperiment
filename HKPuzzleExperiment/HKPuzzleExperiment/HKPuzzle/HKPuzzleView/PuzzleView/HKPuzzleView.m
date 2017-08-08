//
//  HKPuzzleView.m
//  HKPuzzleExperiment
//
//  Created by hukaiyin on 2017/8/6.
//  Copyright © 2017年 hky. All rights reserved.
//

#import "HKPuzzleView.h"

@interface HKPuzzleView()

@end

@implementation HKPuzzleView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}

- (void)updateWith:(NSArray<HKPuzzlePhoto *> *)photos {
    if (!self.photos.count) {
        return;
    }

    //传入照片数与需要的照片数相等时直接赋值返回
    if (self.photos.count == photos.count) {
        _photos = photos;
        return;
    }

    //传入的照片数与需要的照片数不等时，按 code 替换占位照片
    NSMutableArray *models = self.photos.mutableCopy;

    for (HKPuzzlePhoto *photo in photos) {
        if (photo.code >= models.count) {
            continue;
        }
        [models replaceObjectAtIndex:photo.code withObject:photo];
    }

    _photos = models.copy;
}

- (void)photoTUI:(UIButton *)sender {

    if (sender.tag >= self.photos.count) {
        return;
    }

    if ([self.puzzleDelegate respondsToSelector:@selector(refreshPuzzlePieceAt:)]) {
        [self.puzzleDelegate refreshPuzzlePieceAt:sender.tag];
    }
}

@end
