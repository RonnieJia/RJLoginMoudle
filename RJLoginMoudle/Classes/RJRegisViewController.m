//
//  RJRegisViewController.m
//  AFNetworking
#import "RJRegisViewController.h"
#import <Masonry/Masonry.h>
#import <RJNetworking/RJHTTPSessionManager+API.h>
#import <RJUtils/RJFunctions.h>

@interface RJRegisViewController ()
@property(nonatomic, strong)UIScrollView *scrollView;
@property(nonatomic, strong)NSTimer *timer;
@property(nonatomic, strong)UIButton *codeButton;
@property(nonatomic, assign)NSInteger time;


@property (nonatomic, weak)UITextField *phoneTF;
@property (nonatomic, weak)UITextField *codeTF;
@property (nonatomic, weak)UITextField *pwdTF;
@property (nonatomic, weak)UITextField *pwd2TF;
@end

@implementation RJRegisViewController
-(void)dealloc {
    NSLog(@"a");
}
-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    if (self.timer) {
        if ([self.timer isValid]) {
            [self.timer invalidate];
        }
        self.timer = nil;
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self rj_SetBackButton];
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resignTextFieldFirstResponse)]];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:self.scrollView];
    [self rj_setScrollViewAdjustsInsets:self.scrollView];
    [self rj_addKeyboardNotification];
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
    userName.placeholder = @"请输入手机号";
    userName.clearButtonMode = UITextFieldViewModeWhileEditing;
    userName.keyboardType = UIKeyboardTypeNumberPad;
    [self.scrollView addSubview:userName];
    self.phoneTF = userName;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 70, 30)];
    UIButton *fetchCodeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    fetchCodeBtn.frame = CGRectMake(0, 0, 70, 30);
    fetchCodeBtn.layer.cornerRadius = 3;
    fetchCodeBtn.clipsToBounds = YES;
    fetchCodeBtn.backgroundColor = [UIColor colorWithRed:0.3 green:0.1 blue:0.6 alpha:1];
    [fetchCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [fetchCodeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    fetchCodeBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [view addSubview:fetchCodeBtn];
    userName.rightView = view;
    userName.rightViewMode = UITextFieldViewModeAlways;
    [fetchCodeBtn addTarget:self action:@selector(fetchCodeAction:) forControlEvents:UIControlEventTouchUpInside];
    [fetchCodeBtn addTarget:self action:@selector(cancelButtonHighlighted:) forControlEvents:UIControlEventAllEvents];
    self.codeButton = fetchCodeBtn;
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(10, userName.bottom, self.view.width-20, 0.8)];
    line.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
    [self.scrollView addSubview:line];
    
    UITextField *code = [[UITextField alloc] initWithFrame:CGRectMake(15, line.bottom+10, self.view.width-30, 40)];
    code.keyboardType = UIKeyboardTypeNumberPad;
    code.textColor = [UIColor blackColor];
    code.font = [UIFont systemFontOfSize:14];
    code.placeholder = @"请输入验证码";
    code.clearButtonMode = UITextFieldViewModeWhileEditing;
    code.keyboardType = UIKeyboardTypeNumberPad;
    [self.scrollView addSubview:code];
    self.codeTF = code;
    
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
    self.pwdTF = pwdName;
    
    UITextField *pwdName2 = [[UITextField alloc] initWithFrame:CGRectMake(15, line3.bottom+10, self.view.width-30, 40)];
    pwdName2.secureTextEntry = YES;
    pwdName2.textColor = [UIColor blackColor];
    pwdName2.font = [UIFont systemFontOfSize:14];
    pwdName2.placeholder = @"请再次输入密码";
    pwdName2.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.scrollView addSubview:pwdName2];
    UIView *line4 = [[UIView alloc] initWithFrame:CGRectMake(10, pwdName2.bottom, self.view.width-20, 0.8)];
    line4.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
    [self.scrollView addSubview:line4];
    self.pwd2TF = pwdName2;
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.frame = CGRectMake(30, line4.bottom+30, self.view.width-60, 45);
    loginBtn.clipsToBounds = YES;
    loginBtn.layer.cornerRadius = 4;
    loginBtn.backgroundColor = [UIColor colorWithRed:0.3 green:0.1 blue:0.6 alpha:1];
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [loginBtn setTitle:@"注册" forState:UIControlStateNormal];
    [self.scrollView addSubview:loginBtn];
    if (self.view.height/2-10 > line4.bottom+30) {
        loginBtn.top = self.view.height/2-10;
    }
    [loginBtn addTarget:self action:@selector(regisUser) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *view2 = [[UIView alloc] init];
    [self.view addSubview:view2];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.height.mas_equalTo(30);
        make.centerX.mas_equalTo(self.view.width/2.0);
    }];
    CGFloat screenHeigth = CGRectGetHeight([UIScreen mainScreen].bounds);
    self.scrollView.height = screenHeigth-(screenHeigth>800?34:0)-50;
    
    UIButton *agreeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    agreeBtn.frame = CGRectMake(20, self.scrollView.bottom+10, 30, 30);
    [view2 addSubview:agreeBtn];
    NSInteger scale = [[UIScreen mainScreen] scale];
    if (scale!=2 && scale!=3) {
        scale = 3;
    }
    NSString *imagePath = [NSString stringWithFormat:@"block001@%zdx.png",scale];
    NSString *imagePath2 = [NSString stringWithFormat:@"block002@%zdx.png",scale];

    NSBundle *currentBundle = [NSBundle bundleForClass:[self class]];
    //图片名称要写全称
    NSString *patch = [currentBundle pathForResource:imagePath ofType:nil inDirectory:@"RJLoginMoudle.bundle"];
    NSString *patch2 = [currentBundle pathForResource:imagePath2 ofType:nil inDirectory:@"RJLoginMoudle.bundle"];
    UIImage *image = [UIImage imageWithContentsOfFile:patch];
    UIImage *image2 = [UIImage imageWithContentsOfFile:patch2];
    [agreeBtn setImage:image forState:UIControlStateNormal];
    [agreeBtn setImage:image2 forState:UIControlStateSelected];
    [agreeBtn setTitle:@"请阅读并同意" forState:UIControlStateNormal];
    
}
- (void)regisUser {
    NSArray *tfArr = @[self.phoneTF, self.codeTF, self.pwdTF, self.pwd2TF];
    BOOL isOk = YES;
    NSString *place;
    for (int i=0; i<tfArr.count; i++) {
        UITextField *tf = [tfArr objectAtIndex:i];
        if (tf.text.length==0) {
            place = tf.placeholder;
            isOk = NO;
            break;
        }
    }
    if (!isOk) {
        ShowAutoHideMBProgressHUD(self.view, place);
        return;
    }
    if (![self.pwdTF.text isEqualToString:self.pwd2TF.text]) {
        ShowAutoHideMBProgressHUD(self.view, @"两次密码输入不一致");
        return;
    }
    [self resignTextFieldFirstResponse];
    WaittingMBProgressHUD(self.view, @"");
    [kRJHTTPClient regis:self.phoneTF.text code:self.codeTF.text pwd:self.pwdTF.text completion:^(RJHTTPResponse * _Nonnull response) {
        if (response.responseCode == 101) {
            if (self.regisSuccess) {
                self.regisSuccess(self.phoneTF.text, self.pwdTF.text);
            }
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self.navigationController popViewControllerAnimated:YES];
            });
        }
        FailedMBProgressHUD(self.view, response.message);
        
    }];
}
- (void)fetchCodeAction:(UIButton *)btn {
    if (btn.selected) {
        return;
    }
    if (self.phoneTF.text.length==0) {
        ShowAutoHideMBProgressHUD(self.view, @"请输入手机号");
        return;
    }
    [kRJHTTPClient fetchPhoneCode:self.phoneTF.text type:PhoneCodeTypeRegis completion:^(RJHTTPResponse * _Nonnull response) {
        
    }];
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    self.time = 60;
    [btn setTitle:@"60s后获取" forState:UIControlStateSelected];
    btn.selected = YES;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(changeCodeButtonTime) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    [self.timer fire];
}

- (void)cancelButtonHighlighted:(UIButton *)btn {
    btn.highlighted = NO;
}

- (void)changeCodeButtonTime {
    if (self.time==0) {
        self.codeButton.selected = NO;
        [self.timer invalidate];
        self.timer = nil;
        return;
    }
    [self.codeButton setTitle:[NSString stringWithFormat:@"%zds后获取",self.time--] forState:UIControlStateSelected];
}

- (void)resignTextFieldFirstResponse {
    [self.view endEditing:YES];
}

@end
