//
//  RJHTTPResponse.m
//  AFNetworking
//
//  Created by jia on 2020/1/3.
//

#import "RJHTTPResponse.h"

static NSString *const kRJResponseCodeKey = @"code";
static NSString *const kRJResponseMsgKey = @"message";
static NSString *const kRJResponseObjKey = @"result";

@implementation RJHTTPResponse
+ (RJHTTPResponse *)response:(id)obj {
    RJHTTPResponse *response = [[RJHTTPResponse alloc] init];
    if (!obj || [obj isKindOfClass:[NSError class]]) {
        [response responseWithError:obj];
    } else if ([obj isKindOfClass:[NSDictionary class]]) {
        [response responseDict:obj];
    } else if ([obj isKindOfClass:[NSData class]]) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:obj options:NSJSONReadingMutableContainers error:NULL];
        if (dict && [dict isKindOfClass:[NSDictionary class]]) {
            [response responseDict:dict];
        } else {
            [response JSONDataError];
        }
    } else {
        [response JSONDataError];
    }
    return response;
}

- (void)responseDict:(NSDictionary *)dict {
    self.message = [NSString stringWithFormat:@"%@",dict[kRJResponseMsgKey]];
    self.responseCode = [dict[kRJResponseCodeKey] integerValue];
    self.responseObject = dict[kRJResponseObjKey];
    if (self.responseCode == RJResponseCodeSuccess) {
        self.success = YES;
    }
}

- (void)responseWithError:(NSError *)error {
    if (error.code == 3840) {
        self.message = @"请求失败，稍后再试";
    } else if (error.code == -1009) {
        self.message = @"当前网络不可用";
    } else if (error.code == -1001) {
        self.message = @"请求超时，稍后再试";
    } else {
        self.message = @"请求失败，稍后再试";
    }
    self.responseCode = RJResponseCodeFailed;
}

- (void)JSONDataError {
    self.responseCode = RJResponseCodeJSONError;
    self.message = @"数据返回有误";
}
@end
