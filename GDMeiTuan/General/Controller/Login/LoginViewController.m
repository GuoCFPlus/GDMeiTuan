  //
//  LoginViewController.m
//  CBayelProjectManage
//
//  Created by gcf on 16/4/11.
//  Copyright © 2016年 CBayel. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()<UITextFieldDelegate>
@property (strong , nonatomic) LoginBaseView *userNameBV;
@property (strong , nonatomic) LoginBaseView *passwordBV;
@property (strong , nonatomic) UIView *bgView;
@property (strong , nonatomic) UILabel *logoLabelSys;
@end

static id _instace;
@implementation LoginViewController

#pragma mark -----Login单例-----
+(instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instace = [super allocWithZone:zone];
    });
    return _instace;
}

+(instancetype)shareLoginViewController{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instace = [[self alloc]init];
    });
    return _instace;
}

-(id)copyWithZone:(NSZone *)zone{
    return _instace;
}

#pragma mark -----页面实现-----
//绘制页面
-(void)drawView{
    
    self.navigationController.navigationBarHidden = NO;
    
    self.navigationItem.title = @"登录";
    
    
    
    //点击空白处收回键盘
    UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    tapGr.cancelsTouchesInView = NO;
    [self.bgView addGestureRecognizer:tapGr];
}

-(void)backAction{
    //收回登录页
    [self dismissViewControllerAnimated:YES completion:^{
        //进入主页面
        [self.navigationController popToRootViewControllerAnimated:YES];
//        AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//        //模态展示出登陆页面
//        [tempAppDelegate.mainNavigationController popToRootViewControllerAnimated:NO];
    }];
}

//输入用户名点下一个时换行，输入密码后回收键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([textField isEqual:self.userNameBV.textField]) {
        [self.passwordBV.textField becomeFirstResponder];
    }
    else
    {
        [textField resignFirstResponder];    //主要是[receiver resignFirstResponder]在哪调用就能把receiver对应的键盘往下收
    }
    return YES;
}
////避免键盘遮挡，登录表单或按钮上移代码
//- (void)textViewDidBeginEditing:(UITextField *)textView
//{
//    CGRect frame = textView.frame;
//    int offset = frame.origin.y + 120 - (self.view.frame.size.height - 216.0);//键盘高度216
//    NSTimeInterval animationDuration = 0.30f;
//    [UIView beginAnimations:@"ResizeForKeyBoard" context:nil];
//    [UIView setAnimationDuration:animationDuration];
//    float width = self.view.frame.size.width;
//    float height = self.view.frame.size.height;
//    if(offset > 0)
//    {
//        CGRect rect = CGRectMake(0.0f, -offset,width,height);
//        self.view.frame = rect;
//    }
//    [UIView commitAnimations];
//}


/**
 *  注册事件
 */
-(void)regAction{
    DLog(@"注册事件");
}

/**
 *  忘记密码事件
 */
-(void)forgotAction{
    DLog(@"忘记密码？");
}

/**
 *  点击空白处回收键盘
 *
 *  @param tapGr tapGr
 */
-(void)viewTapped:(UITapGestureRecognizer*)tapGr
{
    [self.view endEditing:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self drawView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [MobClick beginLogPageView:@"LoginViewController"];//PageOne为页面名称
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [MobClick endLogPageView:@"LoginViewController"];
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
