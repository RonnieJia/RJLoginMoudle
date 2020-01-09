//
//  RJDataModel.h
//  MJExtension
//
//  Created by jia on 2020/1/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RJDataModel : NSObject

/// 创建一个模型
+ (instancetype)rj_dataModelWithJSONDictionary:(NSDictionary *)dic;

/// 创建模型数组
+ (NSMutableArray *)rj_dataListWithJSONArray:(NSArray *)arr;

/// 模型转字典
- (NSDictionary *)rj_modelChangeToDictionary;

/// @{ propertyName : dictKey }
+ (NSDictionary *)rj_replaceKeyFromPropertyName;


@end

NS_ASSUME_NONNULL_END
