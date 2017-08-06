//
//  HKPuzzleBtn.m
//  HKPuzzleExperiment
//
//  Created by hukaiyin on 2017/8/6.
//  Copyright © 2017年 hky. All rights reserved.
//

#import "HKPuzzleBtn.h"

@interface HKPuzzleBtn()
@property (nonatomic, assign) PuzzleViewType type;
@property (nonatomic, strong) UILabel *promptLabel;
@property (nonatomic, strong) UIImageView *imgView;
@end

@implementation HKPuzzleBtn

#pragma mark - Life Cycle

- (instancetype)initWithFrame:(CGRect)frame type:(PuzzleViewType)type {
    self = [super initWithFrame:frame];
    if (self) {
        self.type = type;
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    NSString *imgName = [self imgNameWithType:self.type];
    self.imgView.image = [UIImage imageNamed:imgName];
    self.promptLabel.text = [self promptWithType:self.type];
}

- (NSString *)imgNameWithType:(PuzzleViewType)type {
    NSString *name = @"";
    //TODO:图片图片
    //puzzBtn20 puzzBtn40 puzzBtn41 puzzBtn60 puzzBtn80
    NSString *str = [NSString stringWithFormat:@"%@",@(type)];
    name = [@"puzzBtn" stringByAppendingString:str];
    return name;
}

- (NSString *)promptWithType:(PuzzleViewType)type {
    NSString *string = @"";
    switch (type) {
        case PuzzleViewType2Imgs: {
            string = @"2 图";
            break;
        }
        case PuzzleViewType4ImgsNormal: {
            string = @"4 图";
            break;
        }
        case PuzzleViewType4ImgsOne: {
            string = @"4 图";
            break;
        }
        case PuzzleViewType6Imgs: {
            string = @"6 图";
            break;
        }
        case PuzzleViewType8Imgs: {
            string = @"8 图";
            break;
        }
    }
    return string;
}

#pragma mark - Setters & Getters

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    NSString *imgName = [self imgNameWithType:self.type];
    if (!selected) {
        self.layer.borderWidth = 0;
        self.layer.masksToBounds = YES;
    } else {
        [imgName stringByAppendingString:@"_selected"];
        self.layer.borderColor = [UIColor blueColor].CGColor;
        self.layer.borderWidth = 2;
        self.layer.masksToBounds = YES;
    }
    self.imgView.image = [UIImage imageNamed:imgName];
}

- (UIImageView *)imgView {
    if (!_imgView) {
        CGFloat width = self.frame.size.width;
        _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, width, width /80 * 120)];
        _imgView.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:_imgView];
    }
    return _imgView;
}

- (UILabel *)promptLabel {
    if (!_promptLabel) {
        CGFloat height = 20;
        _promptLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.frame.size.height - height, self.frame.size.width, height)];
        [self addSubview:_promptLabel];
    }
    return _promptLabel;
}

@end
