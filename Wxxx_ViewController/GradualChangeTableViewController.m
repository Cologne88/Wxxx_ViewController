//
//  GradualChangeTableViewController.m
//  Wxxx_ViewController
//
//  Created by 欲往无处去相逢 on 16/5/15.
//  Copyright © 2016年 WxxxYi. All rights reserved.
//

#import "GradualChangeTableViewController.h"
#import "MJRefresh.h"
#import "HomeViewController.h"
#import "UINavigationBar+wxxbackground.h"
@interface GradualChangeTableViewController ()
@property (nonatomic ,copy) NSDictionary * dic;

@end

@implementation GradualChangeTableViewController

static NSString *reuseID = @"cellOfGradu";


- (void)wxxLoad{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    UIImageView * img1 =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
    img1.image =[UIImage imageNamed:@"img0"];
    self.tableView.tableHeaderView =img1;
    
    
    
     UIBarButtonItem * leftButton =[[UIBarButtonItem alloc] initWithTitle:@"WxxxYi" style:UIBarButtonItemStylePlain
                                                                   target:self action:@selector(leftPush)];
    leftButton.tintColor =[UIColor whiteColor];
    
    UIBarButtonItem * leftButton2 =[[UIBarButtonItem alloc] initWithTitle:@"与其在你" style:UIBarButtonItemStylePlain
                                                                  target:self action:@selector(leftPush)];
    leftButton2.tintColor =[UIColor whiteColor];
    
    [self.navigationItem setLeftBarButtonItems:@[leftButton,leftButton2]];
    
    
    UIBarButtonItem * rightButton =[[UIBarButtonItem alloc] initWithTitle:@"不要的世界里" style:UIBarButtonItemStylePlain
                                                                  target:nil action:nil];
    rightButton.tintColor =[UIColor whiteColor];
    [self.navigationItem setRightBarButtonItem:rightButton];

    
    
}
- (void)leftPush{
    HomeViewController *homeVC =[[HomeViewController alloc]init];
    NSLog(@"left打印");
    [self.navigationController pushViewController:homeVC animated:YES];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.tableView.delegate = self;

    
 }

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar wxx_delOverlay];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:reuseID];

    [self wxxLoad];
    
   
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
     return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
     return 50;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID forIndexPath:indexPath];
    cell.textLabel.text =[NSString stringWithFormat:@"%ld",(long)indexPath.row];
    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",(long)indexPath.row);
    
    HomeViewController *homeVC =[[HomeViewController alloc] init];
    [self.navigationController pushViewController:homeVC animated:YES];
    [self.navigationController.navigationBar wxx_delOverlay];
    
    self.tableView.delegate=nil;//取消下一个图的 滑动视图delegate
 
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
 
     UIColor *color = [UIColor colorWithRed:255/255.0
                                             green:192/255.0 blue:203/255.0 alpha:1 ];
    CGFloat offSetY =scrollView.contentOffset.y;
    if (offSetY >0) {
        CGFloat alpha =1- ((64 - offSetY)/64);
        [self.navigationController.navigationBar wxx_setBackgroundColor:[color colorWithAlphaComponent:alpha] ];
    }else{
        [self.navigationController.navigationBar wxx_setBackgroundColor:[color colorWithAlphaComponent:0.0] ];

    }
    
    
}

@end
