//
//  pretendModel.m
//  Cocopod.Oc
//
//  Created by 欲往无处去相逢 on 16/5/3.
//  Copyright © 2016年 Macbook. All rights reserved.
//

#import "pretendModel.h"

@implementation pretendModel

+ (instancetype ) model{
    pretendModel *model =[[pretendModel alloc] init];
    model.nameL = @"假装有数据呢";
    model.iconButton =[UIImage imageNamed:@"img0.jpg"];
    model.heartL = @"iOS7有两个很有用的属性，topLayoutGuide和bottomLayoutGuide，这个两个主要是方便获取UINavigationController和UITabBarController的头部视图区域和底部视图区域。iOS7有两个很有用的属性，topLayoutGuide和bottomLayoutGuide，这个两个主要是方便获取UINavigationController和UITabBarController的头部iOS7有两个很有用的属性，topLayoutGuide和bottomLayoutGuide，这个两个主要是方便获取UINavigationController和UITabBarController的头部";
     
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
    //建议再加1，因为算出来的高度可能包含小数，在显示的时候有可能会被省略造成显示不完成

    model.cellHeight = 21 + 3* marginWidth + detaiHeight+ 1;
    return model;
}
@end
