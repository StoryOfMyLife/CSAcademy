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

static NSString *url = @"http://122.114.52.48:8088/COGADoctorServer/video/meeting";
static NSString *key = @"CogaDoctor/2015-05-30/v0.90/Shjz";

@implementation MeetingCategoryListController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"视频分类";
    
    [[YDNetworkManager sharedManager] getJSONFromURL:url parameters:nil success:^(id responseObject) {
        NSString *newResult = [AES128Util AES128Decrypt:responseObject[@"json"] key:key];
        MeetingCategoryModel *model = [[MeetingCategoryModel alloc] initWithString:newResult error:nil];
        [self setupItems:model.items];
    } failure:^(NSError *error) {
        
    }];
}

- (void)setupItems:(NSArray *)items
{
    for (MeetingCategoryListItem *item in items) {
        [item applyActionBlock:^(UITableView *tableView, NSIndexPath *indexPath) {
            MeetingVideoDateListViewController *vc = [[MeetingVideoDateListViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }];
    }
    self.items = @[items];
}

@end
