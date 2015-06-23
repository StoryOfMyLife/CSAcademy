//
//  BookDetailModel.h
//  CSAcademy
//
//  Created by 刘廷勇 on 15/6/24.
//  Copyright (c) 2015年 liuty. All rights reserved.
//

#import "JSONModel.h"

@interface BookDetailDataModel : JSONModel

@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *writer;
@property (nonatomic, copy) NSString *translator;
@property (nonatomic, copy) NSString *source;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *articleURL;

@end

@interface BookDetailModel : JSONModel

@property (nonatomic, strong) BookDetailDataModel *data;

@end

