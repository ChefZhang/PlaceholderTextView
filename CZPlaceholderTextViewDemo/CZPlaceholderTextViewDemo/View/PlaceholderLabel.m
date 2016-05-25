//
//  PlaceholderLabel.m
//  CZPlaceholderTextViewDemo
//
//  Created by JohnZhang on 16/5/25.
//  Copyright © 2016年 JohnZhang. All rights reserved.
//

#import "PlaceholderLabel.h"



@interface PlaceholderLabel ()

/** 占位文字label */
@property (nonatomic, weak) UILabel *placeholderLabel;

@end

@implementation PlaceholderLabel

- (UILabel *)placeholderLabel
{
    if (!_placeholderLabel) {
        // 添加一个用来显示占位文字的label
        UILabel *placeholderLabel = [[UILabel alloc] init];
        placeholderLabel.numberOfLines = 0;
        
        CGRect frame = placeholderLabel.frame;
        frame.origin.x = 4;
        frame.origin.y = 7;
        placeholderLabel.frame = frame;
//        placeholderLabel.x = 4;
//        placeholderLabel.y = 7;
        [self addSubview:placeholderLabel];
        _placeholderLabel = placeholderLabel;
    }
    return _placeholderLabel;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // 垂直方向上永远有弹簧效果
        self.alwaysBounceVertical = YES;
        
        // 默认字体
        self.font = [UIFont systemFontOfSize:15];
        
        // 默认的占位文字颜色
        self.placeholderColor = [UIColor grayColor];
        
        // 监听文字改变
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]  removeObserver:self];
}



/**
 * 监听文字改变
 */
- (void)textDidChange
{
    // 只要有文字, 就隐藏占位文字label
    self.placeholderLabel.hidden = self.hasText;
}

/**
 * 更新占位文字的尺寸
 */
- (void)layoutSubviews
{
    
    [super layoutSubviews];
//    CGSize maxSize = CGSizeMake([UIScreen mainScreen].bounds.size.width - 2 * self.placeholderLabel.x, MAXFLOAT);
//    self.placeholderLabel.size = [self.placeholder boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : self.font} context:nil].size;

    CGRect rect = self.placeholderLabel.frame;
    rect.size.width = self.frame.size.width - 2 * self.placeholderLabel.frame.origin.x;
    self.placeholderLabel.frame = rect;
    [self.placeholderLabel sizeToFit];
    self.placeholderLabel.backgroundColor = [UIColor blueColor];
}

#pragma mark - 重写setter
- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    _placeholderColor = placeholderColor;
    
    self.placeholderLabel.textColor = placeholderColor;
}

- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = [placeholder copy];
    
    self.placeholderLabel.text = placeholder;
    
    [self setNeedsLayout];
}

- (void)setFont:(UIFont *)font
{
    [super setFont:font];
    
    self.placeholderLabel.font = font;
    
    [self setNeedsLayout];
}

- (void)setText:(NSString *)text
{
    [super setText:text];
    
    [self textDidChange];
}

- (void)setAttributedText:(NSAttributedString *)attributedText
{
    [super setAttributedText:attributedText];
    
    [self textDidChange];
}


@end
