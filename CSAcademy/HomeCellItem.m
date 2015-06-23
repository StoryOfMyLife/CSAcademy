//
//  HomeCellItem.m
//  CSAcademy
//
//  Created by 刘廷勇 on 15/6/10.
//  Copyright (c) 2015年 liuty. All rights reserved.
//

#import "HomeCellItem.h"

@implementation HomeCellItem

- (Class)cellClass
{
    return [HomeCell class];
}

@end

@implementation HomeCell

@synthesize cellItem = _cellItem;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

    }
    return self;
}

- (void)layoutSubviews
{
    
}

- (void)setCellItem:(HomeCellItem *)cellItem
{
    [super setCellItem:cellItem];
    [self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    self.imageView.image = cellItem.image;
}

@end
