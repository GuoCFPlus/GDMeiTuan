//
//  LoginViewController.h
//  CBayelProjectManage
//
//  Created by gcf on 16/4/11.
//  Copyright © 2016年 CBayel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
//STLVideoViewController

/**
 *  登录页面单例
 */
+(instancetype)shareLoginViewController;

/**
 *  动态登录事件
 *
 *  内页自动登录时使用，若没有登陆成功则跳转到APP主页
 */

-(BOOL)loginAction;
/**
 *  自动登录事件
 *
 *  登录按钮登录事件，若没有登陆成功则弹出错误原因
 */
-(void)loginActionAuto;

/**
 *  退出登录事件
 */
-(void)loginOutAction;

@end
