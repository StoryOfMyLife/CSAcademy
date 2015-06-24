//
//  BookDetailViewController.m
//  CSAcademy
//
//  Created by 刘廷勇 on 15/6/24.
//  Copyright (c) 2015年 liuty. All rights reserved.
//

#import "BookDetailViewController.h"

static NSString *url = @"http://116.255.187.20:8088/ChinaStroke/article/articleInfo";

@implementation BookDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"文献详情";
    
    [[YDNetworkManager sharedManager] getJSONFromURL:url parameters:@{@"id" : self.articleId} success:^(id responseObject) {
        BookDetailModel *model = [[BookDetailModel alloc] initWithDictionary:responseObject error:nil];
        self.model = model.data;
    } failure:^(NSError *error) {
        
    }];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)setModel:(BookDetailDataModel *)model
{
    if (_model != model) {
        _model = model;
//        CGSize size = [self.bottomView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
//        CGSize textSize = [_model.desc sizeWithFont:nil constrainedToSize:1]
//        self.bottomView.height = size.height + ;
        self.tableView.tableFooterView = self.bottomView;
        self.name.text = _model.name;
        self.author.text = _model.writer;
        self.time.text = _model.time;
        self.source.text = _model.source;
        NSString *newDesc = [NSString stringWithFormat:@"       %@", _model.desc];
        self.desc.text = newDesc;
        self.translator.text = _model.translator;
    }
}

- (IBAction)gotoPDF:(id)sender
{
    
}


@end
