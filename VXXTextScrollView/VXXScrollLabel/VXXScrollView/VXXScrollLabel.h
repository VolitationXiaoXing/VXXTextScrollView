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

@property (assign,nonatomic) float speed;

@property (assign,nonatomic) VXXScrollLabelDirection scrollDirection;

@end
