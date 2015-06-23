//
//  MeetingVideoDateListViewController.m
//  CSAcademy
//
//  Created by 刘廷勇 on 15/6/10.
//  Copyright (c) 2015年 liuty. All rights reserved.
//

#import "MeetingVideoDateListViewController.h"
#import "MeetingVideoDateListItem.h"
#import "MeetingVideoListController.h"

static NSString *url = @"http://116.255.187.20:8088/ChinaStroke/video/meeting";

@implementation MeetingVideoDateListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"会议视频";
    
    [[YDNetworkManager sharedManager] getJSONFromURL:url parameters:@{@"currentPage" : @"1", @"pageSize" : @"10", @"meetingStr" : self.categoryID} success:^(id responseObject) {
        MeetingVideoDateListModel *model = [[MeetingVideoDateListModel alloc] initWithDictionary:responseObject error:nil];
        [self setupItems:model.items];
    } failure:^(NSError *error) {
        
    }];
}

- (void)setupItems:(NSArray *)items
{
    for (MeetingVideoDateListItem *item in items) {
        [item applyActionBlock:^(UITableView *tableView, NSIndexPath *indexPath) {
            MeetingVideoListController *vc = [[MeetingVideoListController alloc] init];
            vc.meetingId = item.meetingId;
            vc.dayId = self.categoryID;
            [self.navigationController pushViewController:vc animated:YES];
        }];
    }
    self.items = @[items];
}

@end
