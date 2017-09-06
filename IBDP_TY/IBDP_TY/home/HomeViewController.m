//
//  HomeViewController.m
//  IBDP_TY
//
//  Created by 樊泽斌 on 2017/9/2.
//  Copyright © 2017年 DTT. All rights reserved.
//

#import "HomeViewController.h"
#import "industryCollectionViewCell.h"
#import "HeaderReusableView.h"


@interface HomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong)UICollectionView* collectionView;

@property (nonatomic,strong)NSDictionary* titleDic;

@property (nonatomic,strong)HeaderReusableView* header1;

@end
static NSString *const headerId = @"headerId";

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"太原市驾驶舱";
    
    
    [self.collectionView registerClass:[HeaderReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderReusableView"];
    
    //注册 sectionHeader、sectionFooter
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerId];
    
    [self createTitleDic];
    
    [self setupUI];
    [self.collectionView reloadData];
    
    
}
- (void)createTitleDic{
    NSDictionary * dic = @{
                           @"0":@[@"行政界线",@"影像图",@"路网图",@"城乡规划图",@"土地利用总体规划图",@"三区七线图",@"产业规划"],
                           @"1":@[@"高校就业",@"就业扶贫",@"创业就业",@"急需紧缺人才",@"社会保障卡",@"社会保险"],
                           @"2":@[@"增值税",@"消费税",@"企业所得税",@"外商投资和外国企业所得税",@"个人所得税",@"车辆购置税"],
                           @"3":@[@"税收计划",@"税收分析",@"政策法规"],
                           @"4":@[@"住宅开发",@"拆迁安置",@"资金管理",@"房产市场"]
                           };
    self.titleDic = dic;
}

- (void)setupUI{
    [self.view addSubview:self.collectionView];
    self.collectionView.sd_layout.leftSpaceToView(self.view, 0).topSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).bottomSpaceToView(self.view, 0);
    
}


#pragma mark  ------collectionViewdelegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 5;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    NSArray * arr = self.titleDic[[NSString stringWithFormat:@"%ld",section]];
    
    return arr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    industryCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"industryCollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    NSArray * arr = self.titleDic[[NSString stringWithFormat:@"%ld",indexPath.section]];
    cell.layer.borderColor = [UIColor colorWithString:@"f5f5f5"].CGColor;
    cell.layer.borderWidth = 0.8;
    
//    [cell setDataForCell:self.dataListArr[indexPath.row]];
    cell.titleLabel.text = arr[indexPath.row];
    cell.iconImageView.image = [UIImage imageNamed:arr[indexPath.row]];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(SCREEN_W / 4, SCREEN_W /4);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    BRNSLog(@"%ld",indexPath.row);
}


#pragma mark headerView 的高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return CGSizeMake(SCREEN_W, 275);
    }else if (section ==1){
        return CGSizeMake(SCREEN_W, 40);
    }else if (section ==2){
        return CGSizeMake(SCREEN_W, 40);
    }else if (section ==3){
        return CGSizeMake(SCREEN_W, 40);
    }else if (section ==4){
        return CGSizeMake(SCREEN_W, 40);
    }
    return CGSizeMake(SCREEN_W, 40);
}

//设置单元格间的横向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
//    if (section == 1 || section ==3) {
//        return 0;
//    }
    return 0;
}
//设置纵向的行间距
- (CGFloat) collectionView:(UICollectionView *)collectionView
                    layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
//    if (section == 1 || section ==3) {
//        return 0;
//    }
    return 0;
}

#pragma mark 设置段头段尾
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section ==0) {
        if (self.header1 ==nil) {
            self.header1 = [_collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"HeaderReusableView" forIndexPath:indexPath];
//            self.header1.delegate = self;
            
        }
        return self.header1;
    }else{
        UICollectionReusableView *headerView = [self.collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerId forIndexPath:indexPath];
        if(headerView == nil)
        {
            headerView = [[UICollectionReusableView alloc] init];
        }
        headerView.backgroundColor = [UIColor colorWithString:@"#F9F9F9"];
        
        [[headerView subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
        
        UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(17, 13, 200, 15)];
        titleLabel.font = [UIFont systemFontOfSize:15];
        titleLabel.textColor = [UIColor colorWithString:@"333333"];
        [headerView addSubview:titleLabel];
        if (indexPath.section == 1) {
            titleLabel.text = @"人社局";
        }else if (indexPath.section ==2){
            titleLabel.text = @"国税局";
        }else if (indexPath.section == 3){
            titleLabel.text = @"地税局";
        }else if (indexPath.section ==4){
            titleLabel.text = @"房产局";
        }
        
        return headerView;
    }
}








- (UICollectionView *)collectionView
{
    if(!_collectionView){
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.scrollEnabled = YES;
        _collectionView.bounces = YES;
        _collectionView.backgroundColor = [UIColor colorWithString:@"ffffff"];
        
        
        //注册cell
        [_collectionView registerClass:[industryCollectionViewCell class] forCellWithReuseIdentifier:@"industryCollectionViewCell"];
        
    }
    return _collectionView;
    
}



















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
