//
//  YXPictureManager.m
//  YXPicturesBrowser
//
//  Created by wangtao on 2019/1/17.
//  Copyright © 2019年 wangtao. All rights reserved.
//

#import "YXPictureManager.h"

#define YXPicturesDirectory      [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] \
stringByAppendingPathComponent:NSStringFromClass([self class])]

//https://yixunfiles-ali.yixun.arhieason.com/69422e9dc9d6b4150248efc640330750_jpg.jpg?x-oss-process=image/format,png
#define YXPictureName(URLString) [URLString stringByDeletingLastPathComponent].lastPathComponent

#define YXPicturePath(URLString) [YXPicturesDirectory stringByAppendingPathComponent:YXPictureName(URLString)]

@implementation YXPictureManager

+ (void)load {
    NSString *imagesDirectory = YXPicturesDirectory;
    BOOL isDirectory = NO;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isExists = [fileManager fileExistsAtPath:imagesDirectory isDirectory:&isDirectory];
    if (!isExists || !isDirectory) {
        [fileManager createDirectoryAtPath:imagesDirectory withIntermediateDirectories:YES attributes:nil error:nil];
    }
}

+ (UIImage *)pictureFromSandbox:(NSString *)URLString {
    
    NSString *imagePath = YXPicturePath(URLString);
    NSData *data = [NSData dataWithContentsOfFile:imagePath];
    if (data.length > 0 ) {
        return [UIImage imageWithData:data];
    } else {
        [[NSFileManager defaultManager] removeItemAtPath:imagePath error:NULL];
    }
    return nil;
}

+ (void)downloadPicture:(NSString *)URLString success:(void (^)(UIImage *picture))success failure:(void (^)(NSError *error))failure {
    
    [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:URLString] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            if (failure) {
                failure(error);
            }
            return;
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            if (success) {
                UIImage *image = [UIImage imageWithData:data];
                success(image);
            }
        });
        [data writeToFile:YXPicturePath(URLString) atomically:YES];
    }] resume];
}

+ (void)prefetchDownloadPicture:(NSString *)URLString success:(void (^)(UIImage *picture))success {
    
    [self downloadPicture:URLString success:success failure:nil];
}

+ (void)clearCachedImages {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *fileNames = [fileManager contentsOfDirectoryAtPath:YXPicturesDirectory error:nil];
    for (NSString *fileName in fileNames) {
        [fileManager removeItemAtPath:[YXPicturesDirectory stringByAppendingPathComponent:fileName] error:nil];
    }
}

@end
