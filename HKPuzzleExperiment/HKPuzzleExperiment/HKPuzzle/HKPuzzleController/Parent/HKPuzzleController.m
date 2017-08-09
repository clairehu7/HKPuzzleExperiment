//
//  HKPuzzleController.m
//  HKPuzzleExperiment
//
//  Created by hukaiyin on 2017/8/6.
//  Copyright © 2017年 hky. All rights reserved.
//

#import "HKPuzzleChildController.h"

#import "HKPuzzleController.h"
#import "HKPuzzleConfiger.h"
#import "HKClipperHelper.h"
#import "HKMarco.h"

@interface HKPuzzleController ()<UIActionSheetDelegate,HKPuzzleChildControllerDelegate>
@property (nonatomic, strong) NSMutableDictionary *photosDic;
@end

@implementation HKPuzzleController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGRect)childFrame {
    CGRect frame = CGRectZero;
    return frame;
}

- (void)loadPhotosDic:(NSDictionary *)dic {
    CGRect childFrame = [self childFrame];
    
    CGRect childBounds = CGRectMake(0, 0, childFrame.size.width, childFrame.size.height);

    NSMutableArray *childVCs = [NSMutableArray array];

    for (NSString *key in [dic allKeys]) {
        //dic 的 key 对应了 相应的 PuzzleViewType 模版类型
        PuzzleViewType type = [key intValue];
        NSArray *photoDics = [dic objectForKey:key];
        
        NSArray *photos = [HKPuzzlePhoto arrayOfModelsFromDictionaries:photoDics error:nil].copy;
        HKPuzzleChildController *vc = [[HKPuzzleChildController alloc]initWithType:type photos:photos contentFrame:childBounds];
        vc.puzzleCtlDelegate = self;
        [childVCs addObject:vc];

        [self.photosDic setValue:photos forKey:key];
    }

    [self loadWithVcs:childVCs.copy childFrame:childFrame];
    [self turnTo:0];
}

#pragma mark - HKPuzzleChildControllerDelegate

- (void)refreshPuzzlePieceAt:(NSUInteger)index inController:(HKPuzzleChildController *)puzzleController {

    PuzzleViewType type = puzzleController.type;
    NSString *key = [NSString stringWithFormat:@"%@",@(type)];
    NSArray *photos = [self.photosDic objectForKey:key];
    HKPuzzlePhoto *photo = [photos objectAtIndex:index];

    __weak typeof(puzzleController) weakPuzzleCtl = puzzleController;

    //配置 clipper，裁剪完成后的图片处理
    
    [self configHelperWithNav:self.navigationController
                      imgSize:photo.photoSize
                   imgHandler:^(UIImage *img)
    {

        __strong typeof(puzzleController) strongPuzzleCtl = weakPuzzleCtl;

#warning 这里 url 是写死的，应该上传服务器得到 url
        //得到 img 后，上传服务器 获取 photo 的 url
        photo.url = @"https://ohwflolko.qnssl.com/FgupZTCDiKjcgs5Z41bAZ--lWVuX";
        photo.width = img.size.width;
        photo.height = img.size.height;

        NSMutableArray *newPhotos = photos.mutableCopy;
        [newPhotos setObject:photo atIndexedSubscript:index];

        [strongPuzzleCtl updateWith:newPhotos.copy];
    }];

    //起调 clipper 开始裁剪图片
    [HKClipperHelper shareManager].clipperType = ClipperTypeImgMove;
    [HKClipperHelper shareManager].systemEditing = NO;
    [HKClipperHelper shareManager].isSystemType = NO;
    [self takePhoto];
}

#pragma mark - HKClipperHelper

- (void)configHelperWithNav:(UINavigationController *)nav
                    imgSize:(CGSize)size
                 imgHandler:(void(^)(UIImage *img))handler {
    [HKClipperHelper shareManager].nav = nav;
    [HKClipperHelper shareManager].clippedImgSize = size;
    [HKClipperHelper shareManager].clippedImageHandler = handler;
}

#pragma mark - UIActionSheet

- (void)takePhoto {
    UIActionSheet *_sheet = [[UIActionSheet alloc] initWithTitle:nil
                                                        delegate:self
                                               cancelButtonTitle:@"取消"
                                          destructiveButtonTitle:nil
                                               otherButtonTitles:@"拍照", @"相机胶卷", nil];
    [_sheet showInView:[UIApplication sharedApplication].keyWindow];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    dispatch_after(0., dispatch_get_main_queue(), ^{
        if (buttonIndex == 0) {
            [[HKClipperHelper shareManager] photoWithSourceType:UIImagePickerControllerSourceTypeCamera];
        }
        else if(buttonIndex == 1) {
            [[HKClipperHelper shareManager] photoWithSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        }
    });
}

#pragma mark - Setters & Getters

- (NSMutableDictionary *)photosDic {
    if (!_photosDic) {
        _photosDic = [NSMutableDictionary dictionary];
    }
    return _photosDic;
}

@end
