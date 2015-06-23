//
//  BookDetailViewController.h
//  CSAcademy
//
//  Created by 刘廷勇 on 15/6/24.
//  Copyright (c) 2015年 liuty. All rights reserved.
//

#import "LTableViewController.h"
#import "BookDetailModel.h"

@interface BookDetailViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UILabel *name;

@property (weak, nonatomic) IBOutlet UILabel *author;

@property (weak, nonatomic) IBOutlet UILabel *translator;

@property (weak, nonatomic) IBOutlet UILabel *time;

@property (weak, nonatomic) IBOutlet UILabel *source;

@property (weak, nonatomic) IBOutlet UILabel *desc;

@property (nonatomic, strong) BookDetailDataModel *model;

@property (nonatomic, strong) NSString *articleId;

@property (weak, nonatomic) IBOutlet UIView *bottomView;

@end
