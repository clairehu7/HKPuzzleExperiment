//
//  HKParentController.m
//  HKPuzzleExperiment
//
//  Created by hukaiyin on 2017/8/6.
//  Copyright © 2017年 hky. All rights reserved.
//

#import "HKParentController.h"

static NSInteger baseChildVCTag = 100;

@interface HKParentController ()

@property (nonatomic, strong) NSArray <UIViewController *>*vcs;
@property (nonatomic, strong) UIViewController  *firstVC;
@property (nonatomic, strong) UIViewController  *currentVC;
@property (nonatomic, assign) NSUInteger        currnetIndex;
@property (nonatomic, strong) UIView            *contentView;

@end

@implementation HKParentController

- (void)loadWithVcs:(NSArray<UIViewController *> *)vcs childFrame:(CGRect)frame {
    _contentView = [[UIView alloc]initWithFrame:frame];
    [self.view addSubview:_contentView];

    self.vcs = vcs;
}

- (void)setVcs:(NSArray<UIViewController *> *)vcs {
    _vcs = vcs;
    for (UIViewController *vc in self.childViewControllers) {
        [vc removeFromParentViewController];
    }
    for (int i = 0; i < vcs.count; i ++) {
        UIViewController *vc = vcs[i];
        vc.view.tag = baseChildVCTag + i;
        [self addChildViewController:vc];
        if (i == 0) {
            self.firstVC = vc;
        }
    }
    [self baseInit];
}

- (void)setFirstVC:(UIViewController *)firstVC {
    _firstVC = firstVC;
    //调整子视图控制器的Frame已适应容器View
    [self resetChildVC:_firstVC];
    //设置默认显示在容器View的内容
    for (UIView *view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    [self.contentView addSubview:_firstVC.view];
}

- (void)loadGesture {

    UISwipeGestureRecognizer *leftSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(goRight)];
    UISwipeGestureRecognizer *rightSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(goLeft)];

    leftSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    rightSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionRight;

    [self.view addGestureRecognizer:leftSwipeGestureRecognizer];
    [self.view addGestureRecognizer:rightSwipeGestureRecognizer];
}

- (void)goLeft {
    if (self.currnetIndex <= 0) {
        return;
    }
    [self turnInindex:self.currnetIndex - 1];
}

- (void)goRight {
    if (self.currnetIndex >= (self.vcs.count - 1)) {
        return;
    }
    [self turnInindex:self.currnetIndex + 1];
}

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)baseInit {
    [self loadGesture];

    [self loadChildViewControllers];
    [self loadSubViews];
}

#pragma mark - load

- (void)loadSubViews {
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)loadChildViewControllers {
    self.currentVC = self.firstVC;
}

#pragma mark - ChildVC

- (void)resetChildVC:(UIViewController *)childViewController {

    CGRect frame = self.contentView.bounds;
    childViewController.view.frame = frame;
}

- (void)transitionFromOldViewController:(UIViewController *)oldVC
                    toNewViewController:(UIViewController *)newVC {
    if (oldVC == newVC) {
        return;
    }
    int widthScale = (oldVC.view.tag < newVC.view.tag)?1:-1;

    newVC.view.frame = CGRectMake(widthScale * self.contentView.frame.size.width, newVC.view.frame.origin.y, newVC.view.frame.size.width, newVC.view.frame.size.height);

    [self transitionFromViewController:oldVC
                      toViewController:newVC
                              duration:0.3
                               options:UIViewAnimationOptionTransitionNone
                            animations:^
     {
         [self resetChildVC:newVC];
     }
                            completion:^(BOOL finished)
     {
         if (finished) {
             [newVC didMoveToParentViewController:self];
             _currentVC = newVC;
         }else{
             _currentVC = oldVC;
         }
     }];
}

#pragma mark - Public

- (void)turnInindex:(NSUInteger)index {
    self.currnetIndex = index;
    [self transitionFromOldViewController:_currentVC
                      toNewViewController:self.vcs[index]];
}

@end
