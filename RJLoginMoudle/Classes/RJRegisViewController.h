//
//  RJRegisViewController.h
//  AFNetworking

#import "RJViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface RJRegisViewController : RJViewController
@property (nonatomic, assign) NSInteger showType;

@property(nonatomic, copy)void(^regisSuccess)(NSString *phone, NSString *pwd);

@end

NS_ASSUME_NONNULL_END
