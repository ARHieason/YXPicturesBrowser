//
//  YXPictureCell.m
//  YXPicturesBrowser
//
//  Created by Willing Guo on 16/12/24.
//  Copyright © 2016年 YX. All rights reserved.
//

#import "YXPictureCell.h"
#import "YXPictureModel.h"
#import "YXPictureView.h"

#define kPanToDimissOffsetY 200

@implementation YXPictureCell

- (id)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        _pictureView = [[YXPictureView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [_pictureView.panGestureRecognizer addTarget:self action:@selector(scrollViewPanAction:)];
        [self.contentView addSubview:_pictureView];
    }
    return self;
}

- (void)setPictureModel:(YXPictureModel *)pictureModel {
    
    _pictureModel = pictureModel;
    
    _pictureView.pictureModel = pictureModel;
}

- (void)scrollViewPanAction:(UIPanGestureRecognizer*)pan {
    
    if (_pictureView.zoomScale != 1.0) {
        return;
    }
    if (_pictureView.contentOffset.y > 0) {
        return;
    }
    if (pan.state == UIGestureRecognizerStateEnded) {
        if (ABS(_pictureView.contentOffset.y) < kPanToDimissOffsetY) {
            [UIView animateWithDuration:0.5 animations:^{
                _pictureView.contentInset = UIEdgeInsetsZero;
                if ([self.delegate respondsToSelector:@selector(pictureCellDidPanToAlpha:)]) {
                    [self.delegate pictureCellDidPanToAlpha:1.0];
                }
            }];
            return;
        }
        [UIView animateWithDuration:0.5 animations:^{
            CGRect frame = _pictureView.imageView.frame;
            frame.origin.y = self.bounds.size.height;
            _pictureView.imageView.frame = frame;
            if ([self.delegate respondsToSelector:@selector(pictureCellDidPanToAlpha:)]) {
                [self.delegate pictureCellDidPanToAlpha:0];
            }
        } completion:^(BOOL finished) {
            if ([self.delegate respondsToSelector:@selector(pictureCellDidPanToDismiss)]) {
                [self.delegate pictureCellDidPanToDismiss];
            }
        }];
    } else {
        _pictureView.contentInset = UIEdgeInsetsMake(-_pictureView.contentOffset.y, 0, 0, 0);
        CGFloat alpha = 1 - ABS(_pictureView.contentOffset.y / (self.bounds.size.height));
        if ([self.delegate respondsToSelector:@selector(pictureCellDidPanToAlpha:)]) {
            [self.delegate pictureCellDidPanToAlpha:alpha];
        }
    }
}

@end
