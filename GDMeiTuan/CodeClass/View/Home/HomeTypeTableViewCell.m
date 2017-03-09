//
//  HomeTypeTableViewCell.m
//  GDMeiTuan
//
//  Created by 郭彩风 on 2017/2/22.
//  Copyright © 2017年 cbayel. All rights reserved.
//

#import "HomeTypeTableViewCell.h"

@interface HomeTypeTableViewCell ()<UIScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UIPageViewControllerDelegate>
@property (strong,nonatomic) UIScrollView * scrollView;
@property (strong,nonatomic) UIPageControl * pageControl;
/**
 元素宽高
 */
@property (assign,nonatomic) CGFloat elementWidth;
/**
 单页元素个数
 */
@property (assign,nonatomic) NSInteger pageSize;
/**
 页数
 */
@property (assign,nonatomic) NSInteger pageCount;

/**
 行数
 */
@property (assign,nonatomic) NSInteger rowCount;

/**
 列数
 */
@property (assign,nonatomic) NSInteger columnCount;

@property (strong,nonatomic) NSMutableArray * dataArr;

@end


@implementation HomeTypeTableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView menuArray:(NSArray *)menuArray rowNum:(NSInteger)rowNum columnNum:(NSInteger)columnNum{
    static NSString *const homeTypeCell = @"homeTypeCell";
    HomeTypeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:homeTypeCell];
    if (cell == nil) {
        cell = [[HomeTypeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:homeTypeCell menuArray:menuArray rowNum:rowNum columnNum:columnNum];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier menuArray:(NSArray *)menuArray rowNum:(NSInteger)rowNum columnNum:(NSInteger)columnNum{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//        self.backgroundColor = [UIColor orangeColor];
        self.dataArr = [[NSMutableArray alloc]initWithArray:menuArray];
        //数据总个数
        NSInteger count = menuArray.count;
        //默认2行4列
        if (rowNum == 0) {
            self.rowCount = 2;
        }
        else
        {
            self.rowCount = rowNum;
        }
        if (columnNum == 0) {
            self.columnCount = 4;
        }
        else
        {
            self.columnCount = columnNum;
        }
        //每页数据个数
        self.pageSize = self.rowCount * self.columnCount;
        //页数
        self.pageCount = (count%self.pageSize==0)?(count/self.pageSize):(count/self.pageSize+1);
        //元素宽度=元素高度=总宽度/列数
        self.elementWidth = kScreenWidth/self.columnCount;
        //scrollView内容宽度
        CGFloat scrollViewContentWidth = kScreenWidth * self.pageCount;
        //scrollView高度
        CGFloat scrollViewHeight = self.elementWidth*self.rowCount;
        self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, scrollViewHeight)];
        self.scrollView.contentSize = CGSizeMake(scrollViewContentWidth, scrollViewHeight);
        self.scrollView.delegate = self;
        //分页滚动
        self.scrollView.pagingEnabled = YES;
        //是否显示水平滚动条
        self.scrollView.showsHorizontalScrollIndicator = NO;
//        self.scrollView.backgroundColor = [UIColor cyanColor];
        [self addSubview:self.scrollView];
        
        
        UICollectionViewFlowLayout *collectionViewFlowLayout = [[UICollectionViewFlowLayout alloc]init];
        UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, scrollViewContentWidth, scrollViewHeight) collectionViewLayout:collectionViewFlowLayout];
        collectionView.backgroundColor = [UIColor clearColor];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        [self.scrollView addSubview:collectionView];
        
        self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.scrollView.frame), self.frame.size.width, 20)];
        self.pageControl.currentPage = 0;
        self.pageControl.numberOfPages = self.pageCount;
        [self.pageControl setCurrentPageIndicatorTintColor:kNCol_C];
        [self.pageControl setPageIndicatorTintColor:[UIColor grayColor]];
        [self addSubview:self.pageControl];
        
        
    }
    return self;
}
//滑动结束事件(要记得设置scrollView的代理为当前view，否则上神也救不了哇)
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat scrollViewW = scrollView.frame.size.width;
    CGFloat x = scrollView.contentOffset.x;
    int page = (x + scrollViewW/2)/scrollViewW;
    self.pageControl.currentPage = page;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *const homeTypeCollectionCell = @"homeTypeCollectionCell";
//    [collectionView registerClass:[HomeTypeCollectionViewCell class] forCellWithReuseIdentifier:homeTypeCollectionCell];
    [collectionView registerNib:[UINib nibWithNibName:@"HomeTypeCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:homeTypeCollectionCell];
    HomeTypeCollectionViewCell *colletionViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:homeTypeCollectionCell forIndexPath:indexPath];
//    CGFloat red = arc4random()%256/255.0;
//    CGFloat green = arc4random()%256/255.0;
//    CGFloat blue = arc4random()%256/255.0;
//    colletionViewCell.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1];
    if (indexPath.row > self.columnCount) {
        
    }
    colletionViewCell.homeTypeImg.image = [UIImage imageNamed:[self.dataArr[indexPath.row] objectForKey:@"image"]];
    colletionViewCell.homeTypeLabel.text = [self.dataArr[indexPath.row] objectForKey:@"title"];
    
    return colletionViewCell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArr.count;
}

//设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.elementWidth, self.elementWidth);
}
//设置section的高度
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
//    return CGSizeMake([UIScreen mainScreen].bounds.size.width, 80);
//}
//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    DLog(@"你点击了第%ld个cell",indexPath.row);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
