//
//  HeaderReusableView.m
//  IBDP_TY
//
//  Created by 樊泽斌 on 2017/9/2.
//  Copyright © 2017年 DTT. All rights reserved.
//

#import "HeaderReusableView.h"

@implementation HeaderReusableView

- (instancetype)init{
    if (self = [super init]) {
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    [self addSubview:self.imageV];
    [self addSubview:self.titleBackView];
    [self.titleBackView addSubview:self.titleLabel];
    
}


- (UIImageView *)imageV
{
    if(!_imageV){
        _imageV = [[UIImageView alloc] init];
        _imageV.frame = CGRectMake(0, 0, SCREEN_W, 235);
        _imageV.contentMode = UIViewContentModeScaleAspectFit;
        _imageV.image = [UIImage imageNamed:@"home"];
    }
    return _imageV;
}

- (UIView *)titleBackView
{
    if(!_titleBackView){
        _titleBackView = [[UIView alloc] init];
        _titleBackView.backgroundColor = [UIColor colorWithString:@"f5f5f5"];
        _titleBackView.frame = CGRectMake(0, 235, SCREEN_W, 40);
    }
    return _titleBackView;
    
}

- (UILabel *)titleLabel
{
    if(!_titleLabel){
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = [UIColor colorWithString:@"333333"];
        _titleLabel.frame = CGRectMake(17, 12, 200, 15);
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.text = @"五规合一";
        
        
    }
    return _titleLabel;
    
}


@end
