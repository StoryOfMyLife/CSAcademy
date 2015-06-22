//
//  WebViewController.m
//  CSAcademy
//
//  Created by 刘廷勇 on 15/6/23.
//  Copyright (c) 2015年 liuty. All rights reserved.
//

#import "WebViewController.h"

@implementation WebViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
}

@end
