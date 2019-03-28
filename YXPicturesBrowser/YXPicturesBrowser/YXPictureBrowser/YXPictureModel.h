//
//  YXPictureModel.h
//  YXPicturesBrowser
//
//  Created by Willing Guo on 16/12/24.
//  Copyright © 2016年 YX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YXPictureModel : UIView

@property (nonatomic, copy) NSString *picURLString;

@property (nonatomic, assign) CGRect originPosition;

@property (nonatomic, assign, readonly) CGRect destinationPosition;

@property (nonatomic, assign) NSInteger index;

@property (nonatomic, assign, getter=isFirstShow) BOOL firstShow;

@property (nonatomic, strong) UIImage *picture;

/**
 Creates and returns a picture model with picURLString, containerView, positionInContainer and index.

 @param picURLString        The URL string of the picture.
 @param containerView       The super view of the picture view.
 @param positionInContainer The picture view's position in its super view.
 @param index               The index of this picture in all pictures.
 @return A picture model.
 */
+ (instancetype)yx_pictureModelWithPicURLString:(NSString *)picURLString containerView:(UIView *)containerView positionInContainer:(CGRect)positionInContainer index:(NSInteger)index;

+ (void)calculateDestinationPositionWithPictureModel:(YXPictureModel *)pictureModel picture:(UIImage *)picture;

@end
