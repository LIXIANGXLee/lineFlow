//
//  LXLineFlowLayout.m
//  LXChat
//
//  Created by budgetoutsource on 2016/12/26.
//  Copyright © 2016年 budgetoutsource. All rights reserved.
//

#import "LXLineFlowLayout.h"
#import "LXFitScaling.h"

@implementation LXLineFlowLayout

+ (instancetype)sharedLineFlowLayout{
    static LXLineFlowLayout *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[LXLineFlowLayout alloc] init];
    });
    return instance;
}

- (void)prepareLayout{
    [super prepareLayout];
    /*
        水平滚动
    */
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.itemSize = CGSizeMake(_ItemW?_ItemW:LXFitscalingWidth(260), _ItemH?_ItemH:LXFitscalingHeight(300));

     /*
        设置内边距
      */
    CGFloat inset = (self.collectionView.frame.size.width - self.itemSize.width) * 0.5;
    self.sectionInset = UIEdgeInsetsMake(0, inset, 0, inset);
    /*
        最小间距
     */
    self.minimumLineSpacing = _minimumLine?_minimumLine : 0.01;
    self.minimumInteritemSpacing  = _minimumInter?_minimumInter : 0.01;
}

-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {

    NSArray *attsArray = [super layoutAttributesForElementsInRect:rect];
    CGFloat centerX = self.collectionView.frame.size.width / 2 + self.collectionView.contentOffset.x;
    for (UICollectionViewLayoutAttributes *atts in attsArray) {
        CGFloat space = ABS(atts.center.x - centerX);
        CGFloat scale = 1 - (space/self.collectionView.frame.size.width)*0.15;
        atts.transform = CGAffineTransformMakeScale(scale, scale);
        
    }
    return attsArray;
}

-(CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    
    CGRect rect;
    rect.origin.y = 0;
    rect.origin.x = proposedContentOffset.x;
    rect.size = self.collectionView.frame.size;
    
    NSArray *attsArray = [super layoutAttributesForElementsInRect:rect];
    CGFloat centerX = proposedContentOffset.x + self.collectionView.frame.size.width / 2;
    CGFloat minSpace = MAXFLOAT;
    for (UICollectionViewLayoutAttributes *attrs in attsArray) {
        if (ABS(minSpace) > ABS(attrs.center.x - centerX)) {
            minSpace = attrs.center.x - centerX;
        }
    }
    proposedContentOffset.x += minSpace;
    return proposedContentOffset;
}

@end
