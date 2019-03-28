//
//  YXPictureModel.m
//  YXPicturesBrowser
//
//  Created by Willing Guo on 16/12/24.
//  Copyright © 2016年 YX. All rights reserved.
//

#import "YXPictureModel.h"
#import "YXPictureManager.h"

@interface YXPictureModel ()

@property (nonatomic, assign, readwrite) CGRect destinationPosition;

@end

@implementation YXPictureModel

+ (instancetype)yx_pictureModelWithPicURLString:(NSString *)picURLString containerView:(UIView *)containerView positionInContainer:(CGRect)positionInContainer index:(NSInteger)index {
    
    YXPictureModel *pictureModel = [[YXPictureModel alloc] init];
    pictureModel.picURLString = picURLString;
    if (containerView) {
        pictureModel.originPosition = [containerView convertRect:positionInContainer toView:[UIApplication sharedApplication].keyWindow];
    } else {
        pictureModel.originPosition = CGRectMake([UIScreen mainScreen].bounds.size.width * 0.5, [UIScreen mainScreen].bounds.size.height * 0.5, 0, 0);
    }
    pictureModel.index = index;
    [self calculateDestinationPositionWithPictureModel:pictureModel picture:nil];
    return pictureModel;
}

+ (void)calculateDestinationPositionWithPictureModel:(YXPictureModel *)pictureModel picture:(UIImage *)picture {
    
    if (!picture) {
        picture = [YXPictureManager pictureFromSandbox:pictureModel.picURLString];
        pictureModel->_picture = picture;
    }
    if (!picture) {
        return;
    }
    CGFloat destinationPositionX = 0;
    CGFloat destinationPositionY = 0;
    CGFloat destinationPositionW = [UIScreen mainScreen].bounds.size.width;
    CGFloat destinationPositionH = destinationPositionW / picture.size.width * picture.size.height;
    if (destinationPositionH > [UIScreen mainScreen].bounds.size.height) {
//        destinationPositionH = picture.size.height; // 这样处理的话, 如果图片太高会存在显示 bug
    } else {
        destinationPositionY = ([UIScreen mainScreen].bounds.size.height - destinationPositionH) * 0.5;
    }
    pictureModel.destinationPosition = CGRectMake(destinationPositionX, destinationPositionY, destinationPositionW, destinationPositionH);
}

- (void)setPicture:(UIImage *)picture {
    _picture = picture;
    [self.class calculateDestinationPositionWithPictureModel:self picture:picture];
}

@end
