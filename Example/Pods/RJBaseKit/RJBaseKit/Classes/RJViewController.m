//
//  RJViewController.m

#import "RJViewController.h"

@interface RJViewController ()

@end

@implementation RJViewController
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    NSLog(@"RJViewController viewDidLoad");
}
- (void)rj_SetBackButton:(RJBackType)type {
    NSString *imageName;
    switch (type) {
        case RJBackTypeBackB:
            imageName = @"back001";
            break;
        case RJBackTypeBackW:
            imageName = @"back002";
            break;
        case RJBackTypeArrowB:
            imageName = @"back_black";
            break;
        case RJBackTypeArrowW:
            imageName = @"back_white";
            break;
        default:
            imageName = @"back001";
            break;
    }
    NSInteger scale = [[UIScreen mainScreen] scale];
    if (scale!=2 && scale!=3) {
        scale = 3;
    }
    NSString *imagePath = [NSString stringWithFormat:@"%@@%zdx.png",imageName,scale];
    
    NSBundle *currentBundle = [NSBundle bundleForClass:[self class]];
    //图片名称要写全称
    NSString *patch = [currentBundle pathForResource:imagePath ofType:nil inDirectory:@"RJBaseKit.bundle"];
    UIImage *image = [UIImage imageWithContentsOfFile:patch];
    NSLog(@"\n%@\n%@\n%@",imagePath, patch, image);
    
//    NSString *path = [[[NSBundle mainBundle] privateFrameworksPath] stringByAppendingPathComponent:@"RJBaseKit.framework/RJBaseKit.bundle"];
//    NSBundle *bundle = [NSBundle bundleWithPath:path];
//    UIImage *image = [UIImage imageWithContentsOfFile:[bundle pathForResource:imagePath ofType:nil]];
    /// not use framework
//    path = [[NSBundle mainBundle] pathForResource:@"RJBaseKit" ofType:@"bundle"];
//    bu = [NSBundle bundleWithPath:path];
//    image = [UIImage imageWithContentsOfFile:[bu pathForResource:imagePath ofType:nil]];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(_rjbackButtonAction)];

}
- (void)rj_SetBackButton {
    [self rj_SetBackButton:RJBackTypeBackB];
}

- (void)_rjbackButtonAction {
    if (self.navigationController.viewControllers.count > 1) {
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)rj_addKeyboardNotification {
    //注册键盘出现的通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(_rjkeyboardWasShown:)
                                                 name:UIKeyboardWillShowNotification object:nil];
    //注册键盘消失的通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(rj_keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
}
#pragma mark - 键盘弹出及收起
- (void)_rjkeyboardWasShown:(NSNotification *)noti {
    [self rj_keyboardWasShow:[[[noti userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height];
}

- (void)rj_keyboardWasShow:(CGFloat)keyboardHeight {}

- (void)rj_keyboardWillBeHidden:(NSNotification *)noti {}
- (void)rj_setScrollViewAdjustsInsets:(UIScrollView *)scrollView {
    if (scrollView && [scrollView isKindOfClass:[UIScrollView class]]) {
#ifdef __IPHONE_11_0
        if ([scrollView respondsToSelector:@selector(setContentInsetAdjustmentBehavior:)]) {
            scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
#else
        self.automaticallyAdjustsScrollViewInsets = NO;
#endif
    }
}
@end
