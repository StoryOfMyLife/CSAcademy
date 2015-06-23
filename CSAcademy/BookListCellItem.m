//
//  BookListCellItem.m
//  CSAcademy
//
//  Created by 刘廷勇 on 15/6/24.
//  Copyright (c) 2015年 liuty. All rights reserved.
//

#import "BookListCellItem.h"

@implementation BookListCellModel

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"data.articles" : @"items",
                                                       }];
}

@end

@implementation BookListCellItem

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"id" : @"articleId"
                                                       }];
}

- (Class)cellClass
{
    return [BookListCell class];
}

@end

@implementation BookListCell

@synthesize cellItem = _cellItem;

- (void)setCellItem:(BookListCellItem *)cellItem
{
    [super setCellItem:cellItem];
    [self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    self.textLabel.text = cellItem.name;
}

@end
