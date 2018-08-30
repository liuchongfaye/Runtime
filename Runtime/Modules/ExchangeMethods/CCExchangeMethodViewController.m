//
//  CCExchangeMethodViewController.m
//  Runtime
//
//  Created by 刘冲 on 2018/8/30.
//  Copyright © 2018年 lc. All rights reserved.
//

#import "CCExchangeMethodViewController.h"
#import "CCModel1.h"
#import "CCRuntime.h"
@import Masonry;

@interface CCExchangeMethodViewController ()

@end

@implementation CCExchangeMethodViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    // 测试是否替换成功,在init方法里调用了一个类方法和实例方法
    CCModel1 *model = [[CCModel1 alloc] init];    
    
    BOOL isExchange = [[NSUserDefaults standardUserDefaults] boolForKey:IsExchangeImplementations];
    // 控制是否替换
    UISwitch *switchControl = [[UISwitch alloc] init];
    switchControl.on = isExchange;
    [switchControl addTarget:self action:@selector(exchangeImplementations:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:switchControl];
    
    [switchControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
}

- (void)exchangeImplementations:(UISwitch *)switchControl {
    switchControl.on = !switchControl.on;
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:switchControl.on forKey:IsExchangeImplementations];
    [userDefaults synchronize];
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"设置成功，重启查看控制台打印结果！" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [self presentViewController:alertController animated:YES completion:nil];                                          
}


@end
