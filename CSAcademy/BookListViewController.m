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
#import "LoadMoreCellItem.h"

static NSString *url = @"http://116.255.187.20:8088/ChinaStroke/article/articleList";

@interface BookListViewController ()

@property (nonatomic) NSInteger currentPage;

@end

@implementation BookListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"文献速览";
    
    self.currentPage = 1;
    
    [self loadData:self.currentPage];
}

- (void)loadData:(NSInteger)page
{
    NSString *pageStr = [NSString stringWithFormat:@"%ld", (long)page];
    [[YDNetworkManager sharedManager] getJSONFromURL:url parameters:@{@"currentPage" : pageStr, @"pageSize" : @"10"} success:^(id responseObject) {
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
    NSMutableArray *data = [NSMutableArray arrayWithArray:self.items[0]];
    [data removeLastObject];
    
    LoadMoreCellItem *item = [[LoadMoreCellItem alloc] init];
    if (items.count > 0) {
        self.currentPage++;
        [data addObjectsFromArray:items];
        [item applyActionBlock:^(UITableView *tableView, NSIndexPath *indexPath) {
            [self loadData:self.currentPage];
        }];
    } else {
        item.content = @"没有更多数据";
    }
    
    [data addObject:item];
    self.items = @[data];
}

@end
