//
//  MeetingVideoListItem.m
//  CSAcademy
//
//  Created by 刘廷勇 on 15/6/10.
//  Copyright (c) 2015年 liuty. All rights reserved.
//

#import "MeetingVideoListItem.h"

@implementation MeetingVideoListItem

- (Class)cellClass
{
    return [MeetingVideoListCell class];
}

- (CGFloat)heightForTableView:(UITableView *)tableView
{
    return 44;
}

@end

@implementation MeetingVideoListCell

@synthesize cellItem = _cellItem;

- (void)setCellItem:(MeetingVideoListItem *)cellItem
{
    [super setCellItem:cellItem];
    [self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    self.textLabel.text = cellItem.title;
}

@end