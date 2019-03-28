//
//  YXPictureCell.h
//  YXPicturesBrowser
//
//  Created by Willing Guo on 16/12/24.
//  Copyright © 2016年 YX. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YXPictureModel, YXPictureView;

@protocol YXPictureCellDelegate <NSObject>

@optional

- (void)pictureCellDidPanToAlpha:(CGFloat)alpha;
- (void)pictureCellDidPanToDismiss;

@end

static NSString * const pictureViewID = @"YXPictureView";

@interface YXPictureCell : UICollectionViewCell

@property (nonatomic, weak) id <YXPictureCellDelegate> delegate;

@property (nonatomic, strong) YXPictureModel *pictureModel;

@property (nonatomic, strong) YXPictureView *pictureView;

@end
