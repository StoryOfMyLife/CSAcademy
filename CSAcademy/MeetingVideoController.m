//
//  MeetingVideoController.m
//  CSAcademy
//
//  Created by 刘廷勇 on 15/6/10.
//  Copyright (c) 2015年 liuty. All rights reserved.
//

#import "MeetingVideoController.h"

@implementation MeetingVideoController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"视频";
    
    self.player = [[VKVideoPlayer alloc] init];
    self.player.delegate = self;
    self.player.view.frame = self.videoContainer.bounds;
    self.player.view.playerControlsAutoHideTime = @10;
    [self.videoContainer addSubview:self.player.view];
//    [self playStream:[NSURL URLWithString:@"http://122.114.52.48:99/2015/5/30/uterus/video.m3u8"]];
    [self playStream:[NSURL URLWithString:self.model.urlios]];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.videoBottomConstraint.constant = self.view.height * 0.5;
    self.author.text = self.model.speaker;
    self.content.text = self.model.desc;
}

#pragma mark - VKVideoPlayerControllerDelegate
- (void)videoPlayer:(VKVideoPlayer*)videoPlayer didControlByEvent:(VKVideoPlayerControlEvent)event {
    if (event == VKVideoPlayerControlEventTapDone) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (void)videoPlayer:(VKVideoPlayer *)videoPlayer didStartVideo:(id<VKVideoPlayerTrackProtocol>)track
{
    [self.player pauseContent];
}

- (void)playStream:(NSURL*)url
{
    VKVideoPlayerTrack *track = [[VKVideoPlayerTrack alloc] initWithStreamURL:url];
    track.hasNext = YES;
    [self.player loadVideoWithTrack:track];
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    if (toInterfaceOrientation == UIInterfaceOrientationPortrait) {
        [self.navigationController setNavigationBarHidden:NO animated:YES];
        self.videoBottomConstraint.constant = self.view.width * 0.5;
    } else {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
        self.videoBottomConstraint.constant = 0;
    }
}

@end
