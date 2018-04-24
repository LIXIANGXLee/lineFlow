//
//  LXLineFlowLayout.h
//  LXChat
//
//  Created by budgetoutsource on 2016/12/26.
//  Copyright © 2016年 budgetoutsource. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXLineFlowLayout : UICollectionViewFlowLayout
/*
   single设计模式
 */
+ (instancetype)sharedLineFlowLayout;

/*
  布局item 的宽
 */
@property(nonatomic,assign)CGFloat ItemW;

/*
  布局item 的高
 */
@property(nonatomic,assign)CGFloat ItemH;

/*
  布局item 垂直方向间距（竖）
 */
@property(nonatomic,assign)CGFloat minimumLine;

/*
 布局item 水平方向间距（横）
 */
@property(nonatomic,assign)CGFloat minimumInter;

@end
