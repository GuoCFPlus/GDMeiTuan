//
//  MainNavController.m
//  leasecore_ios_cbayel
//
//  Created by 郭彩风 on 2017/2/6.
//  Copyright © 2017年 cbayel. All rights reserved.
//

#import "MainNavController.h"

@interface MainNavController ()<UIGestureRecognizerDelegate>

@end

@implementation MainNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /**
     *  清空代理,默认用户的手势就是有效的
     */
    //    self.interactivePopGestureRecognizer.delegate = nil;
    self.interactivePopGestureRecognizer.delegate = self;
    //设置背景图片
    //[self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    //设置导航栏文字
    [self.navigationBar setTitleTextAttributes:@{
                                                 NSFontAttributeName : [UIFont boldSystemFontOfSize:17]
                                                 }];
    self.navigationBar.barTintColor = kNCol_C;
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : kNCol_CF}];
}
/**
 *  重写push方法目的: 拦截push进来的自控制器
 *
 *  @param viewController 被push进来的子控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0) {
        UIButton *backButton = [[UIButton alloc] init];
        backButton.frame = CGRectMake(0, 0, kBackIconWH, kBackIconWH);
//        [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [backButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
//        [backButton setTitle:@"返回" forState:UIControlStateNormal];
        [backButton setImage:[UIImage imageNamed:@"nav-back"] forState:UIControlStateNormal];
//        [backButton setImage:[UIImage imageNamed:@"nav-back"] forState:UIControlStateHighlighted];
//        [backButton sizeToFit];
        [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
//        backButton.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
        viewController.hidesBottomBarWhenPushed = YES;
        
    }
    
    [super pushViewController:viewController animated:YES];
    
}

#pragma mark - 监听
- (void)back
{
    [self popViewControllerAnimated:YES];
    
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    //档子控制器个数大于1是,手势有效
    return self.childViewControllers.count > 1;
    
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
