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
        _scrollLabel2.frame = _scrollLabel.bounds;
        _scrollLabel2.text = _scrollLabel.text;
        _scrollLabel2.textColor = _scrollLabel.textColor;
        _scrollLabel2.shadowColor = _scrollLabel.shadowColor;
        _scrollLabel2.font = _scrollLabel.font;
        _scrollLabel2.attributedText = _scrollLabel.attributedText;
        _scrollLabel2.textAlignment = _scrollLabel.textAlignment;
        self.textColor = [UIColor clearColor];
    }
    
    return _scrollLabel2;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    self.speedPoint = 0.2;
    self.margin = 10;
    self.scrollDirection = VXXScrollLabelLeftDirection;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.speedPoint = 0.2;
        self.margin = 10;
        self.scrollDirection = VXXScrollLabelLeftDirection;
    }
    return self;
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.tmpFrame = self.frame;
    
    CGSize size = [self.text sizeWithAttributes:@{NSFontAttributeName:self.font}];
    
    //需要滚动
    if(size.width > self.tmpFrame.size.width){
        
        [self addSubview:self.scrollLabel];
        
        [self.scrollLabel sizeToFit];
        
        if (self.scrollDirection == VXXScrollLabelLeftDirection || self.scrollDirection == VXXScrollLabelRightDirection) {
            [self.scrollLabel2 sizeToFit];
            [self addSubview:self.scrollLabel2];
        }
        
        self.layer.masksToBounds = YES;
        
        if (self.displayLink == nil) {
            
            self.displayLink = [CADisplayLink  displayLinkWithTarget:self selector:@selector(displayLink:)];
            
            [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop]forMode:NSDefaultRunLoopMode];
            
            CGRect frame = self.scrollLabel.frame;
            
            frame.origin.y = (self.tmpFrame.size.height - frame.size.height) * 0.5;
            
            self.scrollLabel.frame = frame;
            
            if (self.scrollDirection == VXXScrollLabelLeftDirection || self.scrollDirection == VXXScrollLabelRightDirection) {
                
                CGRect fame2 = frame;
                
                fame2.origin.x = frame.origin.x + frame.size.width + self.margin;
                
                self.scrollLabel2.frame = fame2;
            }
            
        }

            
    }

}


-(void)setText:(NSString *)text{
    
    [self.displayLink invalidate];
    self.displayLink = nil;
    
    [super setText:text];

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
    
    if (self.scrollDirection == VXXScrollLabelLeftDirection || self.scrollDirection == VXXScrollLabelRightDirection) {
        
        CGRect frame = self.scrollLabel.frame;
        
        if (self.scrollDirection == VXXScrollLabelLeftDirection) {
                frame.origin.x = frame.origin.x - 0.2;
        }else{
                frame.origin.x = frame.origin.x + 0.2;
        }
        
        
        self.scrollLabel.frame = frame;
        
        CGRect frame1 = self.scrollLabel2.frame;
        
        if (self.scrollDirection == VXXScrollLabelLeftDirection) {
              frame1.origin.x = frame1.origin.x - 0.2;
        }else{
              frame1.origin.x = frame1.origin.x + 0.2;
        }
        
        self.scrollLabel2.frame = frame1;
        
        //判读label位置是否需要重置
        if([self judgeLocation:self.scrollLabel]){
            
            if (self.scrollDirection == VXXScrollLabelLeftDirection) {
                CGRect frame = self.scrollLabel.frame;
                
                frame.origin.x = self.scrollLabel2.frame.origin.x + self.scrollLabel2.frame.size.width + self.margin;
                
                self.scrollLabel.frame = frame;
            }else{
            
                CGRect frame = self.scrollLabel.frame;
                frame.origin.x = self.scrollLabel2.frame.origin.x - self.margin - self.scrollLabel.frame.size.width;
                self.scrollLabel.frame = frame;
                
            }
        };
        
        if([self judgeLocation:self.scrollLabel2]){
            if (self.scrollDirection == VXXScrollLabelLeftDirection) {

            CGRect frame = self.scrollLabel2.frame;
            
            frame.origin.x = self.scrollLabel.frame.origin.x + self.scrollLabel.frame.size.width + self.margin;
                self.scrollLabel2.frame = frame;
            }else{
                
            CGRect frame = self.scrollLabel2.frame;
                
                frame.origin.x = self.scrollLabel.frame.origin.x - self.margin - self.scrollLabel2.frame.size.width;
            self.scrollLabel2.frame = frame;
            
            }
            
        };
        
    }
    
    
    
}

-(BOOL)judgeLocation:(UILabel*)label{
    
    if (self.scrollDirection == VXXScrollLabelLeftDirection) {
        if((label.frame.origin.x + label.frame.size.width) < 0){
            return YES;
        }
    }else{
        if(label.frame.origin.x > self.frame.size.width){
            return YES;
        }
    }
    
    return NO;
}

-(void)setScrollDirection:(VXXScrollLabelDirection)scrollDirection{
    _scrollDirection = scrollDirection;
    [self.displayLink invalidate];
    self.displayLink = nil;
    
    [self setNeedsLayout];
    [self setNeedsDisplay];
    
    if (scrollDirection == VXXScrollLabelDirectionComeAndBack) {
        [_scrollLabel2 removeFromSuperview];
        _scrollLabel2 = nil;
    }
}

-(void)setSpeed:(float)speed{
    _speed = speed;
    self.speedPoint = 0.2 * speed;
}

@end
