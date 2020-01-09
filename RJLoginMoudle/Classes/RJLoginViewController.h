//
//  RJLoginViewController.h
//  AFNetworking
//
//  Created by jia on 2020/1/9.
//

//#import "RJViewController.h"
#import <RJBaseKit/RJViewController.h>

typedef NS_ENUM(NSUInteger, ShowType) {
    ShowTypeDefault,
};

NS_ASSUME_NONNULL_BEGIN

@interface RJLoginViewController : RJViewController
@property (nonatomic, assign) ShowType showType;

@end

NS_ASSUME_NONNULL_END
