//
//  UITabBarController+Rotate.m
//  CSAcademy
//
//  Created by 刘廷勇 on 15/6/11.
//  Copyright (c) 2015年 liuty. All rights reserved.
//

#import "UITabBarController+Rotate.h"

@implementation UITabBarController (Rotate)

- (BOOL)shouldAutorotate
{
    return [((UINavigationController *)self.selectedViewController).topViewController shouldAutorotate];
}

@end
