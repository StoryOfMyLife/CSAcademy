//
//  FirstViewController.m
//  CSAcademy
//
//  Created by 刘廷勇 on 15/6/10.
//  Copyright (c) 2015年 liuty. All rights reserved.
//

#import "HomeViewController.h"
#import "LoginViewController.h"

@interface HomeViewController ()

@property (weak, nonatomic) IBOutlet UIView *bottomView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView.tableFooterView = self.bottomView;
    [self performSelector:@selector(popupLoginVC) withObject:nil afterDelay:2];
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


@end
