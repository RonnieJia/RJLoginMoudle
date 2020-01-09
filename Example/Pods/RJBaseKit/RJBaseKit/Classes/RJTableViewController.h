//
//  RJTableViewController.h
//  Pods-RJBaseKit_Example
//
//  Created by jia on 2020/1/7.
//

#import "RJViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface RJTableViewController : RJViewController
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

NS_ASSUME_NONNULL_END
