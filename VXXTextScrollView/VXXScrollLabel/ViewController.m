//
//  ViewController.m
//  VXXScrollLabel
//
//  Created by Volitation小星 on 16/10/17.
//  Copyright © 2016年 Volitation小星. All rights reserved.
//

#import "ViewController.h"
#import "VXXScrollLabel.h"
#import "VXXScrollButton.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet VXXScrollButton *btn;

@property (weak, nonatomic) IBOutlet VXXScrollLabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)onBtnClicked:(UIButton *)sender {
    
    if (sender.tag == 1000) {
        self.label.scrollDirection = VXXScrollLabelDirectionComeAndBack;
        self.btn.scrollDirection = VXXScrollLabelDirectionComeAndBack;
    }
    
    if (sender.tag == 2000) {
        self.label.scrollDirection = VXXScrollLabelLeftDirection;
        self.btn.scrollDirection = VXXScrollLabelLeftDirection;
    }
    
    if (sender.tag == 3000) {
        self.label.scrollDirection = VXXScrollLabelRightDirection;
        self.btn.scrollDirection = VXXScrollLabelRightDirection;
    }
    
    
}

@end
