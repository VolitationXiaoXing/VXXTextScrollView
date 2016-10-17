//
//  VXXScrollLabel.h
//  VXXScrollLabel
//
//  Created by Volitation小星 on 16/10/17.
//  Copyright © 2016年 Volitation小星. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    VXXScrollLabelLeftDirection, //向左
    VXXScrollLabelRightDirection, //向右
    VXXScrollLabelLeftDirectionComeAndBack //往返
} VXXScrollLabelDirection;

@interface VXXScrollLabel : UILabel

//速度   0.2 * speed * 60 点
@property (assign,nonatomic) float speed;
//滚动方向，默认往返
@property (assign,nonatomic) VXXScrollLabelDirection scrollDirection;
//往返滚动距离边界  默认10
@property (assign,nonatomic) CGFloat margin;

@end
