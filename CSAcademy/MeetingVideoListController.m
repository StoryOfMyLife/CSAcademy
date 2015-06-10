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

@implementation MeetingVideoListController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"视频列表";
    
    NSMutableArray *items = [NSMutableArray array];
    for (NSInteger i = 10; i > 0; i--) {
        NSString *date = [NSString stringWithFormat:@"视频%ld", (long)i];
        MeetingVideoListItem *item = [[MeetingVideoListItem alloc] initWithDictionary:@{@"title" : date} error:nil];
        [items addObject:item];
        [item applyActionBlock:^(UITableView *tableView, NSIndexPath *indexPath) {
            UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            MeetingVideoController *vc = [sb instantiateViewControllerWithIdentifier:@"MeetingVideoController"];
            [self.navigationController pushViewController:vc animated:YES];
        }];
    }
    self.items = @[items];
}

@end
