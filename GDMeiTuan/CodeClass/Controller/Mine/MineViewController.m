//
//  MineViewController.m
//  GDMeiTuan
//
//  Created by 郭彩风 on 2017/2/20.
//  Copyright © 2017年 cbayel. All rights reserved.
//

#import "MineViewController.h"
#import <AVFoundation/AVCaptureDevice.h>
#import <AVFoundation/AVMediaFormat.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <CoreLocation/CoreLocation.h>

@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (strong,nonatomic) UITableView * tableView;
@property (strong,nonatomic) UIButton *userHeaderBtn;
@property (strong,nonatomic) UILabel *nickNameLabel;

@property (strong,nonatomic) NSMutableArray * dataArr;

@end
static NSString * const mineCell = @"mineCell";
@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"我的";
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
    self.tableView.backgroundColor = kCol_Bg;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:individualCell];
    [self.tableView registerNib:[UINib nibWithNibName:@"MineTableViewCell" bundle:nil] forCellReuseIdentifier:mineCell];
    //取消系统自定义下划线
    //    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //取消空白部分线条
    self.tableView.tableFooterView = [[UIView alloc]init];
    [self.view addSubview:self.tableView];
    //用户基本信息视图
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 150)];
    view.backgroundColor = [UIColor whiteColor];
    self.tableView.tableHeaderView = view;
    //用户头像默认，保持图片本身的颜色，不被按钮默认蓝色所影响
    UIImage *userHeaderImg = [[UIImage imageNamed:@"userHeader.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    if ([UserInfo sharedUserInfo].userHeaderData ) {
        userHeaderImg = [[UIImage imageWithData:[UserInfo sharedUserInfo].userHeaderData] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    //用户头像按钮
    self.userHeaderBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.userHeaderBtn.frame =CGRectMake((kScreenWidth-80)/2, 20, 80, 80);
    self.userHeaderBtn.layer.cornerRadius = 40;
    self.userHeaderBtn.layer.masksToBounds = YES;
    [self.userHeaderBtn setImage:userHeaderImg forState:UIControlStateNormal];
    [self.userHeaderBtn addTarget:self action:@selector(changeUserHeader:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:self.userHeaderBtn];
    
    self.nickNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.userHeaderBtn.frame)+10, kScreenWidth, 20)];
    self.nickNameLabel.text = @"我的昵称";
    self.nickNameLabel.font = [UIFont systemFontOfSize:13];
    self.nickNameLabel.textAlignment = NSTextAlignmentCenter;
    [view addSubview:self.nickNameLabel];
    
    UIButton *regBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    regBtn.frame = CGRectMake(0, CGRectGetMaxY(self.userHeaderBtn.frame)+10, kScreenWidth/2-25, 20);
    [regBtn setTitle:@"注册" forState:UIControlStateNormal];
    [regBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    regBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [regBtn addTarget:self action:@selector(regAction:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:regBtn];
    
    UILabel *lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(regBtn.frame)+15, CGRectGetMaxY(self.userHeaderBtn.frame)+10, 20, 20)];
    lineLabel.text = @"|";
    lineLabel.textColor = kSHFCol_Bg;
    lineLabel.font = [UIFont systemFontOfSize:17];
    lineLabel.textAlignment = NSTextAlignmentCenter;
    [view addSubview:lineLabel];
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    loginBtn.frame = CGRectMake(CGRectGetMaxX(lineLabel.frame)+15, CGRectGetMaxY(self.userHeaderBtn.frame)+10, kScreenWidth/2-25, 20);
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    loginBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [loginBtn addTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:loginBtn];
    
    BOOL isLogin = [LoginAccountTool isLogin];
    if (isLogin) {
        self.nickNameLabel.hidden = NO;
        self.nickNameLabel.text = [LoginAccountTool getUserName];
        regBtn.hidden = YES;
        loginBtn.hidden = YES;
    }
    else
    {
        self.nickNameLabel.hidden = YES;
        regBtn.hidden = NO;
        loginBtn.hidden = NO;
    }
    
    [self sysBaseData];
}

//获取基础数据
-(void)sysBaseData{
    //数据解析
    NSString *path = [[NSBundle mainBundle]pathForResource:@"sysBase" ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    //根据文件创建数组
    NSArray *arr = [NSArray arrayWithArray:dic[@"individual"]];
    //数组开辟空间
    self.dataArr = [NSMutableArray arrayWithCapacity:arr.count];
    //遍历数组
    for (NSDictionary *dict in arr) {
        MineModel *mineModel = [[MineModel alloc]initWithDictionary:dict];
        [self.dataArr addObject:mineModel];
    }
}

//注册事件
-(void)regAction:(UIButton *)button{
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"提示" message:@"注册功能暂不可用" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *yesAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertC addAction:yesAction];
    [self presentViewController:alertC animated:YES completion:^{
        
    }];
}

