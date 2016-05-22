//
//  TabViewController.m
//  Wxxx_ViewController
//
//  Created by 欲往无处去相逢 on 16/5/14.
//  Copyright © 2016年 WxxxYi. All rights reserved.
//

#import "TabViewController.h"
#import "Masonry.h"
#import "WxxNavgationController.h"
#import "HomeViewController.h"
#import "MeViewController.h"
#import "MoreViewController.h"
#import "GradualChangeTableViewController.h"
#import "aTableViewController.h"

@interface TabViewController () <UITabBarDelegate>
@property (nonatomic,strong) HomeViewController *homeVC ;
@property (nonatomic,strong) MeViewController * meVC;
@property (nonatomic,strong) MoreViewController * moreVC;
@property (nonatomic ,strong) GradualChangeTableViewController * gradualVC;
@property (nonatomic ,strong) aTableViewController *aTableVC;
 @end

@implementation TabViewController


- (void)loadTab{
    self.view.backgroundColor = [UIColor whiteColor];

    self.homeVC = [[HomeViewController alloc] init];
    [self addChildViewController:self.homeVC withImage:[UIImage imageNamed:@"TabBar-Me-Green"]
                   selectedImage:[UIImage imageNamed:@"TabBar-Me-Green" ]
                      withTittle:@"戴荃"];
    self.meVC =[[MeViewController alloc] init];
    [self addChildViewController:  self.meVC withImage:[UIImage imageNamed:@"TabBar-Me-Green"]
                   selectedImage:[UIImage imageNamed:@"TabBar-Me-Green" ]
                      withTittle:@"薛之谦"];
    self.moreVC =[[MoreViewController alloc] init];
    [self addChildViewController: self.moreVC withImage:[UIImage imageNamed:@"TabBar-Me-Green"]
                   selectedImage:[UIImage imageNamed:@"TabBar-Me-Green" ]
                      withTittle:@"野生动物"];
    self.gradualVC =[[GradualChangeTableViewController alloc] init];
    [self addChildViewController:self.gradualVC withImage:[UIImage imageNamed:@"TabBar-Me-Green"]
                   selectedImage:[UIImage imageNamed:@"TabBar-Me-Green"]
                      withTittle:@"高贵气质"];
    
    self.aTableVC = [[aTableViewController alloc] init];
    [self addChildViewController:self.aTableVC
                       withImage:[UIImage imageNamed:@"TabBar-Me-Green"]
                   selectedImage:[UIImage imageNamed:@"TabBar-Me-Green"]
                      withTittle:@"王八蛋糖年给我滚"];
    
    
    [[UITabBar appearance] setBarTintColor:[UIColor colorWithRed:255/255.0
                                                           green:192/255.0 blue:203/255.0 alpha:1 ]];
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:255/255.0
                                                                  green:192/255.0 blue:203/255.0 alpha:1 ]];
 
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
}


- (void)addChildViewController:(UIViewController *)controller withImage:(UIImage *)image selectedImage:(UIImage *)selectImage withTittle:(NSString *)tittle{
    WxxNavgationController *nav = [[WxxNavgationController alloc] initWithRootViewController:controller];
    
    [nav.tabBarItem setImage:image];
    [nav.tabBarItem setSelectedImage:selectImage];
    //    nav.tabBarItem.title = tittle;
    //    controller.navigationItem.title = tittle;
    controller.title = tittle;//这句代码相当于上面两句代码
    [nav.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor],
                                             NSFontAttributeName:[UIFont fontWithName:@"Arial-BoldItalicMT" size:1]} forState:UIControlStateSelected];
    
    nav.tabBarItem.badgeValue =@"木乱很";
//    nav.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -3);
    [self addChildViewController:nav];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadTab];
    
}

 @end
