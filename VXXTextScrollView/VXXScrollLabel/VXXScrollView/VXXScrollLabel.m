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

@property (assign,nonatomic) CGRect tmpFrame;

@end


@implementation VXXScrollLabel

-(UILabel *)scrollLabel{
    if (_scrollLabel == nil) {
//        _scrollLabel = self.copy;
    }
    
    return _scrollLabel;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.tmpFrame = self.frame;
    
    [self sizeToFit];
    
    //需要滚动
    if(self.bounds.size.width > self.tmpFrame.size.width){
        
        [self addSubview:self.scrollLabel];
        
    }
    
    
    
    self.frame = self.tmpFrame;
}

@end
