//
//  RJTableViewCell.m

#import "RJTableViewCell.h"

@implementation RJTableViewCell
+ (instancetype)rj_CellWithTableView:(UITableView *)tableView {
    return [self rj_CellWithTableView:tableView style:UITableViewCellStyleDefault];
}

+ (instancetype)rj_CellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style {
    NSString *identifier = NSStringFromClass([self class]);
    RJTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[self alloc] initWithStyle:style reuseIdentifier:identifier];
    }
    return cell;
}

+ (instancetype)rj_NibCellWithTableView:(UITableView *)tableView {
    NSString *cellIndentifier = NSStringFromClass([self class]);
    RJTableViewCell *cell = (RJTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if(nil == cell) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:cellIndentifier owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    return cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
