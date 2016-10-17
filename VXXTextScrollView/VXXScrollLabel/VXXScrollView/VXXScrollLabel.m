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

//
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
        self.textColor = [UIColor clearColor];
    }
    
    return _scrollLabel;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    self.speedPoint = 0.2;
    self.margin = 10;
    self.scrollDirection = VXXScrollLabelLeftDirectionComeAndBack;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.speedPoint = 0.2;
        self.margin = 10;
        self.scrollDirection = VXXScrollLabelLeftDirectionComeAndBack;
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


-(void)setText:(NSString *)text{
    
    [self.displayLink invalidate];
    self.displayLink = nil;
    
    [super setText:text];

    [self setNeedsDisplay];
    [self setNeedsLayout];
}

-(void)displayLink:(CADisplayLink*)displayLink{
    
    if (self.scrollDirection == VXXScrollLabelLeftDirectionComeAndBack) {
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
}

-(void)setSpeed:(float)speed{
    _speed = speed;
    self.speedPoint = 0.2 * speed;
}

@end
