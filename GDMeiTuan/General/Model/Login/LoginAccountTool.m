//
//  LoginAccountTool.m
//  leasecore_ios_cbayel
//
//  Created by 郭彩风 on 2017/3/29.
//  Copyright © 2017年 cbayel. All rights reserved.
//

#import "LoginAccountTool.h"

@implementation LoginAccountTool

+ (void)saveAccount:(NSArray *)account{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    //保存数据 用户信息；用户名；用户密码
    [userDefaults setObject:account  forKey:@"account"];
    [userDefaults setObject:[account objectAtIndex:0]  forKey:@"userName" ];
    [userDefaults setObject:[account objectAtIndex:1]  forKey:@"passWord" ];
};

+ (void)removeAccount:(NSArray *)account{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    //清除数据 用户信息；用户名；用户密码
    [userDefaults removeObjectForKey:@"account"];
}


+ (NSArray *)getAccount{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSArray *array = [userDefaults objectForKey:@"account"];
    return array;
};

+ (NSString *)getUserName{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *userName = [userDefaults objectForKey:@"userName"];
    return userName;
};

+ (NSString *)getPassword{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *passWord = [userDefaults objectForKey:@"passWord"];
    return passWord;
}

+ (BOOL)isLogin{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *userName = [userDefaults objectForKey:@"userName"];
    NSString *passWord = [userDefaults objectForKey:@"passWord"];
    if (userName != nil && userName.length > 0 && passWord != nil && passWord.length >0)
    {
        //已经登录
        return YES;
    }
    return NO;
}
@end
