//
//  ViewController.m
//  CZPlaceholderTextViewDemo
//
//  Created by JohnZhang on 16/5/25.
//  Copyright © 2016年 JohnZhang. All rights reserved.
//

#import "ViewController.h"

#import "CZNavigationController.h"
#import "PostWordViewController.h"

@interface ViewController ()

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
- (IBAction)publishWord:(UIButton *)sender {
    
    
    PostWordViewController *postWordVC = [[PostWordViewController alloc] init];
    CZNavigationController *nav = [[CZNavigationController alloc] initWithRootViewController:postWordVC];
    
    [self presentViewController:nav animated:YES completion:^{
        
    }];
    
}

@end
