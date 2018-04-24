//
//  LXFitScaling.h
//  LXFramework
//
//  Created by 恒悦科技 on 2018/1/9.
//  Copyright © 2018年 李响. All rights reserved.
//

#import <UIKit/UIKit.h>

#define LXFitscalingX(x) [[LXFitScaling sharedScaling] fittedX:x]
#define LXFitscalingY(x) [[LXFitScaling sharedScaling] fittedY:x]

#define LXFitscalingWidth(x) [[LXFitScaling sharedScaling] fittedWidth:x]

#define LXFitscalingHeight(x) [[LXFitScaling sharedScaling] fittedHeight:x]

/**
 *  屏幕等比例缩放适配
 */
@interface LXFitScaling : NSObject
/**
 *  等比例缩放单例
 *
 *  @return 等比例缩放用的单例
 */
+ (instancetype)sharedScaling;

/**
 *  计算适配后的屏幕X坐标
 *
 *  @param x X坐标
 *
 *  @return 适配后的X坐标
 */
- (CGFloat)fittedX:(CGFloat)x;

/**
 *  计算适配后的屏幕Y坐标
 *
 *  @param y Y坐标
 *
 *  @return 适配后的Y坐标
 */
- (CGFloat)fittedY:(CGFloat)y;

/**
 *  计算适配后的宽度
 *
 *  @param width 宽度
 *
 *  @return 适配后的宽度
 */
- (CGFloat)fittedWidth:(CGFloat)width;

/**
 *  计算适配后的高度
 *
 *  @param height 高度
 *
 *  @return 适配后的高度
 */
- (CGFloat)fittedHeight:(CGFloat)height;

@end
