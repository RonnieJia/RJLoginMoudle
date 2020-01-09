//
//  RJHTTPSessionManager.h
//  AFNetworking

#import <AFNetworking/AFNetworking.h>
#import "RJHTTPResponse.h"

#define kRJHTTPClient  [RJHTTPSessionManager sharedInstance]

NS_ASSUME_NONNULL_BEGIN

typedef void(^RJHTTPCompletion)(RJHTTPResponse *response);

@interface RJHTTPSessionManager : AFHTTPSessionManager
+ (instancetype)sharedInstance;

/// GET
/// @param path 地址
/// @param paramters 参数
/// @param completion 回调
- (NSURLSessionDataTask *)getPath:(NSString *)path paramters:(NSDictionary *)paramters completion:(RJHTTPCompletion)completion;

/// POST
/// @param path 地址
/// @param paramters 参数
/// @param completion 回调
- (NSURLSessionDataTask *)postPath:(NSString *)path paramters:(NSDictionary *)paramters completion:(RJHTTPCompletion)completion;
@end

NS_ASSUME_NONNULL_END
