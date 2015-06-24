//
//  IntroViewController.m
//  CSAcademy
//
//  Created by 刘廷勇 on 15/6/24.
//  Copyright (c) 2015年 liuty. All rights reserved.
//

#import "IntroViewController.h"

@interface IntroLastView : UIView
@property (weak, nonatomic) IBOutlet UIButton *denyButton;
@property (weak, nonatomic) IBOutlet UIButton *acceptButton;
@end

@implementation IntroLastView


@end

@interface IntroViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation IntroViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.bounces = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:self.scrollView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSArray *imageArray = @[@"intro1", @"intro2"];
    
    self.scrollView.contentSize = CGSizeMake(self.view.width * (imageArray.count + 1), self.view.height);
    
    for (NSInteger i = 0; i < [imageArray count]; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * self.scrollView.width, 0, self.scrollView.width, self.scrollView.height)];
        imageView.contentMode = UIViewContentModeScaleToFill;
        imageView.image = [UIImage imageNamed:imageArray[i]];
        [self.scrollView addSubview:imageView];
    }
    
    IntroLastView *lastView = [[NSBundle mainBundle] loadNibNamed:@"IntroLastView" owner:nil options:nil][0];
    lastView.frame = self.scrollView.bounds;
    lastView.left = self.scrollView.width * imageArray.count;
    [self.scrollView addSubview:lastView];
    
    [[lastView.denyButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        exit(0);
    }];
    
    [[lastView.acceptButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        [UIView animateWithDuration:0.3 animations:^{
            self.view.alpha = 0;
        } completion:^(BOOL finished) {
            [self.view removeFromSuperview];
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"intro"];
        }];
    }];
}

@end
