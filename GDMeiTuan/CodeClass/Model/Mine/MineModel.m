//
//  MineModel.m
//  GDMeiTuan
//
//  Created by 郭彩风 on 2017/4/1.
//  Copyright © 2017年 cbayel. All rights reserved.
//

#import "MineModel.h"

@implementation MineModel
//重写无法正确赋值的key-value对，保证KVC对model对象赋值不出错
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    DLog(@"对象无法正确赋值的键值对：%@",key);
    //    if ([key isEqualToString:@"amt"]) {
    //        _amt = [NSString stringWithFormat:@"%@",value];
    //    }
}

//自定义初始化方法实现：方便快速构建对象
-(instancetype)initWithDictionary:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

//打印方法，辅助校验model对象的属性查看是否成功
-(NSString *)description{
    return [NSString stringWithFormat:@"图片：%@,名称：%@",_img,_title];
}
@end
