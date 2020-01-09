//
//  RJHTTPSessionManager.m
//  AFNetworking
#import "RJHTTPSessionManager.h"
#import "RJHTTPUrl.h"

@implementation RJHTTPSessionManager
+ (instancetype)sharedInstance {
    static RJHTTPSessionManager *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] initWithBaseURL:[NSURL URLWithString:kBASEURL]];
    });
    return _sharedInstance;
}


- (NSURLSessionDataTask *)getPath:(NSString *)path paramters:(NSDictionary *)paramters completion:(RJHTTPCompletion)completion {
    self.requestSerializer.timeoutInterval = 30.0f;
    return [self GET:[NSString stringWithFormat:@"Api.%@",path] parameters:paramters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        RJHTTPLog(@"\n ************************-START \n PATH:[%@]\n PARAMTERS:%@\n RESULT:%@ \n ---------------------------END",path,paramters,responseObject);
        if (completion) {
            completion([RJHTTPResponse response:responseObject]);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        RJHTTPLog(@"\n **************************** \n PATH:[%@]\n PARAMTERS:%@\n ERROR:code-%zd \n %@ \n ---------------------------END",path,paramters,error.code, error.userInfo[@"NSDebugDescription"]);
        if (completion) {
            completion([RJHTTPResponse response:error]);
        }
    }];
}

- (NSURLSessionDataTask *)postPath:(NSString *)path paramters:(NSDictionary *)paramters completion:(RJHTTPCompletion)completion {
    self.requestSerializer.timeoutInterval = 30.0f;
    return [self POST:[NSString stringWithFormat:@"Api.%@",path] parameters:paramters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        RJHTTPLog(@"\n **************************** \n PATH:[%@]\n PARAMTERS:%@\n RESULT:%@ \n ---------------------------END",path,paramters,responseObject);
        if (completion) {
            completion([RJHTTPResponse response:responseObject]);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        RJHTTPLog(@"\n **************************** \n PATH:[%@]\n PARAMTERS:%@\n ERROR:code-%zd \n %@ \n ---------------------------END",path,paramters,error.code, error.userInfo);
        if (completion) {
            completion([RJHTTPResponse response:error]);
        }
    }];
}
@end
