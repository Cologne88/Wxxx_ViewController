//
//  pretendModel.h
//  Cocopod.Oc
//
//  Created by 欲往无处去相逢 on 16/5/3.
//  Copyright © 2016年 Macbook. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface pretendModel : NSObject
@property (nonatomic ,strong) NSString * nameL;
@property (nonatomic ,strong) NSString * heartL;
@property (nonatomic ,strong) UIImage * iconButton;

/*Cell高度*/
@property (nonatomic ,assign)CGFloat cellHeight;
+ (instancetype ) model;
@end
