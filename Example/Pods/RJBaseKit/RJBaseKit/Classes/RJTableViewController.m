//
//  RJTableViewController.m
//  Pods-RJBaseKit_Example
//
//  Created by jia on 2020/1/7.
//

#import "RJTableViewController.h"

@interface RJTableViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation RJTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [@[] mutableCopy];
    }
    return _dataArray;
}
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableView.delegate = self;
        _tableView.dataSource=self;
    }
    return _tableView;
}
@end
