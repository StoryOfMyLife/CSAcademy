//
//  WebViewController.h
//  CSAcademy
//
//  Created by 刘廷勇 on 15/6/23.
//  Copyright (c) 2015年 liuty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIWebView *webview;

@property (nonatomic, copy) NSString *url;

@end
