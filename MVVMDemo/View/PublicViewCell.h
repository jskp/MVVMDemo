//
//  PublicViewCell.h
//  MVVMDemo
//
//  Created by an on 17/5/31.
//  Copyright © 2017年 hua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PublicModel.h"

@interface PublicViewCell : UITableViewCell
-(void)setValueVithDic:(PublicModel *)publicModel;
+(PublicViewCell *)getPublicViewCellWith:(UITableView *)tableView;
@end
