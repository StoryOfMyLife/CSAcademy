//
//  MeetingCategoryListItem.h
//  CSAcademy
//
//  Created by 刘廷勇 on 15/6/10.
//  Copyright (c) 2015年 liuty. All rights reserved.
//

#import "LTableViewCellItem.h"

@protocol MeetingCategoryListItem @end

@interface MeetingCategoryListItem : LTableViewCellItem

@property (nonatomic, copy) NSString *title;
@property (nonatomic) NSInteger categoryID;

@end

@interface MeetingCategoryListCell : LTableViewCell

@end

@interface MeetingCategoryModel : JSONModel

@property (nonatomic, copy) NSArray<MeetingCategoryListItem> *items;

@end
