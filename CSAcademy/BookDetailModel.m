//
//  BookDetailModel.m
//  CSAcademy
//
//  Created by 刘廷勇 on 15/6/24.
//  Copyright (c) 2015年 liuty. All rights reserved.
//

#import "BookDetailModel.h"

@implementation BookDetailDataModel

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"description" : @"desc"
                                                       }];
}

+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}

@end

@implementation BookDetailModel

@end