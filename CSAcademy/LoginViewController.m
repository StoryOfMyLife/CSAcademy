//
//  LoginViewController.m
//  CSAcademy
//
//  Created by 刘廷勇 on 15/6/10.
//  Copyright (c) 2015年 liuty. All rights reserved.
//

#import "LoginViewController.h"

static NSString const *loginURL = @"http://122.114.52.48:8088/COGADoctorServer/user/login";

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    tapGesture.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:tapGesture];
}

- (void)tap:(id)sender
{
    [self.view endEditing:YES];
}

- (IBAction)login:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
