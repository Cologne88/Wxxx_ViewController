//
//  CellSizeTableViewController.m
//  Cocopod.Oc
//
//  Created by 欲往无处去相逢 on 16/5/3.
//  Copyright © 2016年 Macbook. All rights reserved.
//

#import "CellSizeTableViewController.h"
#import "CellTableViewCell.h"
#import "pretendModel.h"
#import "ScrollViewDemo.h"
#import "MJRefresh.h"

@interface CellSizeTableViewController ()
@property (nonatomic, copy) NSMutableArray *dataArray;
@end
static NSString* identfyString =  @"Cell";
@implementation CellSizeTableViewController


- (NSMutableArray *)dataArray {
    
    if (_dataArray ==nil) {
        _dataArray =[NSMutableArray array];
        
        for (int i=0; i<20; i++) {
            pretendModel *Model =[pretendModel model];
            [_dataArray addObject: Model];
        }
    }
    return _dataArray;
}
- (void)load {
    self.tableView.delegate =self;
    self.tableView.dataSource =self;
    
    ScrollViewDemo * scrollViewVC = [[ScrollViewDemo alloc] init];
    [self addChildViewController:scrollViewVC];
    self.tableView.tableHeaderView = scrollViewVC.view;
    
    
    [self.navigationController.navigationBar setBackgroundColor:[UIColor clearColor] ];
    
    //下拉刷新
    self.tableView.mj_header =[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self loadNewData];
        });
    }];
    
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    
    //上拉刷新
    self.tableView.mj_footer = [MJRefreshBackNormalFooter  footerWithRefreshingBlock:^{
       
        [self loadMoreData];
    }];
    
    
}

- (void)loadNewData{
    for (int i =0; i<5; i++) {
        pretendModel *Model = [pretendModel model];
        [self.dataArray insertObject: Model atIndex:0];
        
    }
    [self.tableView reloadData];
    
    [self.tableView.mj_header endRefreshing];
}

- (void)loadMoreData{
    for (int i =0; i<5; i++) {
        pretendModel *Model = [pretendModel model];
        [self.dataArray addObject:Model];
    }
    [self.tableView reloadData ];
    [self.tableView.mj_footer endRefreshing];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self load];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1 ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArray.count ;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView registerClass:[CellTableViewCell  class] forCellReuseIdentifier:identfyString];

    CellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identfyString forIndexPath:indexPath];
    
    
    return cell;
}


#pragma mark - 代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    pretendModel * model = self.dataArray[indexPath.row];
    return model.cellHeight;
    
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
        NSLog(@"%ld",(long)indexPath.row);
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
