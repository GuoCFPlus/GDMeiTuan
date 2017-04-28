//
//  LoginAccountTool.h
//  leasecore_ios_cbayel
//
//  Created by 郭彩风 on 2017/3/29.
//  Copyright © 2017年 cbayel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginAccountTool : NSObject
/**
 *  存储账号信息
 *  @param account 需要存储的账号信息：第一个值为用户名；第二个值为密码
 */
+ (void)saveAccount:(NSArray *)account;

/**
 *  清除账号信息
 *  @param account 需要清除的账号信息：第一个值为用户名；第二个值为密码
 */
+ (void)removeAccount:(NSArray *)account;

/**
 *  返回存储的账号信息
 * @return NSArray
 */
+ (NSArray *)getAccount;

/**
 *  返回存储的登陆用户名
 *  @return NSString
 */
+ (NSString *)getUserName;

/**
 *  返回存储的登陆用户密码
 *  @return NSString
 */
+ (NSString *)getPassword;

/**
 *  返回是否登录
 *  @return BOOL
 */
+ (BOOL)isLogin;

@end
