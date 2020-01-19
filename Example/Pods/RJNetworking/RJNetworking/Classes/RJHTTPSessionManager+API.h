//
//  RJHTTPSessionManager+API.h
//  AFNetworking
//
//  Created by jia on 2020/1/19.
//


#import "RJHTTPSessionManager.h"

typedef NS_ENUM(NSUInteger, PhoneCodeType) {
    PhoneCodeTypeRegis = 1,
    PhoneCodeTypeLossPwd = 2,
    PhoneCodeTypeResetPwd = 3,
    PhoneCodeTypeChangeMobile = 4,
};


NS_ASSUME_NONNULL_BEGIN

@interface RJHTTPSessionManager (API)

/// 获取验证码
/// @param phone 手机号
/// @param type 验证码类型
- (NSURLSessionDataTask *)fetchPhoneCode:(NSString *)phone type:(PhoneCodeType)type completion:(RJHTTPCompletion)completion;

/// 用户注册
/// @param phone 手机号
/// @param code 验证码
/// @param pwd 密码
- (NSURLSessionDataTask *)regis:(NSString *)phone code:(NSString *)code pwd:(NSString *)pwd completion:(RJHTTPCompletion)completion;

/// 用户登录
/// @param phone 手机号
/// @param pwd 密码
- (NSURLSessionDataTask *)loginWithPhone:(NSString *)phone pwd:(NSString *)pwd completion:(RJHTTPCompletion)completion;

/// 忘记密码
/// @param phone 手机号
/// @param pwd 密码
/// @param code 验证码
- (NSURLSessionDataTask *)lossPwdWithPhone:(NSString *)phone pwd:(NSString *)pwd code:(NSString *)code completion:(RJHTTPCompletion)completion;
@end

NS_ASSUME_NONNULL_END
