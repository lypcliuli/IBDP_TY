//
//  industryCollectionViewCell.m
//  IBDPGZ
//
//  Created by 樊泽斌 on 2017/8/19.
//  Copyright © 2017年 cattsoft. All rights reserved.
//

#import "industryCollectionViewCell.h"
#import "SDAutoLayout.h"

@implementation industryCollectionViewCell

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self customLayout];
}

- (void)setDataForCell:(NSDictionary *)dic{
    self.dataDic = dic;
    self.titleLabel.text = dic[@"menuName"];
    [self.iconImageView sd_setImageWithURL:dic[@"imageUrl"]];
}


#pragma mark - customeLayout
- (void)customLayout
{
    [self.contentView addSubview:self.iconImageView];
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY).offset(-8);
        make.centerX.equalTo(self.contentView.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(33, 33));
    }];
    
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconImageView.mas_bottom).offset(6);
        make.centerX.equalTo(self.contentView.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W/4-3, 33));
    }];
}



#pragma mark - property
- (UIImageView *)iconImageView
{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc]init];
        
    }
    return _iconImageView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textColor = [UIColor colorWithString:@"313131"];
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}


@end
