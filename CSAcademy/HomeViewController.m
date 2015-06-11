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

@interface HomeViewController ()

@property (weak, nonatomic) IBOutlet UIView *bottomView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.tableView.tableFooterView = self.bottomView;
    [self performSelector:@selector(popupLoginVC) withObject:nil afterDelay:0];
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
    if ([segue.identifier isEqualToString:@"popLogin"]) {
    
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
