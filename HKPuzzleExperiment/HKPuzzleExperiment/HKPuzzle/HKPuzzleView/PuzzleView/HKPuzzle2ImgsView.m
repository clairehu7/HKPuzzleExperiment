//
//  HKPuzzle2ImgsView.m
//  HKPuzzleExperiment
//
//  Created by hukaiyin on 2017/8/6.
//  Copyright © 2017年 hky. All rights reserved.
//

#import "HKPuzzle2ImgsView.h"

static NSUInteger pieceCount = 2;
@interface HKPuzzle2ImgsView ()
@property (nonatomic, strong) UIImageView *imgView0;
@property (nonatomic, strong) UIImageView *imgView1;
@end

@implementation HKPuzzle2ImgsView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
        [self loadPhotos];
    }
    return self;
}

- (void)commonInit {
    _imgView0 = [UIImageView new];
    [self addSubview:_imgView0];

    _imgView1 = [UIImageView new];
    [self addSubview:_imgView1];
}

- (void)updateWith:(NSArray<HKPuzzlePhoto *> *)photos {
    [super updateWith:photos];
}

- (void)loadPhotos {

    NSMutableArray *models = [NSMutableArray array];
    for (int i = 0; i < pieceCount; i++) {
        HKPuzzlePhoto *replacePhoto = [HKPuzzlePhoto new];
        replacePhoto.code = i;
        [models addObject:replacePhoto];
        [self loadPhotoFrameOf:i];
    }

    self.photos = models.copy;
}

- (void)loadPhotoFrameOf:(NSUInteger)code {
    CGRect frame = CGRectZero;
    CGFloat width = self.frame.size.width;
    CGSize size = CGSizeMake(width, width/690*380);
    CGFloat ySpace = 15;
    switch (code) {
        case 0: {
            frame = CGRectMake(0, 0, size.width, size.height);
            _imgView0.frame = frame;
            break;
        }
        case 1: {
            frame = CGRectMake(0, size.height + ySpace, size.width, size.height);
            _imgView1.frame = frame;
            break;
        }
    }
}

@end
