//
//  JsonModel.m
//  JsonDataTest
//
//  Created by Yuhao on 2019/12/1.
//  Copyright © 2019 Vwidea. All rights reserved.
//

#import "JsonModel.h"

@implementation JsonModel

+ (NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
    return @{
        @"name" : @"name",
        @"value" : @"id",
    };
}
@end
