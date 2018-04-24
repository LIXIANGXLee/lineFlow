//
//  LXFitScaling.m
//  LXFramework
//
//  Created by 恒悦科技 on 2018/1/9.
//  Copyright © 2018年 李响. All rights reserved.
//

#import "LXFitScaling.h"

#define kBaseScreenWidth    414
#define kBaseScreenHeight   736
/**
 iphone8 宽与 x 相同。 所以适配x用iphone8的高度
 */
#define kXBaseScreenHeight 812.0
#define k8BaseScreenHeight 667.0
@interface LXFitScaling ()

@property (nonatomic) CGFloat m_fScaleX;
@property (nonatomic) CGFloat m_fScaleY;

@end
@implementation LXFitScaling
+ (instancetype)sharedScaling {
    
    static LXFitScaling *fitScaling = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        fitScaling = [[LXFitScaling alloc] init];
        if ([UIScreen mainScreen].bounds.size.width == kBaseScreenWidth) {
            fitScaling.m_fScaleX = 1.0f;
            fitScaling.m_fScaleY = 1.0f;
        } else {            
            fitScaling.m_fScaleX = [UIScreen mainScreen].bounds.size.width / kBaseScreenWidth;
            fitScaling.m_fScaleY =  (([UIScreen mainScreen].bounds.size.height == kXBaseScreenHeight) ? k8BaseScreenHeight:[UIScreen mainScreen].bounds.size.height) / kBaseScreenHeight;
        }
    });
    
    return fitScaling;
}

- (CGFloat)fittedX:(CGFloat)x {
    CGFloat fX = x * self.m_fScaleX;
    return fX;
}

- (CGFloat)fittedY:(CGFloat)y {
    CGFloat fY = y * self.m_fScaleY;
    return fY;
}

- (CGFloat)fittedWidth:(CGFloat)width {
    CGFloat fWidth = width * self.m_fScaleX;
    return fWidth;
}

- (CGFloat)fittedHeight:(CGFloat)height {
    CGFloat fHeight = height * self.m_fScaleY;
    return fHeight;
}

@end
