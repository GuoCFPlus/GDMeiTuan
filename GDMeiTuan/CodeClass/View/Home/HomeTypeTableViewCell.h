//
//  HomeTypeTableViewCell.h
//  GDMeiTuan
//
//  Created by 郭彩风 on 2017/2/22.
//  Copyright © 2017年 cbayel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeTypeTableViewCell : UITableViewCell



/**
 初始化自定义cell——scrollView、pageControl与collectionView结合

 @param tableView tableView
 @param menuArray cell加载数据

 @return cell
 */
+(instancetype)cellWithTableView:(UITableView *)tableView menuArray:(NSArray *)menuArray rowNum:(NSInteger)rowNum columnNum:(NSInteger)columnNum;



@end
