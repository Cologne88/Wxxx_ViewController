//
//  HomeViewController.m
//  Wxxx_ViewController
//
//  Created by 欲往无处去相逢 on 16/5/14.
//  Copyright © 2016年 WxxxYi. All rights reserved.
//

#import "HomeViewController.h"
#import "MeViewController.h"
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND

//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS

#import "Masonry.h"
@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    int padding = 10;
    UIView * viewblue = UIView.new;
    viewblue.backgroundColor = [UIColor  blueColor];
    viewblue.layer.borderColor = [UIColor redColor].CGColor;
    viewblue.layer.borderWidth =2;
    [self.view addSubview:viewblue];
    
    UIView *vieworange =[[UIView alloc] init];
    vieworange.backgroundColor = [UIColor orangeColor];
    vieworange.layer.borderWidth = 2 ;
    vieworange.layer.borderColor  = [UIColor greenColor].CGColor;
    [self.view addSubview:vieworange];
    
    UIView *viewbottom = [[UIView alloc] init];
    viewbottom.backgroundColor =[UIColor blackColor];
    viewbottom.layer.borderColor =[UIColor redColor].CGColor;
    viewbottom.layer.borderWidth = 2;
    [self.view addSubview:viewbottom];
    
    
    //    约束
    [viewblue makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.mas_topLayoutGuide).offset(padding*2);
        make.left.equalTo(self.view);
        make.width.equalTo(@60);
        make.height.equalTo(@30);
        
    }];
    
    [vieworange makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(viewblue.right).offset(padding);
        make.top.equalTo(self.mas_topLayoutGuide).offset(padding *2);
        make.right.equalTo(self.view).offset(padding * -2);
        make.height.equalTo(@30).priorityLow();
        
    }];
    
    [viewbottom makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(viewblue.bottom).offset(padding);
        make.width.equalTo(self.view.width);
        make.height.equalTo(@300);
    }];
    
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
