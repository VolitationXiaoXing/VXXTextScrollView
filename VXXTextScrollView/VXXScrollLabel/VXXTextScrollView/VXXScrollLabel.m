//
//  VXXScrollLabel.m
//  VXXScrollLabel
//
//  Created by Volitation小星 on 16/10/17.
//  Copyright © 2016年 Volitation小星. All rights reserved.
//

#import "VXXScrollLabel.h"

@interface VXXScrollLabel ()

@property (assign,nonatomic) CGRect tmpFrame;

@property (strong,nonatomic) CADisplayLink* displayLink;

@property (assign,nonatomic) BOOL isLeft;

@property (assign,nonatomic) CGFloat speedPoint;

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
        _scrollLabel.textAlignment = self.textAlignment;
        self.textColor = [UIColor clearColor];
    }
    
    return _scrollLabel;
}

-(UILabel *)scrollLabel2{
    if (_scrollLabel2 == nil) {
        _scrollLabel2 = [UILabel new];
        _scrollLabel2.frame = self.bounds;
        _scrollLabel2.text = self.text;
        _scrollLabel2.textColor = self.textColor;
        _scrollLabel2.shadowColor = self.shadowColor;
        _scrollLabel2.font = self.font;
        _scrollLabel2.attributedText = self.attributedText;
        _scrollLabel2.textAlignment = self.textAlignment;
        self.textColor = [UIColor clearColor];
    }
    
    return _scrollLabel2;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    self.speedPoint = 0.2;
    self.margin = 10;
    self.scrollDirection = VXXScrollLabelDirectionComeAndBack;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.speedPoint = 0.2;
        self.margin = 10;
        self.scrollDirection = VXXScrollLabelDirectionComeAndBack;
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
        
        if (self.scrollDirection == VXXScrollLabelLeftDirection || self.scrollDirection == VXXScrollLabelRightDirection) {
            [self.scrollLabel2 sizeToFit];
        }
        
        self.layer.masksToBounds = YES;
        
        self.displayLink = [CADisplayLink  displayLinkWithTarget:self selector:@selector(displayLink:)];
        
        [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop]forMode:NSDefaultRunLoopMode];
        
        CGRect frame = self.scrollLabel.frame;
        
        frame.origin.y = (self.tmpFrame.size.height - frame.size.height) * 0.5;
        
        self.scrollLabel.frame = frame;
        
        if (self.scrollDirection == VXXScrollLabelLeftDirection || self.scrollDirection == VXXScrollLabelRightDirection) {
          
            
            
            
        }

    }
    
    self.frame = self.tmpFrame;
}


-(void)setText:(NSString *)text{
    
    [self.displayLink invalidate];
    self.displayLink = nil;
    
    [super setText:text];

    [self setNeedsDisplay];
    [self setNeedsLayout];
}




//往返滚动的方法
-(void)displayLink:(CADisplayLink*)displayLink{
    
    if (self.scrollDirection == VXXScrollLabelDirectionComeAndBack) {
        if (self.bounds.size.width - self.scrollLabel.bounds.size.width - self.margin > self.scrollLabel.frame.origin.x) {
            self.isLeft = NO;
        }
        
        if (self.scrollLabel.frame.origin.x >= self.margin) {
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
    
    
    if (self.scrollDirection == VXXScrollLabelLeftDirection) {
        
        
        
        
        
        
        
    }
}

-(void)setSpeed:(float)speed{
    _speed = speed;
    self.speedPoint = 0.2 * speed;
}

@end
