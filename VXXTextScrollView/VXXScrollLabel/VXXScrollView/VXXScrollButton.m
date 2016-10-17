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

@end


@implementation VXXScrollButton


-(void)awakeFromNib{
    [super awakeFromNib];
    self.margin = 10;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.margin = 10;
        
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    [self.titleLabel sizeToFit];
    
    if (self.titleLabel.width > self.width&& self.displayLink == nil) {
        self.layer.masksToBounds = YES;
        
        self.displayLink = [CADisplayLink  displayLinkWithTarget:self selector:@selector(displayLink:)];
        
        [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop]forMode:NSDefaultRunLoopMode];
        
    }

    
}



-(void)displayLink:(CADisplayLink*)displayLink{
    
    if (self.width - self.titleLabel.width - 10> self.titleLabel.x) {
        self.isLeft = NO;
    }
    
    if (self.titleLabel.x >= 10) {
        self.isLeft = YES;
    }
    
    if (self.isLeft) {
        
        self.titleLabel.x = self.titleLabel.x - 0.2;
        
    }else{
        
        self.titleLabel.x = self.titleLabel.x + 0.2;
    }
    
}


@end
