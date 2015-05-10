//
//  UILabelExtension.m
//  GettingStarted
//
//  Created by Moch Xiao on 2014-11-18.
//  Copyright (c) 2014 Moch Xiao (https://github.com/atcuan).
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "UILabelExtension.h"

@implementation UILabelExtension

@end


#pragma mark - 快速生成标签

@implementation UILabel (CHXGenerate)

+ (instancetype)chx_labelWithFrame:(CGRect)frame
                     textAlignment:(NSTextAlignment)alignment
                              font:(UIFont *)font
                         textColor:(UIColor *)color {
    UILabel *label = [[self alloc] initWithFrame:frame];
    label.textAlignment = alignment ? : NSTextAlignmentLeft;
    label.font = font ? : [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    label.textColor = color ? : [UIColor whiteColor];
    label.lineBreakMode = NSLineBreakByWordWrapping;
    
    return label;
}

+ (instancetype)chx_labelWithSize:(CGSize)size
                           center:(CGPoint)center
                    textAlignment:(NSTextAlignment)alignment
                             font:(UIFont *)font
                        textColor:(UIColor *)textColor {
    CGRect frame = CGRectMake(center.x - size.width / 2,
                              center.y - size.height / 2,
                              size.width,
                              size.height);
    return [self chx_labelWithFrame:frame textAlignment:alignment font:font textColor:textColor];
}

@end

#pragma mark - MultiLineUILabelAutoLayout

@implementation UILabel (CXHMultiLineUILabelAutoLayout)

- (void)setBounds:(CGRect)bounds {
    [super setBounds:bounds];
    // If this is a multiline label, need to make sure
    // preferredMaxLayoutWidth always matches the frame width
    // (i.e. orientation change can mess this up)
    
    if (self.numberOfLines == 0 && bounds.size.width != self.preferredMaxLayoutWidth) {
        self.preferredMaxLayoutWidth = self.bounds.size.width;
        [self setNeedsUpdateConstraints];
    }
}

@end