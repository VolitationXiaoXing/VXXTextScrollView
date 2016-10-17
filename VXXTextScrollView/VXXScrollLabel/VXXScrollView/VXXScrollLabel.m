//
//  VXXScrollLabel.m
//  VXXScrollLabel
//
//  Created by Volitation小星 on 16/10/17.
//  Copyright © 2016年 Volitation小星. All rights reserved.
//

#import "VXXScrollLabel.h"

@interface VXXScrollLabel ()

//当文字不够长的时候滚动的Label
@property (strong,nonatomic) UILabel* scrollLabel;

@end


@implementation VXXScrollLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}


-(void)layoutSubviews{
    [super layoutSubviews];
}

@end
