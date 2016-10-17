//
//  VXXScrollButton.m
//  Discovery
//
//  Created by Volitation小星 on 16/10/12.
//  Copyright © 2016年 军鸽. All rights reserved.
//

#import "VXXScrollButton.h"

@interface VXXScrollButton ()

@property (assign,nonatomic) BOOL isLeft;

@property (strong,nonatomic) CADisplayLink* displayLink;

@property (assign,nonatomic) CGFloat speedPoint;

@end


@implementation VXXScrollButton


-(void)awakeFromNib{
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
        self.margin = 10;
        
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    [self.titleLabel sizeToFit];
    
    if (self.titleLabel.bounds.size.width > self.bounds.size.width && self.displayLink == nil) {
        self.layer.masksToBounds = YES;
        
        self.displayLink = [CADisplayLink  displayLinkWithTarget:self selector:@selector(displayLink:)];
        
        [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop]forMode:NSDefaultRunLoopMode];
        
    }

}


-(void)setTitle:(NSString *)title forState:(UIControlState)state{
    
    [self.displayLink invalidate];
    self.displayLink = nil;
    
    [super setTitle:title forState:state];
    
    
    [self setNeedsDisplay];
    [self setNeedsLayout];
}


-(void)displayLink:(CADisplayLink*)displayLink{
    
    if (self.scrollDirection == VXXScrollLabelLeftDirectionComeAndBack) {
        
        if (self.bounds.size.width - self.titleLabel.bounds.size.width - self.margin > self.titleLabel.frame.origin.x) {
            self.isLeft = NO;
        }
        
        if (self.titleLabel.frame.origin.x >= self.margin) {
            self.isLeft = YES;
        }
        
        if (self.isLeft) {
            
            CGRect frame = self.titleLabel.frame;
            
            frame.origin.x = frame.origin.x - 0.2;
            
            self.titleLabel.frame = frame;
            
            
        }else{
            
            CGRect frame = self.titleLabel.frame;
            
            frame.origin.x = frame.origin.x + 0.2;
            
            self.titleLabel.frame = frame;
        }
        return;
    }
    
    if (self.scrollDirection == VXXScrollLabelLeftDirection) {
        if(self.bounds.size.width - self.titleLabel.bounds.size.width - self.margin > self.titleLabel.){
            
        }
    }
    
    
}


@end