//登录事件
-(void)loginAction:(UIButton *)button{
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"提示" message:@"登录功能暂不可用" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *yesAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertC addAction:yesAction];
    [self presentViewController:alertC animated:YES completion:^{
        
    }];
}

//更换头像事件
-(void)changeUserHeader:(UIButton *)button{
    
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
    imagePickerController.delegate = self;
    imagePickerController.allowsEditing = YES;
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"更换头像" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [alertController addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        //相机权限
        AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        if (authStatus ==AVAuthorizationStatusRestricted ||//此应用程序没有被授权访问的照片数据。可能是家长控制权限
            authStatus ==AVAuthorizationStatusDenied)  //用户已经明确否认了这一照片数据的应用程序访问
        {
            CGFloat kSystemMainVersion = [UIDevice currentDevice].systemVersion.floatValue;
            if (kSystemMainVersion >= 8.0) {
                // 无权限 引导去开启
                NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                if ([[UIApplication sharedApplication] canOpenURL:url]) {
                    [[UIApplication sharedApplication] openURL:url];
                }
            }
            else
            {
                UIAlertController *hintController = [UIAlertController alertControllerWithTitle:@"相机权限未开启" message:@"请在系统设置中开启相机服务\n(设置>隐私>相机>开启)" preferredStyle:UIAlertControllerStyleAlert];
                [hintController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    
                }]];
                [self presentViewController:hintController animated:YES completion:nil];
            }
        }
        else
        {
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                //真机打开且摄像头可用,info.plist文件中要添加
                // <key>NSPhotoLibraryUsageDescription</key>
                // <string>此 App 需要您的同意才能读取媒体资料库</string>
                // <key>NSCameraUsageDescription</key>
                // <string>此 App 需要您的同意才能使用相机</string>
                imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
                [self presentViewController:imagePickerController animated:YES completion:NULL];
            }
            else
            {
                //模拟器打开且摄像头不可用
                UIAlertController *warnController = [UIAlertController alertControllerWithTitle:@"提示" message:@"该设备不支持相机" preferredStyle:UIAlertControllerStyleAlert];
                [warnController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    
                }]];
                [self presentViewController:warnController animated:YES completion:nil];
            }
        }
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //相册权限
        ALAuthorizationStatus author = [ALAssetsLibrary authorizationStatus];
        if (author ==kCLAuthorizationStatusRestricted || author ==kCLAuthorizationStatusDenied){
            CGFloat kSystemMainVersion = [UIDevice currentDevice].systemVersion.floatValue;
            if (kSystemMainVersion >= 8.0) {
                //无权限 引导去开启
                NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                if ([[UIApplication sharedApplication] canOpenURL:url]) {
                    [[UIApplication sharedApplication] openURL:url];
                }
            }
            else{
                UIAlertController *hintController = [UIAlertController alertControllerWithTitle:@"相册权限未开启" message:@"请在系统设置中开启相册服务\n(设置>隐私>相册>开启)" preferredStyle:UIAlertControllerStyleAlert];
                [hintController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    
                }]];
                [self presentViewController:hintController animated:YES completion:nil];
            }
        }
        else
        {
            imagePickerController.sourceType =UIImagePickerControllerSourceTypePhotoLibrary;
            [self presentViewController:imagePickerController animated:YES completion:NULL];
        }
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - image picker delegte

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{}];
    UIImage *image;
    //是否要裁剪
    if ([picker allowsEditing]){
        //编辑之后的图像
        image = [info objectForKey:UIImagePickerControllerEditedImage];
        
    } else {
        
        image = [info objectForKey:UIImagePickerControllerOriginalImage];
    }
    [self.userHeaderBtn setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [UserInfo sharedUserInfo].userHeaderData = UIImagePNGRepresentation(image);
    [[UserInfo sharedUserInfo] saveUserInof];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kSetRH;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return kSHFH;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 1)];
    view.backgroundColor = kSHFCol_Bg;
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return kSHFH;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 1)];
    view.backgroundColor = kSHFCol_Bg;
    return view;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MineModel *mineModel = self.dataArr[indexPath.row];
    
    //    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:individualCell forIndexPath:indexPath];
    MineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:mineCell forIndexPath:indexPath];
    //保证点击时不会出现选中效果
    cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    cell.imgView.image = [UIImage imageNamed:mineModel.img];
    cell.titleLabel.text = mineModel.title;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
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
