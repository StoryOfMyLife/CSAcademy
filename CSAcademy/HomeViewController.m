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

@property (weak, nonatomic) IBOutlet UIScrollView *topScrollView;
@property (nonatomic, strong) NSArray *scrollContent;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    BOOL login = [[NSUserDefaults standardUserDefaults] boolForKey:@"login"];
    if (!login) {
        [self performSelector:@selector(popupLoginVC) withObject:nil afterDelay:0];
    }
    self.scrollContent = @[@{@"image" : @"01",
                             @"url" : @"http://tisc.mediwelcome.com",
                             @"text" : @"2015 中国卒中学会第一届学术年会"},
                           
                           @{@"image" : @"02",
                             @"url" : @"http://tisc.mediwelcome.com/custom/HuiYiRiCheng",
                             @"text" : @"大会日程"},
                           
                           @{@"image" : @"03",
                             @"url" : @"http://tisc.mediwelcome.com/custom/DaHuiXueShuJiaoLiuAnPai",
                             @"text" : @"大会学术交流安排"},
                           
                           @{@"image" : @"04",
                             @"url" : @"http://tisc.mediwelcome.com/custom/JiaoTongXinXi",
                             @"text" : @"交通信息"},
                           
                           @{@"image" : @"05",
                             @"url" : @"",
                             @"text" : @"旅游信息"}];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self setupScrollViewContent];
}

- (void)setupScrollViewContent
{
    self.topScrollView.contentSize = CGSizeMake(self.topScrollView.width * self.scrollContent.count, self.topScrollView.height);
    [self.topScrollView removeAllSubviews];
    for (NSInteger i = 0; i < self.scrollContent.count; i++) {
        NSDictionary *content = self.scrollContent[i];
        
        UILabel *label = [[UILabel alloc] initWithFrame:(CGRect){CGPointMake(i * self.topScrollView.width, 0), CGSizeMake(self.topScrollView.width, 30)}];
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = RGBCOLOR(220, 220, 220);
        label.font = SystemFontWithSize(13);
        label.textColor = RGBCOLOR_HEX(0x339590);
        label.text = content[@"text"];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:(CGRect){CGPointMake(i * self.topScrollView.width, label.height), CGSizeMake(self.topScrollView.width, self.topScrollView.height - label.height)}];
        imageView.contentMode = UIViewContentModeScaleToFill;
        imageView.userInteractionEnabled = YES;
        imageView.image = [UIImage imageNamed:content[@"image"]];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(topTapped:)];
        [imageView addGestureRecognizer:tap];
        [self.topScrollView addSubview:label];
        [self.topScrollView addSubview:imageView];
    }
}

- (void)topTapped:(UITapGestureRecognizer *)sender
{
    UIView *view = sender.view;
    NSInteger page = view.left / self.topScrollView.width;
    
    NSString *url = self.scrollContent[page][@"url"];
    if ([url length] > 0) {
        [self performSegueWithIdentifier:@"topPush" sender:url];
    }
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
    } else if ([segue.identifier isEqualToString:@"topPush"]) {
        WebViewController *vc = segue.destinationViewController;
        vc.url = sender;
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
