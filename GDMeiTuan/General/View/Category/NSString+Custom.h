//
//  NSString+Custom.h
//  CBayelProjectManage
//
//  Created by gcf on 16/5/3.
//  Copyright © 2016年 CBayel. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface NSString (Custom)

/**
 *  根据部门Id获取到部门IconName
 *
 *  @param departmentId 部门Id
 *
 *  @return 部门IconName
 */
+(NSString *)iconNameWithDepartmentId:(NSString *)departmentId;


/**
 *  根据字符串计算动态高度
 *
 *  @param str 要计算高度的字符串
 *
 *  @return 高度
 */
+(CGFloat)hobbyHeight:(NSString *)str;

/**
 *  根据字符串计算动态高度比较默认高度，高于默认高度时显示两行默认高度
 *
 *  @param str 要计算高度的字符串
 *
 *  @return 高度
 */
+(CGFloat)hobbyHeightWithStr:(NSString *)str;
/**
 根据字符串及字符串宽度计算动态高度比较默认高度，高于默认高度时显示两行默认高度
 
 @param str      要计算高度的字符串
 @param strWidth 字符串宽度
 
 @return 高度
 */
+(CGFloat)hobbyHeightWithStr:(NSString *)str strWidth:(CGFloat)strWidth;

/**
 *  根据金额字符串获取相应格式的金额
 *
 *  @param grantMoneyValue 金额字符串
 *
 *  @return 相应格式金额
 */
+(NSString *)grantMoneyWithGrantMoneyValue:(NSString *)grantMoneyValue;


/**
 *  NSString值为Unicode格式的字符串编码(如\u7E8C)转换成中文
 *
 *  @param unicodeStr unicode编码以\u开头
 *
 *  @return 中文
 */
+ (NSString *)replaceUnicode:(NSString *)unicodeStr;

/**
 *  根据16进制色值获取背景色
 *
 *  @param str 16进制色值
 *
 *  @return 背景色
 */
+ (UIColor *)getColorWithString:(NSString *)str;


/**
 根据时间戳字符串及想要转换的日期格式获取时间字符串
 
 @param dateStr 时间戳字符串：1484199037000
 
 @return 固定格式的时间字符串
 */
+ (NSString *)getDateWithString:(NSString *)dateStr;
@end
