//
//  UINavigationBar+wxxbackground.h
//  Wxxx_ViewController
//
//  Created by 欲往无处去相逢 on 16/5/15.
//  Copyright © 2016年 WxxxYi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (wxxbackground)
@property (nonatomic,strong)UIView *overlay;
- (void)wxx_setBackgroundColor : (UIColor *)backgroundColor;
- (void)wxx_delOverlay;
- (void)wxx_setNormalgroundColor : (UIColor *)backgroundColor;
@end
