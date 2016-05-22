//
//  aTableViewCell.m
//  Wxxx_ViewController
//
//  Created by 欲往无处去相逢 on 16/5/17.
//  Copyright © 2016年 WxxxYi. All rights reserved.
//

#import "aTableViewCell.h"

@interface aTableViewCell()
@property (nonatomic ,strong) UILabel * nameL;
@property (nonatomic ,strong) UILabel * heartL;
@property (nonatomic ,strong) UIButton * iconButton;

@end
@implementation aTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self loadcell];
    }
    return self;
}

- (void)loadcell{
    int padding = 10;
    
    self.nameL = [[UILabel alloc] init];
    [self.contentView addSubview: self.nameL];
    self.heartL = [[UILabel alloc] init];
    [self.contentView addSubview:self.heartL];
    self.iconButton = [[UIButton alloc] init];
    self.iconButton.backgroundColor = [UIColor blackColor];
    [self.contentView addSubview:self.iconButton];
    
    
    [self.iconButton makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.left).offset(padding);
        make.width.height.equalTo(@30);
        make.top.equalTo(self.contentView.top);

    }];
    
    [self.nameL makeConstraints:^(MASConstraintMaker *make) {
    
    }];
    
}



@end
