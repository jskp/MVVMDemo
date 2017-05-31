//
//  PublicModel.h
//  MVVMDemo
//
//  Created by an on 17/5/31.
//  Copyright © 2017年 hua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PublicModel : NSObject
@property (strong, nonatomic) NSString *userId;
@property (strong, nonatomic) NSString *weiboId;
@property (strong, nonatomic) NSString *userName;
@property (strong, nonatomic) NSURL *imageUrl;
@property (strong, nonatomic) NSString *date;
@property (strong, nonatomic) NSString *text;
@property (assign, nonatomic) NSInteger cellHeight;

@end
