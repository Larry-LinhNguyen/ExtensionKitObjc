//
//  UICollectionViewExtension.m
//  Haioo
//
//  Created by Moch Xiao on 5/10/15.
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

#import "UICollectionViewExtension.h"

@implementation UICollectionViewExtension

@end


#pragma mark - CHXCompressSize

@implementation UICollectionView (CHXCompressSize)

- (CGSize)chx_sizeForReusableCellWithClass:(Class)clazz dataConfiguration:(void (^)(id cell))dataConfiguration {
    UICollectionViewCell *cell = [self chx_associatedObjectForKey:(__bridge void *)(NSStringFromClass(clazz))];
    if (!cell) {
        cell = [[clazz alloc] initWithFrame:CGRectZero];
        [self chx_associateObject:cell forKey:(__bridge void *)(NSStringFromClass(clazz))];
    }
    
    [cell prepareForReuse];
    dataConfiguration(cell);
    
    // Important
//    cell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
    
    [cell setNeedsLayout];
    [cell layoutIfNeeded];
    
    return [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
}


@end