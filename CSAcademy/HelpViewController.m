//
//  HelpViewController.m
//  CSAcademy
//
//  Created by 刘廷勇 on 15/6/23.
//  Copyright (c) 2015年 liuty. All rights reserved.
//

#import "HelpViewController.h"
#import "WebViewController.h"

@implementation HelpViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    WebViewController *web = segue.destinationViewController;
    if ([segue.identifier isEqualToString:@"UsingHelpPush"]) {
        web.url = @"http://122.114.52.243:9900/Htmls/help02.htm";
    } else if ([segue.identifier isEqualToString:@"IntroPush"]) {
        web.url = @"http://122.114.52.243:9900/Htmls/help01.htm";
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
