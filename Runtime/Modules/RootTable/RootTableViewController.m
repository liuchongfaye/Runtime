//
//  RootTableViewController.m
//  Runtime
//
//  Created by 刘冲 on 2018/8/29.
//  Copyright © 2018年 lc. All rights reserved.
//

#import "RootTableViewController.h"
#import "RootTableViewCell.h"

// VC
#import "CCAddMethodViewController.h"
#import "CCExchangeMethodViewController.h"

@interface RootTableViewController ()

@property (nonatomic, strong) NSArray<NSString *> *dataSource;

@end

@implementation RootTableViewController

static NSString *const CellID = @"CellID";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Runtime学习";
    
    [self.tableView registerClass:[RootTableViewCell class] forCellReuseIdentifier:CellID];
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    self.tableView.estimatedRowHeight = 100.0;
    self.dataSource = @[@"Runtime(1):获取所有属性+为一个类增加一个方法",
                        @"Runtime(2):替换类方法与实例方法(可解决线上崩溃bug)",];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RootTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID forIndexPath:indexPath];
    
    cell.titleLabel.text = self.dataSource[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0: {
            CCAddMethodViewController *addMethodController = [[CCAddMethodViewController alloc] init];
            [self.navigationController pushViewController:addMethodController animated:YES];
            
            break;
        }
        case 1: {
            CCExchangeMethodViewController *exchangeMethodController = [[CCExchangeMethodViewController alloc] init];
            [self.navigationController pushViewController:exchangeMethodController animated:YES];
            
            break;
        }
        case 2: {
            
            break;
        }
        case 3: {
            
            break;
        }
        case 4: {
            
            break;
        }
        default:
            break;
    }
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
