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

@property (strong,nonatomic) CADisplayLink* displayLink;

@property (assign,nonatomic) BOOL isLeft;

@end


@implementation VXXScrollLabel

-(UILabel *)scrollLabel{
    if (_scrollLabel == nil) {
        _scrollLabel = [UILabel new];
        _scrollLabel.frame = self.bounds;
        _scrollLabel.text = self.text;
        _scrollLabel.textColor = self.textColor;
        _scrollLabel.shadowColor = self.shadowColor;
        _scrollLabel.font = self.font;
        _scrollLabel.attributedText = self.attributedText;
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
        
        [self.scrollLabel sizeToFit];
        
        self.layer.masksToBounds = YES;
        
        self.displayLink = [CADisplayLink  displayLinkWithTarget:self selector:@selector(displayLink:)];
        
        [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop]forMode:NSDefaultRunLoopMode];
        
    }
    
    self.frame = self.tmpFrame;
}

-(void)displayLink:(CADisplayLink*)displayLink{
    
    if (self.bounds.size.width - self.scrollLabel.bounds.size.width - 10 > self.scrollLabel.frame.origin.x) {
        self.isLeft = NO;
    }
    
    if (self.scrollLabel.frame.origin.x >= 10) {
        self.isLeft = YES;
    }
    
    if (self.isLeft) {
        
        CGRect frame = self.scrollLabel.frame;
        
        frame.origin.x = frame.origin.x - 0.2;
        
        self.scrollLabel.frame = frame;
        
        
    }else{
        
        CGRect frame = self.scrollLabel.frame;
        
        frame.origin.x = frame.origin.x + 0.2;
        
        self.scrollLabel.frame = frame;
    }
    
}

@end
