//
//  MainTabBarController.m
//  leasecore_ios_cbayel
//
//  Created by 郭彩风 on 2017/2/6.
//  Copyright © 2017年 cbayel. All rights reserved.
//

#import "MainTabBarController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //设置文字的属性
    [self setUpItemTitleTextAttrs];
    //添加子控件
    [self setUpChildVcs];
    
}


//添加子控制器
- (void)setUpChildVcs
{
    [self setUpOneChildVc:[[MainNavController alloc] initWithRootViewController:[[HomeViewController alloc] init]] title:@"首页" image:@"icon_tabbar_homepage" selectedImage:@"icon_tabbar_homepage_selected"];
    [self setUpOneChildVc:[[MainNavController alloc] initWithRootViewController:[[NearViewController alloc] init]] title:@"附近" image:@"icon_tabbar_nearby_normal" selectedImage:@"icon_tabbar_nearby_selected"];
    [self setUpOneChildVc:[[MainNavController alloc] initWithRootViewController:[[WalkViewController alloc] init]] title:@"逛一逛" image:@"icon_tabbar_merchant_normal" selectedImage:@"icon_tabbar_merchant_selected"];
    [self setUpOneChildVc:[[MainNavController alloc] initWithRootViewController:[[OrderViewController alloc] init]] title:@"订单" image:@"icon_tabbar_order" selectedImage:@"icon_tabbar_order_selected"];
    [self setUpOneChildVc:[[MainNavController alloc] initWithRootViewController:[[MineViewController alloc] init]] title:@"我的" image:@"icon_tabbar_mine" selectedImage:@"icon_tabbar_mine_selected"];
}
- (void)setUpOneChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    childVc.tabBarItem.title = title;
    if (image.length) childVc.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    if (selectedImage.length) childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:childVc];
    
}


- (void)setUpItemTitleTextAttrs
{
    //设置normal状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    normalAttrs[NSForegroundColorAttributeName] = kTCol;
    
    //设置selected状态下的文字属性
    NSMutableDictionary *selectedArrts= [NSMutableDictionary dictionary];
    selectedArrts[NSForegroundColorAttributeName] = kTCol_C;
    
    //利用Appearance对象同意设置文字属性
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedArrts forState:UIControlStateSelected];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
