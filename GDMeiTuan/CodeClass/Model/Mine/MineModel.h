//
//  MineModel.h
//  GDMeiTuan
//
//  Created by 郭彩风 on 2017/4/1.
//  Copyright © 2017年 cbayel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MineModel : NSObject
@property (strong,nonatomic) NSString * img;
@property (strong,nonatomic) NSString * title;

/**
 自定义初始化方法实现：方便快速构建对象
 
 @param dict 系统设置基本信息图片及名称
 
 @return 系统设置对象
 */
-(instancetype)initWithDictionary:(NSDictionary *)dict;
@end
