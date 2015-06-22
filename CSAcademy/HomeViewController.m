//
//  FirstViewController.m
//  CSAcademy
//
//  Created by 刘廷勇 on 15/6/10.
//  Copyright (c) 2015年 liuty. All rights reserved.
//

#import "HomeViewController.h"
#import "LoginViewController.h"
#import "MeetingCategoryListController.h"
#import "WebViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    BOOL login = [[NSUserDefaults standardUserDefaults] boolForKey:@"login"];
    if (!login) {
        [self performSelector:@selector(popupLoginVC) withObject:nil afterDelay:0];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)popupLoginVC
{
    [self performSegueWithIdentifier:@"popLogin" sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"push6"]) {
        WebViewController *vc = segue.destinationViewController;
        vc.url = @"http://tisc.mediwelcome.com/custom/XueShuWeiYuan#";
    } else if ([segue.identifier isEqualToString:@"push7"]) {
        WebViewController *vc = segue.destinationViewController;
        vc.url = @"http://tisc.mediwelcome.com/custom/WangJieHuiGu";
    } else if ([segue.identifier isEqualToString:@"push8"]) {
        WebViewController *vc = segue.destinationViewController;
        vc.url = @"http://tisc.mediwelcome.com/custom/JiaoYuXueFen#";
    }
}

- (IBAction)meetingPressed:(id)sender
{
    MeetingCategoryListController *vc = [[MeetingCategoryListController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (BOOL)shouldAutorotate
{
    return NO;
}

@end
