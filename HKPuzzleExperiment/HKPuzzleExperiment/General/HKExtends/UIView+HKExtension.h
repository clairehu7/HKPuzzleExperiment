
#import <UIKit/UIKit.h>

@interface UIView (HKExtension)

// 分类使用这个只会创建属性和方法声明，不会创建方法的实现和 _成员变量；
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign, readonly) CGFloat x_max;
@property (nonatomic, assign, readonly) CGFloat y_max;
@property (nonatomic, assign) CGSize size;

/** 将视图进行截图 */
- (UIImage *)convertViewToImage;

//虚线
- (void)addDottedLine;

//添加模糊效果
- (void)addBlur;

@end

@interface CALayer (Extension)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign, readonly) CGFloat x_max;
@property (nonatomic, assign, readonly) CGFloat y_max;
@property (nonatomic, assign) CGSize size;


@end
