//
//  UserInfo.h
//  leasecore_ios_cbayel
//
//  Created by 郭彩风 on 2017/2/9.
//  Copyright © 2017年 cbayel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfo : NSObject
singleton_interface(UserInfo)
@property (nonatomic ,copy) NSString *nickName;
@property (nonatomic ,copy) NSString *companyName;
@property (nonatomic ,copy) NSString *phoneNum;
@property (nonatomic ,copy) NSString *email;
@property (nonatomic ,copy) NSString *password;
@property (nonatomic ,strong) NSData *userHeaderData;

/**
 保存个人信息
 */
- (void)saveUserInof;

/**
 加载个人信息
 */
- (void)loadUserInof;
@end
