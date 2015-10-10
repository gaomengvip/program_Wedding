//
//  PlayController.m
//  Wedding
//
//  Created by lanou3g on 15/10/9.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "PlayController.h"
#import <AVFoundation/AVFoundation.h>
@interface PlayController ()

@end

@implementation PlayController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url = [NSURL URLWithString:self.str];
    AVAsset *asset = [AVURLAsset URLAssetWithURL:url options:nil];
    AVPlayerItem *playerItem = [AVPlayerItem playerItemWithAsset:asset];
    AVPlayer *player = [AVPlayer playerWithPlayerItem:playerItem];
    AVPlayerLayer *layer = [AVPlayerLayer playerLayerWithPlayer:player];
    layer.videoGravity = AVLayerVideoGravityResizeAspect;
    layer.frame = CGRectMake(10, 80, 350, 500);
    [self.view.layer addSublayer:layer];
    [player play];
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
