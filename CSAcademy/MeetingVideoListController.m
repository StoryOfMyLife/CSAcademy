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

static NSString *url = @"http://116.255.187.20:8088/ChinaStroke/video/recordVideos";

@implementation MeetingVideoListController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"视频列表";
    
    [[YDNetworkManager sharedManager] getJSONFromURL:url parameters:@{@"currentPage" : @"1", @"pageSize" : @"10", @"meetingId" : self.meetingId, @"dayId" : self.dayId} success:^(id responseObject) {
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
    self.items = @[items];
}

@end
