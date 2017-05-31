//
//  ViewModelClass.h
//  MVVMDemo
//
//  Created by an on 17/5/31.
//  Copyright © 2017年 hua. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ReturnValueBlock) (id returnValue);
typedef void(^FailureBlock) ();
@interface ViewModelClass : NSObject
@property (nonatomic ,copy)ReturnValueBlock returnValue;
@property (nonatomic ,copy)FailureBlock failureBlock;

-(void)setBlockWithReturnBlock:(ReturnValueBlock )rereturnValue
              WithFailureBlock:(FailureBlock )failureBlock;

@end
