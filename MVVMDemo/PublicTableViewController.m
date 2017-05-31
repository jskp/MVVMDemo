//
//  PublicTableViewController.m
//  MVVMDemo
//
//  Created by an on 17/5/31.
//  Copyright © 2017年 hua. All rights reserved.
//

#import "PublicTableViewController.h"
#import "PublicWeiboViewModelClass.h"
#import "PublicViewCell.h"
#import "SVProgressHUD.h"

@interface PublicTableViewController ()
@property (nonatomic ,strong)NSArray *messageArray;
@end

@implementation PublicTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"数据列表";
    self.view.backgroundColor = [UIColor orangeColor];
    [[[PublicWeiboViewModelClass alloc]init]fetchPublicWeibo];
    [self creteViewModelClass];
}
-(void)creteViewModelClass{
    PublicWeiboViewModelClass *ViewMOdel = [[PublicWeiboViewModelClass alloc]init];
    [ViewMOdel setBlockWithReturnBlock:^(id returnValue) {
        [SVProgressHUD dismiss];
        self.messageArray = (NSArray *)returnValue;
        [self.tableView reloadData];
        
    } WithFailureBlock:^{
        [SVProgressHUD dismiss];
    }];
    
    [ViewMOdel fetchPublicWeibo];
    [SVProgressHUD showWithStatus:@"正在获取用户信息……" maskType:SVProgressHUDMaskTypeBlack];

    UIView *footView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.tableFooterView = footView;
    
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.messageArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PublicViewCell *cell = [PublicViewCell getPublicViewCellWith:tableView];
    [cell setValueVithDic:self.messageArray[indexPath.row]];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 150;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PublicWeiboViewModelClass *publicViewModel = [[PublicWeiboViewModelClass alloc] init];
    [publicViewModel weiboDetailPublicModel:self.messageArray[indexPath.row] WithViewConrroller:self];
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
