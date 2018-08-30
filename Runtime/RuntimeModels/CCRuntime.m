//
//  CCRuntime.m
//  test
//
//  Created by 刘冲 on 2018/8/19.
//  Copyright © 2018年 刘冲. All rights reserved.
//

#import "CCRuntime.h"
#import <objc/runtime.h>

NSString * const IsExchangeImplementations = @"IsExchangeImplementations";

@implementation CCRuntime

+ (void)load {
    // 是否替换方法
    BOOL isExchangeImplementations = [[NSUserDefaults standardUserDefaults] boolForKey:IsExchangeImplementations];
    if (isExchangeImplementations) {
        Class cls1 = NSClassFromString(@"CCModel1");        // 出现问题的类
        Class cls2 = NSClassFromString(@"CCModel2");        // 一个包含有空方法的类
        
        // 交换指定的类方法
        Method classMethod1 = class_getClassMethod(cls1, NSSelectorFromString(@"classMethod1"));
        Method classMethod2 = class_getClassMethod(cls2, NSSelectorFromString(@"classMethod2"));
        method_exchangeImplementations(classMethod1, classMethod2);
        
        // 交换指定的对象方法
        Method objectMethod1 = class_getInstanceMethod(cls1, NSSelectorFromString(@"objectMethod1"));
        Method objectMethod2 = class_getInstanceMethod(cls2, NSSelectorFromString(@"objectMethod2"));
        method_exchangeImplementations(objectMethod1, objectMethod2);
    }
}

+ (void)initialize {
    NSLog(@"initialize");
}

@end
