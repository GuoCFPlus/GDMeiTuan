//
//  UIWebView+CancelShadow.m
//  CBayelProjectManage
//
//  Created by gcf on 16/3/31.
//  Copyright © 2016年 CBayel. All rights reserved.
//

#import "UIWebView+CancelShadow.h"

@implementation UIWebView (CancelShadow)

-(void)cancelShadow{
    UIScrollView *scrollView = self.scrollView;
    for (int i = 0; i < scrollView.subviews.count; i++) {
        UIView *view = [scrollView.subviews objectAtIndex:i];
        if ([view isKindOfClass:[UIImageView class]]) {
            view.hidden = YES;
        }
    }
}

@end
