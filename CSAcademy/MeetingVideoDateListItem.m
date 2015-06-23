//
//  MeetingVideoDateListItem.m
//  CSAcademy
//
//  Created by 刘廷勇 on 15/6/10.
//  Copyright (c) 2015年 liuty. All rights reserved.
//

#import "MeetingVideoDateListItem.h"

@implementation MeetingVideoDateListModel

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"data.meetings" : @"items",
                                                       }];
}

@end

@implementation MeetingVideoDateListItem

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"id" : @"meetingId",
                                                       @"name" : @"title"
                                                       }];
}

- (Class)cellClass
{
    return [MeetingVideoDateListCell class];
}

@end

@implementation MeetingVideoDateListCell

@synthesize cellItem = _cellItem;

- (void)setCellItem:(MeetingVideoDateListItem *)cellItem
{
    [super setCellItem:cellItem];
    [self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    self.textLabel.text = cellItem.title;
}

@end
