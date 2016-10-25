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
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onBtnClicked:(UIButton *)sender {
}

@end
