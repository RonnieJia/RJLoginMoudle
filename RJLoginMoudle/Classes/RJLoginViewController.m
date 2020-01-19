//
//  RJLoginViewController.m
//  AFNetworking
//
//  Created by jia on 2020/1/9.
//

#import "RJLoginViewController.h"
#import "RJRegisViewController.h"
#import "RJLossPWDViewController.h"

@interface RJLoginViewController ()
@property(nonatomic, weak)UITextField *nameTF;
@property(nonatomic, weak)UITextField *pwdTF;
@end

@implementation RJLoginViewController
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBarClean];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resignTextFieldFirstResponse)]];
    switch (self.showType) {
        case ShowTypeDefault:
            [self createDefaultView];
            break;
            
        default:
            break;
    }
}

- (void)setNavigationBarClean {
    self.navigationController.navigationBar.translucent = YES;
    
    CGRect rect = CGRectMake(0, 0, self.view.width, CGRectGetHeight([UIApplication sharedApplication].statusBarFrame)+44);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.clipsToBounds = YES;
    
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelBtn.frame = CGRectMake(0, 0, 44, 30);
    cancelBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:1] forState:UIControlStateNormal];
    [cancelBtn addTarget:self action:NSSelectorFromString(@"_rjbackButtonAction") forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:cancelBtn];
}

- (void)createDefaultView {
    UILabel *loginTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetHeight([UIApplication sharedApplication].statusBarFrame)+44, self.view.width, 30)];
    loginTitle.textColor = [UIColor blackColor];
    loginTitle.font = [UIFont boldSystemFontOfSize:24];
    loginTitle.textAlignment = NSTextAlignmentCenter;
    loginTitle.text = @"登录";
    [self.view addSubview:loginTitle];
    
    UITextField *userName = [[UITextField alloc] initWithFrame:CGRectMake(15, loginTitle.bottom+30, self.view.width-30, 40)];
    userName.textColor = [UIColor blackColor];
    userName.font = [UIFont systemFontOfSize:14];
    userName.placeholder = @"请输入用户名";
    userName.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:userName];
    self.nameTF = userName;
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(10, userName.bottom, self.view.width-20, 0.8)];
    line.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
    [self.view addSubview:line];
    
    UITextField *pwdName = [[UITextField alloc] initWithFrame:CGRectMake(15, line.bottom+10, self.view.width-30, 40)];
    pwdName.secureTextEntry = YES;
    pwdName.textColor = [UIColor blackColor];
    pwdName.font = [UIFont systemFontOfSize:14];
    pwdName.placeholder = @"请输入密码";
    pwdName.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:pwdName];
    self.pwdTF = pwdName;
    
    UIView *line2 = [[UIView alloc] initWithFrame:CGRectMake(10, pwdName.bottom, self.view.width-20, 0.8)];
    line2.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
    [self.view addSubview:line2];
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.frame = CGRectMake(30, self.view.height/2-10, self.view.width-60, 45);
    loginBtn.clipsToBounds = YES;
    loginBtn.layer.cornerRadius = 4;
    loginBtn.backgroundColor = [UIColor colorWithRed:0.3 green:0.1 blue:0.6 alpha:1];
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [self.view addSubview:loginBtn];
    
    UIButton *regisBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    regisBtn.frame = CGRectMake(30, loginBtn.bottom+10, 60, 30);
    regisBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [regisBtn setTitle:@"注册账号" forState:UIControlStateNormal];
    [regisBtn setTitleColor:[UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1] forState:UIControlStateNormal];
    regisBtn.contentHorizontalAlignment = 1;
    [self.view addSubview:regisBtn];
    [regisBtn addTarget:self action:@selector(pushToRegisViewController) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *lossPwdBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    lossPwdBtn.frame = CGRectMake(loginBtn.right-60, loginBtn.bottom+10, 60, 30);
    lossPwdBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [lossPwdBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    [lossPwdBtn setTitleColor:[UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1] forState:UIControlStateNormal];
    lossPwdBtn.contentHorizontalAlignment = 2;
    [self.view addSubview:lossPwdBtn];
    [lossPwdBtn addTarget:self action:@selector(pushToLossPWDViewController) forControlEvents:UIControlEventTouchUpInside];
}
- (void)pushToLossPWDViewController {
    RJLossPWDViewController *loss = [[RJLossPWDViewController alloc] init];
    [self.navigationController pushViewController:loss animated:YES];
}
- (void)pushToRegisViewController {
    RJRegisViewController *regis = [[RJRegisViewController alloc] init];
    __weak typeof(self)weakSelf = self;
    regis.regisSuccess = ^(NSString * _Nonnull phone, NSString * _Nonnull pwd) {
        weakSelf.nameTF.text = phone;
        weakSelf.pwdTF.text = pwd;
    };
    regis.showType = self.showType;
    [self.navigationController pushViewController:regis animated:YES];
}

- (void)resignTextFieldFirstResponse {
    [self.view endEditing:YES];
}

@end
