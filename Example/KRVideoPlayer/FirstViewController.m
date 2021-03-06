//
//  FirstViewController.m
//  KRVideoPlayer
//
//  Created by aidenluo on 5/23/15.
//  Copyright (c) 2015 36kr. All rights reserved.
//

#import "FirstViewController.h"
#import "KRVideoPlayerController.h"

@interface FirstViewController ()

@property (nonatomic, strong) KRVideoPlayerController *videoController;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playLocalVideo:(id)sender
{
    NSURL *videoURL = [[NSBundle mainBundle] URLForResource:@"150511_JiveBike" withExtension:@"mov"];
    [self playVideoWithURL:videoURL];
}

- (IBAction)playRemoteVideo:(id)sender
{
    NSURL *videoURL = [NSURL URLWithString:@"http://krtv.qiniudn.com/150522nextapp"];
    [self playVideoWithURL:videoURL];
}

- (void)playVideoWithURL:(NSURL *)url
{
    if (!self.videoController) {
        self.videoController = [[KRVideoPlayerController alloc] initWithFrame:self.videoView.bounds];
        __weak typeof(self)weakSelf = self;
        [self.videoController setDimissCompleteBlock:^{
            weakSelf.videoController = nil;
        }];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playerWillEnterFullscreen) name:MPMoviePlayerWillEnterFullscreenNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playerWillExitFullscreen) name:MPMoviePlayerWillExitFullscreenNotification object:nil];

        [self.videoController showInView:self.videoView];
    }
    self.videoController.contentURL = url;
}

- (void) playerWillEnterFullscreen {
    self.tabBarController.tabBar.hidden = YES;
}

- (void) playerWillExitFullscreen {
    self.tabBarController.tabBar.hidden = NO;
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
