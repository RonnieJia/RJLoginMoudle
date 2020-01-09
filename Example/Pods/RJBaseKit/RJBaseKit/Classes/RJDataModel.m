//
//  RJDataModel.m
//  MJExtension
//
//  Created by jia on 2020/1/7.
//

#import "RJDataModel.h"
#import <MJExtension/MJExtension.h>

@implementation RJDataModel

+ (NSDictionary *)rj_replaceKeyFromPropertyName {
    return @{};
}

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return [self rj_replaceKeyFromPropertyName];
}

+ (instancetype)rj_dataModelWithJSONDictionary:(NSDictionary *)dic {
    return [self mj_objectWithKeyValues:dic];
}

- (NSDictionary *)rj_modelChangeToDictionary {
    return self.mj_keyValues;
}

+ (NSArray *)rj_dataListWithJSONArray:(NSArray *)arr {
    return [self mj_objectArrayWithKeyValuesArray:arr];
}

@end
