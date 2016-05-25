//
//  PostWordViewController.m
//  CZPlaceholderTextViewDemo
//
//  Created by JohnZhang on 16/5/25.
//  Copyright © 2016年 JohnZhang. All rights reserved.
//

#import "PostWordViewController.h"

#import "PlaceholderTextView.h"
#import "PlaceholderLabel.h"

@interface PostWordViewController () <UITextViewDelegate>

/** <#属性#> */
@property (nonatomic, strong) PlaceholderLabel *textView;

@end

@implementation PostWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupNav];
    
    [self setupTextView];
    
    self.view.backgroundColor = [UIColor blueColor];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.view endEditing:YES];
}

- (void)setupTextView {
    
//    PlaceholderTextView *textView = [[PlaceholderTextView alloc] init];
//    textView.frame = self.view.bounds;
//    textView.placeholder = @"sdfasdf";
//    textView.placeholderColor = [UIColor blueColor];
//    textView.placeholderColor = [UIColor greenColor];
    
    PlaceholderLabel *textView = [[PlaceholderLabel alloc] init];
    textView.frame = self.view.bounds;
    textView.placeholder = @"sdfasfdsdsfsdf";
    textView.delegate = self;
    textView.placeholderColor = [UIColor greenColor];
    [self.view addSubview:textView];
    self.textView = textView;

}

- (void)setupNav {
    self.title = @"发表文字";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(cancel)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发表" style:UIBarButtonItemStyleDone target:self action:@selector(post)];
    self.navigationItem.rightBarButtonItem.enabled = NO; // 默认不能点击
    // 强制刷新
    [self.navigationController.navigationBar layoutIfNeeded];
}




- (void)cancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)post
{
    NSLog(@"post");
}

#pragma mark -<UITextViewDelegate>
- (void)textViewDidChange:(UITextView *)textView
{
    self.navigationItem.rightBarButtonItem.enabled = self.textView.hasText;
}


@end
