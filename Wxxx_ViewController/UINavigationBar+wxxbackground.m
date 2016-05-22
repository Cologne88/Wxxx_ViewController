//
//  UINavigationBar+wxxbackground.m
//  Wxxx_ViewController
//
//  Created by 欲往无处去相逢 on 16/5/15.
//  Copyright © 2016年 WxxxYi. All rights reserved.
//

#import "UINavigationBar+wxxbackground.h"
#import  <objc/runtime.h>
@implementation UINavigationBar (wxxbackground)
const static char * overlayKey;

- (UIView *)overlay{
    return objc_getAssociatedObject(self, &overlayKey);
    
}

- (void)setOverlay:(UIView *)view{
    objc_setAssociatedObject(self, &overlayKey, view, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}
- (void)wxx_setBackgroundColor : (UIColor *)backgroundColor{
    
    if (self.overlay ==nil) {
        //statues 是20    navBar是44
        self.overlay =[[UIView alloc] initWithFrame:CGRectMake(0, -20,
                                                               [UIScreen mainScreen].bounds.size.width, 64)];
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        [self setShadowImage:[UIImage new]];
        [self insertSubview:self.overlay atIndex:0];
        //用户可点击
        self.overlay.userInteractionEnabled = NO;

        
    }
    self.overlay.backgroundColor = backgroundColor;

    
}
- (void)wxx_setNormalgroundColor : (UIColor *)backgroundColor{
    self.overlay =[[UIView alloc] initWithFrame:CGRectMake(0, -20,
                                                           [UIScreen mainScreen].bounds.size.width, 64)];
    [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self setShadowImage:[UIImage new]];
    [self insertSubview:self.overlay atIndex:0];
    //用户可点击
    self.overlay.userInteractionEnabled = NO;
    self.overlay.backgroundColor = backgroundColor;


}
- (void)wxx_delOverlay{
    [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.overlay removeFromSuperview];
    self.overlay =nil;
}


@end
