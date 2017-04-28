//
//  LoginBaseView.m
//  CBayelProjectManage
//
//  Created by gcf on 16/4/11.
//  Copyright © 2016年 CBayel. All rights reserved.
//

#import "LoginBaseView.h"

@implementation LoginBaseView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self drawView];
    }
    return self;
}

-(void)drawView{
    
    CGFloat x = CGRectGetMinX(self.frame);
    CGFloat y = CGRectGetMinY(self.frame);
    CGFloat h = CGRectGetHeight(self.frame);
    CGFloat w = CGRectGetWidth(self.frame);
    
    
    UIView *bgView = [[UIView alloc]initWithFrame:kScreenCGRect];
    bgView.layer.cornerRadius = 5;
    bgView.layer.masksToBounds = YES;
    bgView.layer.borderWidth = 1;
    //bgView.layer.borderColor = [kBlue CGColor];
    bgView.layer.borderColor = [[UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1] CGColor];
    bgView.backgroundColor = [UIColor whiteColor];
    [self addSubview:bgView];
    
    self.titleImgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 15, 20, 20)];
    self.titleImgView.image = [UIImage imageNamed:@"b-log-user"];
    [bgView addSubview:self.titleImgView];
    
    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.titleImgView.frame)+10, 0, CGRectGetWidth(bgView.frame)-CGRectGetWidth(self.titleImgView.frame) - 20, h)];
    self.textField.textColor = [UIColor grayColor];
    //self.textField.placeholder = @"用户名";
    //输入框中是否有个叉号，在什么时候显示，用于一次性删除输入框中的内容
    self.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    //是否纠错
    self.textField.autocorrectionType = UITextAutocorrectionTypeNo;
    //首字母是否大写
    self.textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    //return键变成什么键
    self.textField.returnKeyType =UIReturnKeyNext;
    [bgView addSubview:self.textField];
    
    
    
    
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
