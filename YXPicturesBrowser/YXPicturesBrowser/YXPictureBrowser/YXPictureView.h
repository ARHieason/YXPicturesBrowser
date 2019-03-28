//
//  YXPictureView.h
//  YXPicturesBrowser
//
//  Created by Willing Guo on 16/12/24.
//  Copyright © 2016年 YX. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YXPictureModel;

@protocol YXPictureViewDelegate <NSObject>

@optional

- (void)pictureViewDidTapToDismissPictureBrowser;
- (void)pictureViewDidLongPress;

@end

@interface YXPictureView : UIScrollView

@property (nonatomic, weak) id <YXPictureViewDelegate> pictureViewDelegate;

@property (nonatomic, strong) YXPictureModel *pictureModel;

@property (nonatomic, strong, readonly) UIImageView *imageView;

@end
