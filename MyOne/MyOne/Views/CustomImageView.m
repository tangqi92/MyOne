//
//  CustomImageView.m
//  MyOne
//
//  Created by HelloWorld on 8/3/15.
//  Copyright (c) 2015 melody. All rights reserved.
//

#import "CustomImageView.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface CustomImageView ()

@end

@implementation CustomImageView

- (void)configureImageViwWithImageURL:(NSURL *)url {
    
    [self sd_setImageWithURL:url placeholderImage:nil options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
    }];
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
