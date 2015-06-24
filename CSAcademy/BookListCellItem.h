//
//  BookListCellItem.h
//  CSAcademy
//
//  Created by 刘廷勇 on 15/6/24.
//  Copyright (c) 2015年 liuty. All rights reserved.
//

#import "LTableViewCellItem.h"

@protocol BookListCellItem @end

@interface BookListCellItem : LTableViewCellItem

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *articleId;
@property (nonatomic, copy) NSString *time;

@end

@interface BookListCell : LTableViewCell

@end

@interface BookListCellModel : JSONModel

@property (nonatomic, strong) NSArray<BookListCellItem> *items;
@property (nonatomic) NSInteger totalPage;

@end
