//
//  RJTabBarController.m
//  Pods-RJBaseKit_Example
//
//  Created by jia on 2020/1/7.
//

#import "RJTabBarController.h"

@interface RJTabBarController ()

@end

@implementation RJTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL)canBecomeFirstResponder{
    return YES;
}

- (void)viewWillAppear:(BOOL)animated{
    
    [self becomeFirstResponder];
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated{
    [self becomeFirstResponder];
    [super viewDidAppear:animated];
}


@end
