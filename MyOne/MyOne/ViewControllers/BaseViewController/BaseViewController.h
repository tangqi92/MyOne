//
//  BaseViewController.h
//  MyOne
//
//  Created by HelloWorld on 7/28/15.
//  Copyright (c) 2015 melody. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

@property (nonatomic, copy) void (^hudWasHidden)(void);

- (UIImage *)imageWithColor:(UIColor *)color;

/**
 *  设置导航栏
 *
 *  @param show  是否显示右侧的分享按钮
 */
- (void)setUpNavigationBarShowRightBarButtonItem:(BOOL)show;

/**
 *  点击分享按钮时调用
 */
- (void)shareToSocial;

/**
 *  不显示返回按钮的Title
 */
- (void)dontShowBackButtonTitle;

/**
 *  提示相关方法
 */
- (void)showHUDWithText:(NSString *)text;
- (void)showHUDWithText:(NSString *)text delay:(NSTimeInterval)delay;

/**
 *  隐藏当前显示的提示框
 */
- (void)hideHud;

@end
