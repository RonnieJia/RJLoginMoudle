//
//  RJHTTPSessionManager+API.m
//  AFNetworking
//
//  Created by jia on 2020/1/19.
//

#import "RJHTTPSessionManager+API.h"
#import <RJUtils/RJFunctions.h>

@implementation RJHTTPSessionManager (API)
- (NSURLSessionDataTask *)fetchPhoneCode:(NSString *)phone type:(PhoneCodeType)type completion:(RJHTTPCompletion)completion {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    AddObjectForKeyIntoDictionary(phone, @"iphone", params);
    AddObjectForKeyIntoDictionary(@(type), @"type", params);
    return [self postPath:@"index/sendCode" paramters:params completion:completion];
}

- (NSURLSessionDataTask *)regis:(NSString *)phone code:(NSString *)code pwd:(NSString *)pwd completion:(RJHTTPCompletion)completion {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    AddObjectForKeyIntoDictionary(phone, @"user_tel", params);
    AddObjectForKeyIntoDictionary(code, @"code", params);
    AddObjectForKeyIntoDictionary(pwd, @"user_password", params);
    return [self postPath:@"index/reg" paramters:params completion:completion];
}

- (NSURLSessionDataTask *)loginWithPhone:(NSString *)phone pwd:(NSString *)pwd completion:(RJHTTPCompletion)completion {
    NSMutableDictionary *paramters = [NSMutableDictionary dictionary];
    AddObjectForKeyIntoDictionary(phone, @"user_tel", paramters);
    AddObjectForKeyIntoDictionary(pwd, @"password", paramters);
    return [self postPath:@"index/login" paramters:paramters completion:completion];
}

- (NSURLSessionDataTask *)lossPwdWithPhone:(NSString *)phone pwd:(NSString *)pwd code:(NSString *)code completion:(RJHTTPCompletion)completion {
    NSMutableDictionary *paramters = [NSMutableDictionary dictionary];
    AddObjectForKeyIntoDictionary(phone, @"phone", paramters);
    AddObjectForKeyIntoDictionary(pwd, @"pwd", paramters);
    AddObjectForKeyIntoDictionary(pwd, @"real_pwd", paramters);
    AddObjectForKeyIntoDictionary(code, @"code", paramters);
    return [self postPath:@"index/forget_pwd" paramters:paramters completion:completion];
}
@end
