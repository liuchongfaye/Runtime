//
//  CCAddMethodViewController.m
//  Runtime
//
//  Created by 刘冲 on 2018/8/29.
//  Copyright © 2018年 lc. All rights reserved.
//

#import "CCAddMethodViewController.h"
#import <objc/runtime.h>
#import "CCModel1.h"
@import Masonry;

@interface CCAddMethodViewController ()

@end

@implementation CCAddMethodViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    // 获取一个类的所有属性property
    unsigned int count = 0;     // 所有属性的个数
    objc_property_t *propertyList = class_copyPropertyList([CCModel1 class], &count);       // 所有属性的列表
    for (unsigned int index = 0; index < count; index++) {
        // 遍历所有属性
        objc_property_t property = propertyList[index];
        const char *propertyName = property_getName(property);
        const char *propertyAttributes = property_getAttributes(property);
        
        /**
            propertyAttributes是关于属性声明的一些配置，比如属性类型，nonatomic还是atomic，retain还是weak等
            详细对照表可见：ropertyAttributes里的第2，3图
         */
        
        NSLog(@"类为:%@，属性的字符串是:%s, 属性相关信息:%s", NSStringFromClass([CCModel1 class]), propertyName, propertyAttributes);
        
        unsigned int attributesCount = 0;
        objc_property_attribute_t *attributesList = property_copyAttributeList(property, &attributesCount);
        for (unsigned int attributeIndex = 0; attributeIndex < attributesCount; attributeIndex++) {
            /**
             objc_property_attribute_t是一个结构体，有两个：name和value,常见对照表详见：Assets里的propertyAttributes里的第一张图
             */
            objc_property_attribute_t property_attribute_t = attributesList[attributeIndex];
            NSLog(@"name:%s,value:%s", property_attribute_t.name, property_attribute_t.value);
        }
    }
    
    /**
     为一个类增加方法:为类增加方法比较复杂，但是跟上面说到的attribute_t相关
     详细的源码可见：https://github.com/liuchongfaye/NSUserDefaultsModel
    */
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
