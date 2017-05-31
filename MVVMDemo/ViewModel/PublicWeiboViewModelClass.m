//
//  PublicWeiboViewModelClass.m
//  MVVMDemo
//
//  Created by an on 17/5/31.
//  Copyright © 2017年 hua. All rights reserved.
//

#import "PublicWeiboViewModelClass.h"
#import "PublicDetailViewController.h"
#import "AFNetworking.h"
#import "MJExtension.h"
#import "Tools.h"


#define REQUESTPUBLICURL @"https://api.weibo.com/2/statuses/public_timeline.json"
#define ACCESSTOKEN @"2.00NofgBD0L1k4pc584f79cc48SKGdD"
#define STATUSES @"statuses"
#define SOURCE @"source"
#define TOKEN @"access_token"
#define COUNT @"count"
#define CREATETIME @"created_at"
#define WEIBOID @"id"
#define WEIBOTEXT @"text"
#define USER @"user"
#define UID @"id"
#define HEADIMAGEURL @"profile_image_url"
#define USERNAME @"screen_name"



@implementation PublicWeiboViewModelClass




// 获取信息列表
-(void)fetchPublicWeibo{
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    NSDictionary *parameter = @{COUNT: @"100",TOKEN:ACCESSTOKEN};

    [sessionManager GET:REQUESTPUBLICURL parameters:parameter progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self fetchValueSuccessWithDic:responseObject];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (self.failureBlock) {
            self.failureBlock(error);
        }
        
    }];
    
}
-(void)fetchValueSuccessWithDic: (NSDictionary *) returnValue {
    //对从后台获取的数据进行处理，然后传给ViewController层进行显示
    
    NSArray *statuses = returnValue[STATUSES];
    NSMutableArray *publicModelArray = [[NSMutableArray alloc] initWithCapacity:statuses.count];
    
    for (int i = 0; i < statuses.count; i ++) {
        PublicModel *publicModel = [[PublicModel alloc] init];
        
        //设置时间
        NSDateFormatter *iosDateFormater=[[NSDateFormatter alloc]init];
        iosDateFormater.dateFormat=@"EEE MMM d HH:mm:ss Z yyyy";
        
        //必须设置，否则无法解析
        iosDateFormater.locale=[[NSLocale alloc]initWithLocaleIdentifier:@"en_US"];
        NSDate *date=[iosDateFormater dateFromString:statuses[i][CREATETIME]];
        
        //目的格式
        NSDateFormatter *resultFormatter=[[NSDateFormatter alloc]init];
        [resultFormatter setDateFormat:@"MM月dd日 HH:mm"];
        
        publicModel.date = [resultFormatter stringFromDate:date];
        publicModel.userName = statuses[i][USER][USERNAME];
        publicModel.text = statuses[i][WEIBOTEXT];
        publicModel.imageUrl = [NSURL URLWithString:statuses[i][USER][HEADIMAGEURL]];
        publicModel.userId = statuses[i][USER][UID];
        publicModel.weiboId = statuses[i][WEIBOID];
        publicModel.cellHeight = [Tools countTextHeight:publicModel.text width:80 font:14] + 190;
        [publicModelArray addObject:publicModel];
    }
    
    if (self.returnValue) {
        self.returnValue(publicModelArray);
    }
}

// 跳转到微博详情页
-(void)weiboDetailPublicModel:(PublicModel *)publicModel
           WithViewConrroller:(UIViewController *)superController{
    PublicDetailViewController *detailVC = [[PublicDetailViewController alloc]init];
    detailVC.publicModel = publicModel;
    [superController.navigationController pushViewController:detailVC animated:YES];

}
@end
