//
//  RJRegisViewController.m
//  AFNetworking
#import "RJRegisViewController.h"

@interface RJRegisViewController ()
@property(nonatomic, strong)UIScrollView *scrollView;
@end

@implementation RJRegisViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self rj_SetBackButton];
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resignTextFieldFirstResponse)]];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:self.scrollView];
    [self rj_setScrollViewAdjustsInsets:self.scrollView];
    switch (self.showType) {
        case 0:
            [self createDefaultView];
            break;
            
        default:
            break;
    }
}

- (void)createDefaultView {
    UILabel *regisTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetHeight([UIApplication sharedApplication].statusBarFrame)+44, self.view.width, 30)];
    regisTitle.textColor = [UIColor blackColor];
    regisTitle.font = [UIFont boldSystemFontOfSize:24];
    regisTitle.textAlignment = NSTextAlignmentCenter;
    regisTitle.text = @"注册";
    [self.scrollView addSubview:regisTitle];
    
    UITextField *userName = [[UITextField alloc] initWithFrame:CGRectMake(15, regisTitle.bottom+30, self.view.width-30, 40)];
    userName.textColor = [UIColor blackColor];
    userName.font = [UIFont systemFontOfSize:14];
    userName.placeholder = @"请输入用户名";
    userName.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.scrollView addSubview:userName];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(10, userName.bottom, self.view.width-20, 0.8)];
    line.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
    [self.scrollView addSubview:line];
    
    UITextField *code = [[UITextField alloc] initWithFrame:CGRectMake(15, line.bottom+10, self.view.width-30, 40)];
    code.secureTextEntry = YES;
    code.textColor = [UIColor blackColor];
    code.font = [UIFont systemFontOfSize:14];
    code.placeholder = @"请输入密码";
    code.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.scrollView addSubview:code];
    
    UIView *line2 = [[UIView alloc] initWithFrame:CGRectMake(10, code.bottom, self.view.width-20, 0.8)];
    line2.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
    [self.scrollView addSubview:line2];
    
    UITextField *pwdName = [[UITextField alloc] initWithFrame:CGRectMake(15, line2.bottom+10, self.view.width-30, 40)];
    pwdName.secureTextEntry = YES;
    pwdName.textColor = [UIColor blackColor];
    pwdName.font = [UIFont systemFontOfSize:14];
    pwdName.placeholder = @"请输入密码";
    pwdName.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.scrollView addSubview:pwdName];
    UIView *line3 = [[UIView alloc] initWithFrame:CGRectMake(10, pwdName.bottom, self.view.width-20, 0.8)];
    line3.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
    [self.scrollView addSubview:line3];
    
    UITextField *pwdName2 = [[UITextField alloc] initWithFrame:CGRectMake(15, line2.bottom+10, self.view.width-30, 40)];
    pwdName2.secureTextEntry = YES;
    pwdName2.textColor = [UIColor blackColor];
    pwdName2.font = [UIFont systemFontOfSize:14];
    pwdName2.placeholder = @"请再次输入密码";
    pwdName2.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.scrollView addSubview:pwdName2];
    UIView *line4 = [[UIView alloc] initWithFrame:CGRectMake(10, pwdName2.bottom, self.view.width-20, 0.8)];
    line4.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
    [self.scrollView addSubview:line4];
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.frame = CGRectMake(30, line4.bottom+30, self.view.width-60, 45);
    loginBtn.clipsToBounds = YES;
    loginBtn.layer.cornerRadius = 4;
    loginBtn.backgroundColor = [UIColor colorWithRed:0.3 green:0.1 blue:0.6 alpha:1];
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [loginBtn setTitle:@"注册" forState:UIControlStateNormal];
    [self.scrollView addSubview:loginBtn];
    
}

- (void)resignTextFieldFirstResponse {
    [self.view endEditing:YES];
}

@end
