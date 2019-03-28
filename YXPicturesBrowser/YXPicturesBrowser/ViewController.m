//
//  ViewController.m
//  YXPicturesBrowser
//
//  Created by wangtao on 2019/1/17.
//  Copyright © 2019年 wangtao. All rights reserved.
//

#import "ViewController.h"
#import "YXPictureBrowser/YXPictureBrowser.h"
#import "YXPictureBrowser/YXPictureModel.h"

@interface ViewController ()<YXPictureBrowserDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100 + 60, 100, 50);
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"图片显示" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(playAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)playAction:(UIButton *)sender {
    NSArray *imageURLArray = @[@"https://yixunfiles-ali.yixun.arhieason.com/70b1d9621b6f53268ef180d9bd5598d7_jpeg.jpeg?x-oss-process=image/resize,w_400,limit_1,format,png",@"http://yixunfiles-ali.yixun.arhieason.com/8db440ff444325eed80a41da01b9cac4_jpg.jpg?x-oss-process=image/resize,w_480,h_0",@"http://yixunfiles-ali.yixun.arhieason.com/b9663ee35e07a8ed3056aef188303823_jpg.jpg?x-oss-process=image/resize,w_480,h_0"];
    NSMutableArray *imageBrowserModels = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < imageURLArray.count; i ++) {
        YXPictureModel *imageBrowserModel = [YXPictureModel yx_pictureModelWithPicURLString:imageURLArray[i]
                                                                              containerView:nil
                                                                        positionInContainer:CGRectZero
                                                                                      index:i];
        [imageBrowserModels addObject:imageBrowserModel];
    }
    [YXPictureBrowser yx_showPictureBrowserWithModels:imageBrowserModels currentIndex:0 delegate:self];
}

#pragma mark - YXPictureBrowserDelegate

- (void)pictureBrowserDidShow:(YXPictureBrowser *)pictureBrowser {
    
}

- (void)pictureBrowserDidDismiss {
    
}

@end
