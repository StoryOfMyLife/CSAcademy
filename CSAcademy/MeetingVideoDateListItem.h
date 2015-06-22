//
//  MeetingVideoDateListItem.h
//  CSAcademy
//
//  Created by 刘廷勇 on 15/6/10.
//  Copyright (c) 2015年 liuty. All rights reserved.
//

#import "LTableViewCellItem.h"

@protocol MeetingVideoDateListItem @end

@interface MeetingVideoDateListItem : LTableViewCellItem

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *meetingId;

@end

@interface MeetingVideoDateListCell : LTableViewCell

@end

@interface MeetingVideoDateListModel : JSONModel

@property (nonatomic, strong) NSArray<MeetingVideoDateListItem> *items;

@end
