//
//  PlaceholderLabel.h
//  CZPlaceholderTextViewDemo
//
//  Created by JohnZhang on 16/5/25.
//  Copyright © 2016年 JohnZhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlaceholderLabel : UITextView

/** 占位文字 */
@property (nonatomic, copy) NSString *placeholder;
/** 占位文字的颜色 */
@property (nonatomic, strong) UIColor *placeholderColor;


@end
