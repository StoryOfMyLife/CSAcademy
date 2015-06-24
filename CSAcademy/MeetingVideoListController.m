//
//  MeetingVideoListController.m
//  CSAcademy
//
//  Created by 刘廷勇 on 15/6/10.
//  Copyright (c) 2015年 liuty. All rights reserved.
//

#import "MeetingVideoListController.h"
#import "MeetingVideoListItem.h"
#import "MeetingVideoController.h"
#import "LoadMoreCellItem.h"

static NSString *url = @"http://116.255.187.20:8088/ChinaStroke/video/recordVideos";

@interface MeetingVideoListController ()

@property (nonatomic) NSInteger currentPage;

@end

@implementation MeetingVideoListController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"视频列表";
    
    self.currentPage = 1;
    
    [self loadData:self.currentPage];
}

- (void)loadData:(NSInteger)page
{
    NSString *pageStr = [NSString stringWithFormat:@"%ld", (long)page];
    
    [[YDNetworkManager sharedManager] getJSONFromURL:url parameters:@{@"currentPage" : pageStr, @"pageSize" : @"10", @"meetingId" : self.meetingId, @"dayId" : self.dayId} success:^(id responseObject) {
        MeetingVideoListModel *model = [[MeetingVideoListModel alloc] initWithDictionary:responseObject error:nil];
        [self setupItems:model.items];
    } failure:^(NSError *error) {
        
    }];
}

- (void)setupItems:(NSArray *)items
{
    for (MeetingVideoListItem *item in items) {
        [item applyActionBlock:^(UITableView *tableView, NSIndexPath *indexPath) {
            UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            MeetingVideoController *vc = [sb instantiateViewControllerWithIdentifier:@"MeetingVideoController"];
            vc.model = item;
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
