//
//  Target_RJLoginMoudle.m
//  AFNetworking
//
//  Created by jia on 2020/1/9.
//

#import "Target_RJLoginMoudle.h"
#import "RJLoginViewController.h"

@implementation Target_RJLoginMoudle
- (UIViewController *)Action_loginViewController:(NSDictionary *)param {
    RJLoginViewController *login = [[RJLoginViewController alloc] init];
    
    UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:login];
    navigation.modalPresentationStyle = 0;
    
    return navigation;
}
@end
