//
//  MeetingCategoryListItem.m
//  CSAcademy
//
//  Created by 刘廷勇 on 15/6/10.
//  Copyright (c) 2015年 liuty. All rights reserved.
//

#import "MeetingCategoryListItem.h"

@implementation MeetingCategoryModel

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"data.meetingDays" : @"items",
                                                       }];
}

@end

@implementation MeetingCategoryListItem

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"id" : @"categoryID",
                                                       @"name" : @"title"
                                                       }];
}

- (Class)cellClass
{
    return [MeetingCategoryListCell class];
}

@end

@implementation MeetingCategoryListCell

@synthesize cellItem = _cellItem;

- (void)setCellItem:(MeetingCategoryListItem *)cellItem
{
    [super setCellItem:cellItem];
    [self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    self.textLabel.text = cellItem.title;
}

@end
