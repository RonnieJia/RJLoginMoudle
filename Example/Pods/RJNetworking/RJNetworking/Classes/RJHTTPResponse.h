//
//  RJHTTPResponse.h
//  AFNetworking
//
//  Created by jia on 2020/1/3.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSUInteger, RJHTTPResponseCode) {
    RJResponseCodeSuccess = 200,
    RJResponseCodeFailed = 0,
    RJResponseCodeJSONError = 700,
};

NS_ASSUME_NONNULL_BEGIN

@interface RJHTTPResponse : NSObject
@property (nonatomic, assign) BOOL success;
@property (nonatomic, assign) NSInteger responseCode;
@property (nonatomic, strong) id responseObject;
@property (nonatomic, strong) NSString *message;

+ (RJHTTPResponse *)response:(id)obj;

@end

NS_ASSUME_NONNULL_END
