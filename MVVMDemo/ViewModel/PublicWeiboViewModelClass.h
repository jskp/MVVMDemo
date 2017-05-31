//
//  PublicWeiboViewModelClass.h
//  MVVMDemo
//
//  Created by an on 17/5/31.
//  Copyright © 2017年 hua. All rights reserved.
//

#import "ViewModelClass.h"
#import <UIKit/UIKit.h>
#import "PublicModel.h"
@interface PublicWeiboViewModelClass : ViewModelClass

// 获取信息列表
-(void)fetchPublicWeibo;

// 跳转到微博详情页
-(void)weiboDetailPublicModel:(PublicModel *)publicModel
           WithViewConrroller:(UIViewController *)superController;

@end
