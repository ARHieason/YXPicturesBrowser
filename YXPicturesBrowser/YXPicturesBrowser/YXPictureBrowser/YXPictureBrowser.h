//
//  YXPictureBrowser.h
//  YXPicturesBrowser
//
//  Created by Willing Guo on 16/12/24.
//  Copyright © 2016年 YX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YXPictureModel.h"

@class YXPictureBrowser;

@protocol YXPictureBrowserDelegate <NSObject>

@optional
- (void)pictureBrowserDidShow:(YXPictureBrowser *)pictureBrowser;
- (void)pictureBrowserDidDismiss;

@end

@interface YXPictureBrowser : UIView

/**
 Displays a picture browser with pictureModels, currentIndex and delegate.

 @param pictureModels The models which contains YXPictureModel.
 @param currentIndex  The index of model which will show firstly.
 @param delegate      The receiver’s delegate object.
 */
+ (void)yx_showPictureBrowserWithModels:(NSArray *)pictureModels currentIndex:(NSInteger)currentIndex delegate:(id<YXPictureBrowserDelegate>)delegate;

@end
