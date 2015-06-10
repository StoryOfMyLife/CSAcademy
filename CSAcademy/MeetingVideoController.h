//
//  MeetingVideoController.h
//  CSAcademy
//
//  Created by 刘廷勇 on 15/6/10.
//  Copyright (c) 2015年 liuty. All rights reserved.
//

#import "LViewController.h"
#import "VKVideoPlayer.h"

@interface MeetingVideoController : LViewController <VKVideoPlayerDelegate>

@property (weak, nonatomic) IBOutlet UIView *videoContainer;

@property (weak, nonatomic) IBOutlet UILabel *author;

@property (weak, nonatomic) IBOutlet UITextView *content;

@property (nonatomic, strong) VKVideoPlayer* player;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *videoBottomConstraint;

@end
