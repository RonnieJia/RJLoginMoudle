//
//  RJTableViewCell.h

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RJTableViewCell : UITableViewCell
+ (instancetype)rj_CellWithTableView:(UITableView *)tableView;
+ (instancetype)rj_NibCellWithTableView:(UITableView *)tableView;
+ (instancetype)rj_CellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style;
@end

NS_ASSUME_NONNULL_END
