//
//  LoadMoreCellItem.h
//  CSAcademy
//
//  Created by 刘廷勇 on 15/6/24.
//  Copyright (c) 2015年 liuty. All rights reserved.
//

#import "LTableViewCellItem.h"

@interface LoadMoreCellItem : LTableViewCellItem

@property (nonatomic, copy) NSString *content;

@end

@interface LoadMoreCell : LTableViewCell

@property (nonatomic, strong) UILabel *contentLabel;

@end
