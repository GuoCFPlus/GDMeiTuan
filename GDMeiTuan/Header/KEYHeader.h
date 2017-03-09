//
//  KEYHeader.h
//  CBayelProjectManage
//
//  Created by gcf on 16/3/28.
//  Copyright © 2016年 CBayel. All rights reserved.
//  这里是三方key的声明/宏定义.

#ifndef Project_KEYHeader_h
#define Project_KEYHeader_h

//设备宽高
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

//列表Label（LL）上下间距（TB）、左右间距（LR）、宽度（W）
#define kLLTB 0
#define kLLLR 20
#define kLLW (kScreenWidth - kLLLR*2)

//列表Label（LL）标题高度（H_T）、内容高度(H_C)、底部高度(H_B)
#define kLLH_T 40
#define kLLH_C 22
#define kLLH_B 10
#define kLLH_L 1

//列表Label（LL）标题字体大小（F_T），内容字体大小（F_C）
#define kLLF_T 16
#define kLLF_C 13

//列表Label（LL）标题背景颜色（Col_TBg），标题字体颜色（Col_T）,底部背景颜色（Col_BBg）
#define kLLCol_TBg [UIColor colorWithRed:223/255.0 green:226/255.0 blue:233/255.0 alpha:1]
#define kLLCol_T [UIColor colorWithRed:8/255.0 green:37/255.0 blue:92/255.0 alpha:1]
#define kLLCol_BBg [UIColor colorWithRed:241/255.0 green:242/255.0 blue:243/255.0 alpha:1]

//内容页整体背景色
#define kCol_Bg [UIColor colorWithRed:241/255.0 green:242/255.0 blue:243/255.0 alpha:1]

//设置页Set行高（RH）
#define kSetRH 40

//section（SHF）的header、footer高度（H）
#define kSHFH 0.5
//section（SHF）的header、footer背景色（Col_Bg）
#define kSHFCol_Bg [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1]

//TabBar颜色（TCol）点击状态（_C）
#define kTCol [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1]
#define kTCol_C [UIColor colorWithRed:54/255.0 green:185/255.0 blue:175/255.0 alpha:1]

//navBar颜色（NCol）内容页（_C）,主页（_M）字体颜色（_CF\_MF）
#define kNCol_C [UIColor colorWithRed:54/255.0 green:185/255.0 blue:175/255.0 alpha:1]
#define kNCol_M [UIColor colorWithRed:8/255.0 green:37/255.0 blue:92/255.0 alpha:1]
#define kNCol_CF [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1]
#define kNCol_MF [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1]


//IOS7自动在ScollView添加64px空白
#define kBlankHeight 64

//系统版本号
#define kIOSVersion [UIDevice currentDevice].systemVersion.doubleValue

//返回按钮的图片名称
#define kBackIcon @"b-top-back.png"
//返回按钮的宽高
#define kBackIconWH 22

//手势密码样式
#define kDrawLineWidth 4
//未选中的按钮的颜色
#define kDrawBtnUnselectColor [UIColor colorWithRed:195/255.0 green:195/255.0 blue:195/255.0 alpha:0.5]
//选中的按钮颜色
#define kDrawBtnSelectColor kLLCol_T
//正常的线条颜色
#define kDrawLineRightColor kLLCol_T
//错误的线条颜色
#define kDrawLineWrongColor [UIColor redColor]

//手势密码页Logo的CGRect
//#define kLogoLR_G 50
//#define kLogoWidth_G (kScreenWidth-kLogoLR_G*2)
#define kLogoLR_G 30
#define kLogoWidth_G 100
#define kLogoHeight_G 76
#define kLogoY_G (kScreenHeight-(kLogoHeight_G+kScreenWidth+kGap50+kWarnTB+kWarnHeight))/2
//手势密码页背景图片
#define kBgImg_G @"b-bg-gesture"
//手势密码页Logo图片
#define kLogoImg_G @"b-loginLogo"
//手势密码警告背景图片
#define kWarnBg @"b-g-warn"
#define kWarnLR 30
#define kWarnTB 20
#define kWarnWidth (kScreenWidth-kWarnLR*2)
#define kWarnHeight kLLH_T
#endif
