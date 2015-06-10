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

@implementation MeetingVideoDateListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"会议视频";
    
    NSMutableArray *items = [NSMutableArray array];
    for (NSInteger i = 10; i > 0; i--) {
        NSString *date = [NSString stringWithFormat:@"2015年6月%ld号", (long)i];
        MeetingVideoDateListItem *item = [[MeetingVideoDateListItem alloc] initWithDictionary:@{@"dateInfo" : date} error:nil];
        [items addObject:item];
        [item applyActionBlock:^(UITableView *tableView, NSIndexPath *indexPath) {

            MeetingVideoListController *vc = [[MeetingVideoListController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }];
    }
    self.items = @[items];
}

@end
