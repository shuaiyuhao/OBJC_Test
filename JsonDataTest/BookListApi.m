//
//  BookListApi.m
//  JsonDataTest
//
//  Created by Yuhao on 2019/12/1.
//  Copyright © 2019 Vwidea. All rights reserved.
//

#import "BookListApi.h"

@implementation BookListApi

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}

- (NSString *)requestUrl {
    return @"/jsondecodable/courses";
}


@end
