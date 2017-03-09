//
//  HomeViewController.m
//  GDMeiTuan
//
//  Created by 郭彩风 on 2017/2/20.
//  Copyright © 2017年 cbayel. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) UITableView * tableView;

@property (strong,nonatomic) NSMutableArray * menuArr;
@property (strong,nonatomic) NSMutableArray * dataArr;

@end
static NSString * const homeCell = @"homeCell";
@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:homeCell];
    
    NSString *plistPath = [[NSBundle mainBundle]pathForResource:@"menuData" ofType:@"plist"];
    self.menuArr = [[NSMutableArray alloc]initWithContentsOfFile:plistPath];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    //1、分类列表collection（有广告时要显示header广告）
    //2、优惠活动列表collection
    //3、猜你喜欢列表table
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 2) {
        return self.dataArr.count;
    }
    else
    {
        return 1;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
        {
            //设备宽度/列数*行数+pageCount高度
            return kScreenWidth/4*2+20;
            break;
        }
        default:
        {
            return 40;
            break;
        }
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
        {
            HomeTypeTableViewCell *cell = [HomeTypeTableViewCell cellWithTableView:tableView menuArray:self.menuArr rowNum:2 columnNum:4];
            return cell;
            break;
        }
        default:
        {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:homeCell forIndexPath:indexPath];
            cell.textLabel.text = @"首页";
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
            break;
        }
    }
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
