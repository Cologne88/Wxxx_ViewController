//
//  CellTableViewCell.m
//  Cocopod.Oc
//
//  Created by 欲往无处去相逢 on 16/5/3.
//  Copyright © 2016年 Macbook. All rights reserved.
//

#import "CellTableViewCell.h"
#import "pretendModel.h"
@interface CellTableViewCell()
@property (nonatomic ,strong) UILabel * nameL;
@property (nonatomic ,strong) UILabel * heartL;
@property (nonatomic ,strong) UIButton * iconButton;
@end
@implementation CellTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self loadcell];
    }
    return self;
}

- (void)loadcell{
    pretendModel *model =[pretendModel  model];
    self.nameL =[[UILabel alloc] init];
    self.nameL.text = model.nameL;
    [self.contentView addSubview:self.nameL];
    self.nameL.lineBreakMode = NSLineBreakByWordWrapping;
    self.nameL.numberOfLines = 0;
    
    self.heartL =[[UILabel alloc] init];
    self.heartL.text = model.heartL;
    self.heartL.lineBreakMode = NSLineBreakByWordWrapping;
    self.heartL.numberOfLines = 0;
    [self.contentView addSubview: self.heartL];
    
    self.iconButton =[UIButton buttonWithType:UIButtonTypeCustom];
    [self.iconButton setImage:model.iconButton forState:UIControlStateNormal];
    [self.iconButton addTarget:self  action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
//    self.iconButton.backgroundColor =[UIColor blueColor];
    [self.contentView addSubview: self.iconButton];
    
    [self.iconButton makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.left);
        make.height.equalTo(@60);
        make.width.equalTo(@60);
        make.top.equalTo(self.contentView.top).offset(30);
     }];
    
    [self.nameL  makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.top).offset(30);
        make.left.equalTo(self.iconButton.right).offset(10);
        make.height.equalTo(10);
    }];
    
    [self.heartL makeConstraints:^(MASConstraintMaker *make) {
       
        
        CGFloat screenWidth =[UIScreen mainScreen].bounds.size.width;
        CGFloat imgWidth = 50;
        CGFloat marginWidth = 8;
        CGFloat detailWidth = screenWidth -imgWidth - 3*marginWidth;
        
        NSDictionary * attributes = @{NSFontAttributeName : [UIFont systemFontOfSize:17.0]};
        
        CGSize contentSize = [model.heartL boundingRectWithSize:CGSizeMake(detailWidth, MAXFLOAT)
                                                        options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
                                                     attributes:attributes
                                                        context:nil].size;
        CGFloat detaiHeight = contentSize.height;

        make.top.equalTo(self.nameL).offset(30);
        make.left.equalTo(self.iconButton.right).offset(10);
        make.right.equalTo(self.contentView.right);
        make.height.equalTo([NSNumber numberWithDouble:detaiHeight]);
        make.width.equalTo(detailWidth);
    }];
    
}



@end
