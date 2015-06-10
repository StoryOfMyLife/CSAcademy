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
    
//    [[YDNetworkManager sharedManager] getJSONFromURL:url parameters:nil success:^(id responseObject) {
//        Log(@"%@", responseObject);
//        NSString *result = responseObject[@"json"];
//        NSString *newResult = [AES128Util AES128Decrypt:result key:key];
//        
//        int i = 1;
//    } failure:^(NSError *error) {
//        
//    }];
    
    [self reload];
}

- (void)reload
{
    NSMutableArray *items = [NSMutableArray array];
    for (NSInteger i = 10; i > 0; i--) {
        NSString *date = [NSString stringWithFormat:@"视频%ld", (long)i];
        MeetingCategoryListItem *item = [[MeetingCategoryListItem alloc] initWithDictionary:@{@"title" : date} error:nil];
        [items addObject:item];
        [item applyActionBlock:^(UITableView *tableView, NSIndexPath *indexPath) {
            MeetingVideoDateListViewController *dateListVC = [[MeetingVideoDateListViewController alloc] init];
            [self.navigationController pushViewController:dateListVC animated:YES];
        }];
    }
    self.items = @[items];
}

@end
