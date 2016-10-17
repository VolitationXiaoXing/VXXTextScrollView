//
//  VXXScrollButton.h
//  Discovery
//
//  Created by Volitation小星 on 16/10/12.
//  Copyright © 2016年 军鸽. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    VXXScrollLabelLeftDirection, //向左
    VXXScrollLabelRightDirection, //向右
    VXXScrollLabelLeftDirectionComeAndBack //往返
} VXXScrollLabelDirection;

@interface VXXScrollButton : UIButton

@property (assign,nonatomic) CGFloat margin;

//滚动方向，默认往返
@property (assign,nonatomic) VXXScrollLabelDirection scrollDirection;
//速度   0.2 * speed * 60 点
@property (assign,nonatomic) float speed;


@end
