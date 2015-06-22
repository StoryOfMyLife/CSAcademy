//
//  MeetingCategoryListController.m
//  CSAcademy
//
//  Created by 刘廷勇 on 15/6/10.
//  Copyright (c) 2015年 liuty. All rights reserved.
//

#import "MeetingCategoryListController.h"
#import "MeetingCategoryListItem.h"
#import "MeetingVideoDateListViewController.h"

static NSString *url = @"http://116.255.187.20:8088/ChinaStroke/video/meetingDay";

@implementation MeetingCategoryListController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"视频分类";
    
    [[YDNetworkManager sharedManager] getJSONFromURL:url parameters:@{@"currentPage" : @"1", @"pageSize" : @"10"} success:^(id responseObject) {
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
    self.items = @[items];
}

@end
