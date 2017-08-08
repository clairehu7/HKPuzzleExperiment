//
//  HKPuzzle2ImgsView.m
//  HKPuzzleExperiment
//
//  Created by hukaiyin on 2017/8/6.
//  Copyright © 2017年 hky. All rights reserved.
//

#import "HKPuzzle2ImgsView.h"
#import "HKMarco.h"

#import <UIImageView+WebCache.h>

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
    _imgView0.contentMode = UIViewContentModeScaleAspectFill;
    _imgView0.backgroundColor = IMGPLACEHOLDERCOLOR;
    _imgView0.clipsToBounds = YES;
    [self addSubview:_imgView0];

    _imgView1 = [UIImageView new];
    _imgView1.contentMode = UIViewContentModeScaleAspectFill;
    _imgView1.clipsToBounds = YES;
    _imgView1.backgroundColor = IMGPLACEHOLDERCOLOR;

    [self addSubview:_imgView1];
}

- (void)updateWith:(NSArray<HKPuzzlePhoto *> *)photos {
    [super updateWith:photos];

    HKPuzzlePhoto *photo0 = [photos objectAtIndex:0];
    [_imgView0 sd_setImageWithURL:[NSURL URLWithString:photo0.url]];

    HKPuzzlePhoto *photo1 = [photos objectAtIndex:1];
    [_imgView1 sd_setImageWithURL:[NSURL URLWithString:photo1.url]];

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
    [self loadBtns];
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
            self.contentSize = CGSizeMake(size.width, _imgView1.y_max);
            break;
        }
    }
}

- (void)loadBtns{
    for (int code = 0; code < pieceCount; code++) {
        CGRect btnFrame = [self loadBtnOf:code];
        UIButton *btn0 = [[UIButton alloc]initWithFrame:btnFrame];
        btn0.tag = code;
        [btn0 addTarget:self action:@selector(photoTUI:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn0];
    }
}

- (CGRect)loadBtnOf:(NSUInteger)code {
    CGRect frame = CGRectZero;
    switch (code) {
        case 0: {
            frame = _imgView0.frame;
            break;
        }
        case 1: {
            frame = _imgView1.frame;
            break;
        }
    }
    return frame;
}

@end
