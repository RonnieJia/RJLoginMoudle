//
//  RJ2ViewController.m
//  RJLoginMoudle_Example
//
//  Created by jia on 2020/1/9.
//  Copyright © 2020 Ronniejia. All rights reserved.
//

#import "RJ2ViewController.h"
//#import <RJLoginMoudle/RJLoginViewController.h>
#import <CTMediator.h>

@interface RJ2ViewController ()

@end

@implementation RJ2ViewController
- (IBAction)btnAction:(id)sender {
    UIViewController *viewcontroller = [[CTMediator sharedInstance] performTarget:@"RJLoginMoudle" action:@"loginViewController" params:nil shouldCacheTarget:NO];
    [self presentViewController:viewcontroller animated:YES completion:^{
        
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
