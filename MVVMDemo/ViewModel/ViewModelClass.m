//
//  ViewModelClass.m
//  MVVMDemo
//
//  Created by an on 17/5/31.
//  Copyright © 2017年 hua. All rights reserved.
//

#import "ViewModelClass.h"

@implementation ViewModelClass

-(void)setBlockWithReturnBlock:(ReturnValueBlock )rereturnValue
              WithFailureBlock:(FailureBlock )failureBlock{
    
    _returnValue = rereturnValue;
    _failureBlock = failureBlock;
    
}

@end
