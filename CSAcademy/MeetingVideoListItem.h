//
//  MeetingVideoListItem.h
//  CSAcademy
//
//  Created by 刘廷勇 on 15/6/10.
//  Copyright (c) 2015年 liuty. All rights reserved.
//

#import "LTableViewCellItem.h"

@protocol MeetingVideoListItem @end

@interface MeetingVideoListItem : LTableViewCellItem

@property (nonatomic, copy) NSString *imgURL;
@property (nonatomic, copy) NSString *period;
@property (nonatomic, copy) NSString *speaker;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *dayId;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *urlios;

@property (nonatomic, copy) NSString *videoId;

@end

@interface MeetingVideoListCell : LTableViewCell

@property (nonatomic, strong) UIImageView *thumbnail;
@property (nonatomic, strong) UILabel *periodLabel;
@property (nonatomic, strong) UILabel *nameLabel;

@end

@interface MeetingVideoListModel : JSONModel

@property (nonatomic, strong) NSArray<MeetingVideoListItem> *items;

@end
