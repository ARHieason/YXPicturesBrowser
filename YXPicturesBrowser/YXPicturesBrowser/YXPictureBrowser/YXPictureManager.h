//
//  YXPictureManager.h
//  YXPicturesBrowser
//
//  Created by wangtao on 2019/1/17.
//  Copyright © 2019年 wangtao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YXPictureManager : NSObject

+ (UIImage *)pictureFromSandbox:(NSString *)URLString;

+ (void)downloadPicture:(NSString *)URLString success:(void (^)(UIImage *picture))success failure:(void (^)(NSError *error))failure;

+ (void)prefetchDownloadPicture:(NSString *)URLString success:(void (^)(UIImage *picture))success;

+ (void)clearCachedImages;

@end

NS_ASSUME_NONNULL_END
