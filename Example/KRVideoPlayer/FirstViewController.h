//
//  FirstViewController.h
//  KRVideoPlayer
//
//  Created by aidenluo on 5/23/15.
//  Copyright (c) 2015 36kr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *videoView;

- (IBAction)playLocalVideo:(id)sender;
- (IBAction)playRemoteVideo:(id)sender;

@end

