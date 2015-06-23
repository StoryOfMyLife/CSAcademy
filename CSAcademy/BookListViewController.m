//
//  BookListViewController.m
//  CSAcademy
//
//  Created by 刘廷勇 on 15/6/24.
//  Copyright (c) 2015年 liuty. All rights reserved.
//

#import "BookListViewController.h"
#import "BookListCellItem.h"
#import "BookDetailViewController.h"

static NSString *url = @"http://116.255.187.20:8088/ChinaStroke/article/articleList";

@implementation BookListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"文献速览";
    
    [[YDNetworkManager sharedManager] getJSONFromURL:url parameters:@{@"currentPage" : @"1", @"pageSize" : @"10"} success:^(id responseObject) {
        BookListCellModel *model = [[BookListCellModel alloc] initWithDictionary:responseObject error:nil];
        [self setupItems:model.items];
    } failure:^(NSError *error) {
        
    }];
}

- (void)setupItems:(NSArray *)items
{
    for (BookListCellItem *item in items) {
        [item applyActionBlock:^(UITableView *tableView, NSIndexPath *indexPath) {
            UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            BookDetailViewController *vc = [sb instantiateViewControllerWithIdentifier:@"BookDetailViewController"];
            vc.articleId = item.articleId;
            [self.navigationController pushViewController:vc animated:YES];
        }];
    }
    self.items = @[items];
}

@end
