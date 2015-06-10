//
//  MeetingVideoDateListItem.m
//  CSAcademy
//
//  Created by 刘廷勇 on 15/6/10.
//  Copyright (c) 2015年 liuty. All rights reserved.
//

#import "MeetingVideoDateListItem.h"

@implementation MeetingVideoDateListItem

- (Class)cellClass
{
    return [MeetingVideoDateListCell class];
}

- (CGFloat)heightForTableView:(UITableView *)tableView
{
    return 44;
}

@end

@implementation MeetingVideoDateListCell

@synthesize cellItem = _cellItem;

- (void)setCellItem:(MeetingVideoDateListItem *)cellItem
{
    [super setCellItem:cellItem];
    [self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    self.textLabel.text = cellItem.dateInfo;
}

@end
