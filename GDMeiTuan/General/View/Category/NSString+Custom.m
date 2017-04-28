//
//  NSString+Custom.m
//  CBayelProjectManage
//
//  Created by gcf on 16/5/3.
//  Copyright © 2016年 CBayel. All rights reserved.
//
#import "NSString+Custom.h"
#import <CommonCrypto/CommonDigest.h>
@implementation NSString (Custom)

/**
 *  根据部门Id获取到部门IconName
 *
 *  @param departmentId 部门Id
 *
 *  @return 部门IconName
 */
+(NSString *)iconNameWithDepartmentId:(NSString *)departmentId{
    NSInteger department = [departmentId integerValue];
    NSString *iconName = [NSString new];
    switch (department) {
        case 108000:
        {
            iconName = @"i-health";
            break;
        }
        case 104000:
        {
            iconName = @"i-management";
            break;
        }
        case 105000:
        {
            iconName = @"i-directors";
            break;
        }
        case 103000:
        {
            iconName = @"i-plane";
            break;
        }
        case 106000:
        {
            iconName = @"i-power";
            break;
        }
        case 107000:
        {
            iconName = @"i-ship";
            break;
        }
        case 109000:
        {
            iconName = @"i-device";
            break;
        }
        default:
        {
            iconName = @"i-plane";
            break;
        }
    }
    return iconName;
}

/**
 *  根据字符串计算动态高度
 *
 *  @param str 要计算高度的字符串
 *
 *  @return 高度
 */
+(CGFloat)hobbyHeight:(NSString *)str{
    CGRect rect = [str boundingRectWithSize:CGSizeMake(kScreenWidth, 70) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
    return rect.size.height;
}

/**
 *  根据字符串计算动态高度比较默认高度，高于默认高度时显示两行默认高度
 *
 *  @param str 要计算高度的字符串
 *
 *  @return 高度
 */
+(CGFloat)hobbyHeightWithStr:(NSString *)str{
    CGRect rect = [str boundingRectWithSize:CGSizeMake(kLLW, 70) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:kLLF_C]} context:nil];
    CGFloat labelHeight = (kLLH_C > rect.size.height) ? kLLH_C : (kLLH_C*2);
    return labelHeight;
}


/**
 根据字符串及字符串宽度计算动态高度比较默认高度，高于默认高度时显示两行默认高度

 @param str      要计算高度的字符串
 @param strWidth 字符串宽度

 @return 高度
 */
+(CGFloat)hobbyHeightWithStr:(NSString *)str strWidth:(CGFloat)strWidth{
    CGRect rect = [str boundingRectWithSize:CGSizeMake(strWidth, 70) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:kLLF_C]} context:nil];
    CGFloat labelHeight = (kLLH_C > rect.size.height) ? kLLH_C : (kLLH_C*2);
    return labelHeight;
}

/**
 *  根据金额字符串获取相应格式的金额
 *
 *  @param grantMoneyValue 金额字符串
 *
 *  @return 相应格式金额
 */
+(NSString *)grantMoneyWithGrantMoneyValue:(NSString *)grantMoneyValue{
    NSMutableString *str = [NSMutableString stringWithString:grantMoneyValue];
    
    int count = 0;
    if ([grantMoneyValue rangeOfString:@"."].location == NSNotFound) {
        //字符串中未出现小数点
        for (int i = (int)grantMoneyValue.length; i > 0; i--) {
            if (count % 3 == 0 && count != 0) {
                ////碰到3的倍数则加上“,”号
                [str insertString:@"," atIndex:i];
            }
            count++;
        }
        [str appendString:@".00"];
    }
    else
    {
        //字符串中出现小数点
        for (int i = (int)[grantMoneyValue rangeOfString:@"."].location ; i > 0; i--) {
            if (count % 3 == 0 && count != 0) {
                ////碰到3的倍数则加上“,”号
                [str insertString:@"," atIndex:i];
            }
            count++;
        }
    }
    return [NSString stringWithFormat:@"￥%@",str];
}


/**
 *  NSString值为Unicode格式的字符串编码(如\u7E8C)转换成中文
 *
 *  @param NSString unicode编码以\u开头
 *
 *  @return 中文
 */
+ (NSString *)replaceUnicode:(NSString *)unicodeStr
{
    
    NSString *tempStr1 = [unicodeStr stringByReplacingOccurrencesOfString:@"\\u"withString:@"\\U"];
    NSString *tempStr2 = [tempStr1 stringByReplacingOccurrencesOfString:@"" withString:@"\\"];
    NSString *tempStr3 = [[@"" stringByAppendingString:tempStr2] stringByAppendingString:@""];
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    //NSString *returnStr = [NSPropertyListSerializationpropertyListFromData:tempData mutabilityOption:NSPropertyListImmutable format:NULL errorDescription:NULL];
    NSString *returnStr = [NSPropertyListSerialization propertyListWithData:tempData options:NSPropertyListImmutable format:NULL error:NULL];
    DLog(@"%@",returnStr);
    return [returnStr stringByReplacingOccurrencesOfString:@"\\r\\n"withString:@"\n"];
}



/**
 *  根据16进制色值获取背景色
 *
 *  @param str 16进制色值
 *
 *  @return 背景色
 */
+ (UIColor *)getColorWithString:(NSString *)str{
    long redColor = strtoul([[str substringWithRange:NSMakeRange(0, 2)] UTF8String], 0, 16) ;
    long greenColor = strtoul([[str substringWithRange:NSMakeRange(2, 2)] UTF8String], 0, 16) ;
    long blueColor = strtoul([[str substringWithRange:NSMakeRange(4, 2)] UTF8String], 0, 16) ;
    UIColor *color = [UIColor colorWithRed:redColor/255.0 green:greenColor/255.0 blue:blueColor/255.0 alpha:1];
    return color;
}

/**
 根据时间戳字符串及想要转换的日期格式获取时间字符串
 
 @param dateStr 时间戳字符串：1484199037000
 
 @return 固定格式的时间字符串
 */
+ (NSString *)getDateWithString:(NSString *)dateStr{
    
    const long dateTimeLong = [dateStr integerValue]/1000;
    
    NSDate *dateTime = [[NSDate alloc] initWithTimeIntervalSince1970:dateTimeLong];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeStyle:NSDateFormatterNoStyle];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    NSLocale *formatterLocal = [[NSLocale alloc] initWithLocaleIdentifier:@"en_us"];
    [formatter setLocale:formatterLocal];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateString = [formatter stringFromDate:dateTime];
    return dateString;
}

@end
