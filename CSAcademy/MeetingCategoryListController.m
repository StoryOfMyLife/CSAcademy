//
//  MeetingCategoryListController.m
//  CSAcademy
//
//  Created by 刘廷勇 on 15/6/10.
//  Copyright (c) 2015年 liuty. All rights reserved.
//

#import "MeetingCategoryListController.h"
#import "MeetingCategoryListItem.h"
#import "LoadMoreCellItem.h"
#import "MeetingVideoDateListViewController.h"

static NSString *url = @"http://116.255.187.20:8088/ChinaStroke/video/meetingDay";

@interface MeetingCategoryListController ()

@property (nonatomic) NSInteger currentPage;

@end

@implementation MeetingCategoryListController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"视频分类";
    
    self.currentPage = 1;
    
    [self loadData:self.currentPage];
}

- (void)loadData:(NSInteger)page
{
    NSString *pageStr = [NSString stringWithFormat:@"%ld", (long)page];
    [[YDNetworkManager sharedManager] getJSONFromURL:url parameters:@{@"currentPage" : pageStr, @"pageSize" : @"10"} success:^(id responseObject) {
        MeetingCategoryModel *model = [[MeetingCategoryModel alloc] initWithDictionary:responseObject error:nil];
        [self setupItems:model.items];
    } failure:^(NSError *error) {
        
    }];
}

- (void)setupItems:(NSArray *)items
{
    for (MeetingCategoryListItem *item in items) {
        [item applyActionBlock:^(UITableView *tableView, NSIndexPath *indexPath) {
            MeetingVideoDateListViewController *vc = [[MeetingVideoDateListViewController alloc] init];
            vc.categoryID = item.categoryID;
            
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
