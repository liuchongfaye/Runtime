//
//  CCModel1.h
//  test
//
//  Created by 刘冲 on 2018/8/19.
//  Copyright © 2018年 刘冲. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCModel1 : NSObject

@property (nonatomic, copy)    NSString *name;
@property (nonatomic, assign)  NSInteger gender;
@property (nonatomic, assign)  long age;
@property (nonatomic, assign)  float floatNumber;
@property (nonatomic, assign)  double doubleNumber;
@property (nonatomic, assign)  BOOL isMan;
@property (nonatomic, strong)  NSObject *object;

@end
