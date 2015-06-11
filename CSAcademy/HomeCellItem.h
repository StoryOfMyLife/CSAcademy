//
//  HomeCellItem.h
//  CSAcademy
//
//  Created by 刘廷勇 on 15/6/10.
//  Copyright (c) 2015年 liuty. All rights reserved.
//

#import "LTableViewCellItem.h"

@interface HomeCellItem : LTableViewCellItem

@property (nonatomic, strong) UIImage *image;

@end

@interface HomeCell : LTableViewCell

@property (nonatomic, strong) UIImageView *cellImageView;

@end
