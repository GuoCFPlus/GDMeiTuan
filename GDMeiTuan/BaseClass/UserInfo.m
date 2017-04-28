//
//  UserInfo.m
//  leasecore_ios_cbayel
//
//  Created by 郭彩风 on 2017/2/9.
//  Copyright © 2017年 cbayel. All rights reserved.
//

#import "UserInfo.h"

@implementation UserInfo
singleton_implementation(UserInfo)


- (void)saveUserInof{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:self.nickName forKey:kNickName];
    [defaults setValue:self.companyName forKey:kCompanyName];
    [defaults setValue:self.phoneNum forKey:kPhoneNum];
    [defaults setValue:self.email forKey:kEmail];
    [defaults setValue:self.password forKey:kPassword];
    [defaults setObject:self.userHeaderData forKey:kUserHeader];
    [defaults synchronize];
}

- (void)loadUserInof{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.nickName = [defaults objectForKey:kNickName];
    self.companyName = [defaults objectForKey:kCompanyName];
    self.phoneNum = [defaults objectForKey:kPhoneNum];
    self.email = [defaults objectForKey:kEmail];
    self.password = [defaults objectForKey:kPassword];
    self.userHeaderData = [defaults objectForKey:kUserHeader];
}
@end
