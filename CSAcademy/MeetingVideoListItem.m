//
//  MeetingVideoListItem.m
//  CSAcademy
//
//  Created by 刘廷勇 on 15/6/10.
//  Copyright (c) 2015年 liuty. All rights reserved.
//

#import "MeetingVideoListItem.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation MeetingVideoListModel

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"data.videos" : @"items",
                                                       }];
}

@end

@implementation MeetingVideoListItem

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"id" : @"videoId",
                                                       @"description" : @"desc"
                                                       }];
}

- (Class)cellClass
{
    return [MeetingVideoListCell class];
}

@end

@implementation MeetingVideoListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    [self initSubviews];
    
    return self;
}

- (void)initSubviews
{
    self.thumbnail = [[UIImageView alloc] init];
    self.thumbnail.contentMode = UIViewContentModeScaleToFill;
    
    self.periodLabel = [[UILabel alloc] init];
    self.periodLabel.textColor = RGBCOLOR_HEX(0x339599);
    self.periodLabel.font = SystemFontWithSize(13);
    
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.textColor = RGBCOLOR_HEX(0x595757);
    self.nameLabel.font = SystemFontWithSize(13);
    
    [self.contentView addSubview:self.thumbnail];
    [self.contentView addSubview:self.periodLabel];
    [self.contentView addSubview:self.nameLabel];
}

- (void)updateConstraints
{
    weakSelf();
    UIView *superview = weakSelf.contentView;
    
    [self.thumbnail mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(superview).with.offset(10);
        make.top.equalTo(superview).with.offset(5);
        make.bottom.equalTo(superview).with.offset(-5);
        make.height.equalTo(@50);
        make.width.equalTo(@80);
    }];
    
    [self.periodLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.thumbnail.mas_right).with.offset(10);
        make.top.equalTo(superview).with.offset(10);
        make.right.equalTo(superview).with.offset(-30);
    }];
    
    [self.nameLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.periodLabel);
        make.bottom.equalTo(superview).with.offset(-10);
        make.right.equalTo(weakSelf.periodLabel);
    }];
    [super updateConstraints];
}

- (void)setCellItem:(MeetingVideoListItem *)cellItem
{
    [super setCellItem:cellItem];
    [self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    [self.thumbnail sd_setImageWithURL:[NSURL URLWithString:cellItem.imgURL] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    self.periodLabel.text = cellItem.period;
    self.nameLabel.text = cellItem.name;
    [self setNeedsUpdateConstraints];
}

@end