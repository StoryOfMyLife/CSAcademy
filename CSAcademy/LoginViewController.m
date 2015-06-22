//
//  LoginViewController.m
//  CSAcademy
//
//  Created by 刘廷勇 on 15/6/10.
//  Copyright (c) 2015年 liuty. All rights reserved.
//

#import "LoginViewController.h"

static NSString *loginURL = @"http://116.255.187.20:8088/ChinaStroke/user/Login";

@interface LoginViewController ()

@property (nonatomic) BOOL loginSuccess;

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    tapGesture.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:tapGesture];
    
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    RAC(self.loginButton, enabled) = [RACSignal combineLatest:@[self.username.rac_textSignal, self.password.rac_textSignal] reduce:(id)^(NSString *username, NSString *password){
        return @([username isEqualToString:@"010999999"] && password.length == 11);
    }];
    
    [RACObserve(self, loginSuccess) subscribeNext:^(NSNumber *loginSuccess) {
        if ([loginSuccess boolValue]) {
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"login"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            [self dismissViewControllerAnimated:YES completion:NULL];
        } else if (self.loginButton.isEnabled){
            self.password.backgroundColor = [UIColor redColor];
            [self performSelector:@selector(changeLabelColorBack) withObject:nil afterDelay:2];
        }
    }];
}

- (void)changeLabelColorBack
{
    [UIView animateWithDuration:.3 animations:^{
        self.password.backgroundColor = [UIColor whiteColor];
    }];
}

- (void)tap:(id)sender
{
    [self.view endEditing:YES];
}

- (IBAction)login:(id)sender
{
    [[YDNetworkManager sharedManager] getJSONFromURL:loginURL parameters:@{@"username" : self.username.text, @"password" : self.password.text} success:^(id responseObject) {
        NSString *retCode = responseObject[@"retCode"];
        if ([retCode isEqualToString:@"200"]) {
            self.loginSuccess = YES;
        } else {
            self.loginSuccess = NO;
        }
    } failure:^(NSError *error) {
        self.loginSuccess = NO;
    }];
}

@end
