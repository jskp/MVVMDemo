//
//  PublicDetailViewController.m
//  MVVMDemo
//
//  Created by an on 17/5/31.
//  Copyright © 2017年 hua. All rights reserved.
//

#import "PublicDetailViewController.h"
#import "PublicModel.h"
@interface PublicDetailViewController ()

@end

@implementation PublicDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
 
}
-(void)setPublicModel:(PublicModel *)publicModel{
    
    _publicModel = publicModel;
    
}
@end
