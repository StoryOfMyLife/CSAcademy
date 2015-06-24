//
//  LoadMoreCellItem.m
//  CSAcademy
//
//  Created by 刘廷勇 on 15/6/24.
//  Copyright (c) 2015年 liuty. All rights reserved.
//

#import "LoadMoreCellItem.h"

@implementation LoadMoreCellItem

- (Class)cellClass
{
    return [LoadMoreCell class];
}

@end

@implementation LoadMoreCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentLabel = [[UILabel alloc] init];
        self.contentLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:self.contentLabel];
    }
    return self;
}

- (void)updateConstraints
{
    weakSelf();
    [self.contentLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weakSelf.contentView);
    }];
    [super updateConstraints];
}

- (void)setCellItem:(LoadMoreCellItem *)cellItem
{
    [super setCellItem:cellItem];
    self.contentLabel.text = @"点击加载更多";
    if (cellItem.content.length > 0) {
        self.contentLabel.text = cellItem.content;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [self setNeedsUpdateConstraints];
}

@end