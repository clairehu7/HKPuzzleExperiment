//
//  HKNavigationController.m
//  HKBaseNavigationDemo
//
//  Created by hukaiyin on 16/6/26.
//  Copyright © 2016年 hukaiyin. All rights reserved.
//

#import "HKNavigationController.h"

#import "UINavigationController+HKExtends.h"
#import "UIBarButtonItem+HKExtends.h"
#import "UIImage+HKExtends.h"
#import "HKViewController.h"

@interface HKNavigationController ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>
@end

@implementation HKNavigationController

#pragma mark - Life Cycle
- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    return [self initWithRootViewController:rootViewController
                           withBarTintColor:[UIColor colorWithRed:255/255. green:255/255. blue:255/255. alpha:1]
                                  tintColor:[UIColor blackColor]
                                  barHidden:NO];
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController withBarTintColor:(UIColor *)bgColor tintColor:(UIColor *)tintColor barHidden:(BOOL)flag {
    if (self = [super initWithRootViewController:rootViewController]) {
        self.delegate = self;

        UIImage *colorImage = [UIImage imageWithColor:[UIColor clearColor] size:CGSizeMake(self.view.frame.size.width, 0.5)];
        [self.navigationBar setBackgroundImage:colorImage forBarMetrics:UIBarMetricsDefault];

//        UIImage *shadowImage = [[UIImage alloc]init];
        [self updateBarWithTranslucent:NO
                          barTintColor:bgColor
                             tintColor:tintColor
                           shadowImage:nil];

        if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
            self.interactivePopGestureRecognizer.enabled = YES;
            self.interactivePopGestureRecognizer.delegate = self;
        }
        self.navigationBarHidden = flag;

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated. publish
}

#pragma mark - UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [self loadLeftBarBtnItemInVC:viewController];
}

//default
- (void)loadLeftBarBtnItemInVC:(UIViewController *)viewController {
    if (viewController.navigationItem.leftBarButtonItem) {
        return;
    }
    if (self.viewControllers[0] == viewController) {
        return;
    } else {
        id target = self;
        SEL backSel = @selector(backTUI:);
        UIImage *leftBarImage = [[UIImage imageNamed:@"icon_back"] imageWithTintColor:[UIColor colorWithRed:51/255. green:51/255. blue:51/255. alpha:1] blendMode:kCGBlendModeDestinationIn];
        if ([viewController respondsToSelector:@selector(backTUI:)]) {
            backSel = @selector(backTUI:);
            target = viewController;
        }
        
        viewController.navigationItem.leftBarButtonItem =
        [UIBarButtonItem barItemWithTarget:target
                                    action:backSel
                          forControlEvents:UIControlEventTouchUpInside
                                       img:leftBarImage];
    }
}

-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

#pragma mark - Private Methods
- (void)backTUI:(UIButton *)sender {
    [self popViewControllerAnimated:YES];
}

@end
