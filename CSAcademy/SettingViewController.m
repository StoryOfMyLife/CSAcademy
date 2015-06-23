//
//  SettingViewController.m
//  CSAcademy
//
//  Created by 刘廷勇 on 15/6/23.
//  Copyright (c) 2015年 liuty. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController () <UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *footerView;

@end

@implementation SettingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tableView.tableFooterView = self.footerView;
}

- (IBAction)logout:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"login"];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
