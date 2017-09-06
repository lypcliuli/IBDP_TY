//
//  industryCollectionViewCell.h
//  IBDPGZ
//
//  Created by 樊泽斌 on 2017/8/19.
//  Copyright © 2017年 cattsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface industryCollectionViewCell : UICollectionViewCell

@property (nonatomic,strong) UIImageView *iconImageView;

@property (nonatomic,strong) UILabel *titleLabel;

@property (nonatomic,strong)NSDictionary* dataDic;


- (void)setDataForCell:(NSDictionary *)dic;

@end
