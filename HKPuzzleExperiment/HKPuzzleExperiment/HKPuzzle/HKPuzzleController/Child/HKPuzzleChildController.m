//
//  HKPuzzleChildController.m
//  HKPuzzleExperiment
//
//  Created by hukaiyin on 2017/8/6.
//  Copyright © 2017年 hky. All rights reserved.
//

#import "HKPuzzleChildController.h"
#import "HKPuzzleViewFactory.h"

@interface HKPuzzleChildController () <HKPuzzleViewDelegate>
@property (nonatomic, assign, readwrite) PuzzleViewType type;
@property (nonatomic, strong) HKPuzzleView *puzzleView;
@end

@implementation HKPuzzleChildController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (instancetype)initWithType:(PuzzleViewType)type photos:(NSArray<HKPuzzlePhoto *> *)photos contentFrame:(CGRect)frame {
    self = [super init];
    if (self) {
        self.type = type;
        _puzzleView = [HKPuzzleViewFactory createViewWith:type frame:frame canEdit:YES];
        _puzzleView.puzzleDelegate = self;
        [self.view addSubview:_puzzleView];

        [self updateWith:photos];
    }
    return self;
}

#pragma mark - PuzzleView

- (void)updateWith:(NSArray<HKPuzzlePhoto *> *)photos {
    [self.puzzleView updateWith:photos];
}

#pragma mark - HKPuzzleViewDelegate

- (NSArray<HKPuzzlePhoto *> *)refreshPuzzlePieceAt:(NSUInteger)index {
    if ([self.puzzleCtlDelegate respondsToSelector:@selector(refreshPuzzlePieceAt:inController:)]) {
        NSArray *photos = [self.puzzleCtlDelegate refreshPuzzlePieceAt:index inController:self];
        return photos;
    }
    return nil;
}

@end
