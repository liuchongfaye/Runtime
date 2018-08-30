//
//  CCModel1.m
//  test
//
//  Created by 刘冲 on 2018/8/19.
//  Copyright © 2018年 刘冲. All rights reserved.
//

#import "CCModel1.h"

@implementation CCModel1

+ (void)classMethod1 {
    NSLog(@"CCModel1 -> classMethod1");
}

- (void)objectMethod1 {
    NSLog(@"CCModel1 -> objectMethod1");
}

- (instancetype)init {
    if (self = [super init]) {
        // 调用方法
        [[self class] classMethod1];
        [self objectMethod1];
    }
    
    return self;
}

@end
