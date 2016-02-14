//
//  AppDelegate.m
//  MyOne
//
//  Created by HelloWorld on 7/27/15.
//  Copyright (c) 2015 melody. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "ArticleViewController.h"
#import "QuestionViewController.h"
#import "ThingViewController.h"
#import "PersonViewController.h"
#import "DSNavigationBar.h"
#import "AppConfigure.h"
#import "TopWindow.h"
// ShareSDK头文件
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKConnector/ShareSDKConnector.h>
// 腾讯开放平台（对应QQ和QQ空间）SDK头文件
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>
// 微信SDK头文件
#import "WXApi.h"
// 新浪微博SDK头文件
// 新浪微博SDK需要在项目Build Settings中的Other Linker Flags添加"-ObjC"
#import "WeiboSDK.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    /**
     *  设置ShareSDK的appKey，如果尚未在ShareSDK官网注册过App，请移步到http://mob.com/login 登录后台进行应用注册，
     *  在将生成的AppKey传入到此方法中。
     *  方法中的第二个参数用于指定要使用哪些社交平台，以数组形式传入。第三个参数为需要连接社交平台SDK时触发，
     *  在此事件中写入连接代码。第四个参数则为配置本地社交平台时触发，根据返回的平台类型来配置平台信息。
     *  如果您使用的时服务端托管平台信息时，第二、四项参数可以传入nil，第三项参数则根据服务端托管平台来决定要连接的社交SDK。
     */
    [ShareSDK registerApp:@"iosv1101"
          activePlatforms:@[
                            @(SSDKPlatformTypeSinaWeibo),
                            @(SSDKPlatformTypeCopy),
                            @(SSDKPlatformTypeWechat),
                            @(SSDKPlatformTypeQQ)
                            ]
                 onImport:^(SSDKPlatformType platformType) {
                     
                     switch (platformType)
                     {
                         case SSDKPlatformTypeWechat:
                             [ShareSDKConnector connectWeChat:[WXApi class]];
                             break;
                         case SSDKPlatformTypeQQ:
                             [ShareSDKConnector connectQQ:[QQApiInterface class]
                                        tencentOAuthClass:[TencentOAuth class]];
                             break;
                         case SSDKPlatformTypeSinaWeibo:
                             [ShareSDKConnector connectWeibo:[WeiboSDK class]];
                             break;
                         default:
                             break;
                     }
                     
                 }
          onConfiguration:^(SSDKPlatformType platformType, NSMutableDictionary *appInfo) {
              
              switch (platformType)
              {
                  case SSDKPlatformTypeSinaWeibo:
                      //设置新浪微博应用信息,其中authType设置为使用SSO＋Web形式授权
                      [appInfo SSDKSetupSinaWeiboByAppKey:@"568898243"
                                                appSecret:@"38a4f8204cc784f81f9f0daaf31e02e3"
                                              redirectUri:@"http://itangqi.me"
                                                 authType:SSDKAuthTypeBoth];
                      break;
                  case SSDKPlatformTypeWechat:
                      [appInfo SSDKSetupWeChatByAppId:@"wx4868b35061f87885"
                                            appSecret:@"64020361b8ec4c99936c0e3999a9f249"];
                      break;
                  case SSDKPlatformTypeQQ:
                      [appInfo SSDKSetupQQByAppId:@"100371282"
                                           appKey:@"aed9b0303e3ed1e27bae87c33761161d"
                                         authType:SSDKAuthTypeBoth];
                      break;
                  default:
                      break;
              }
          }];
	// Override point for customization after application launch.
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	
	UITabBarController *rootTabBarController = [[UITabBarController alloc] init];
	
	// 首页
	HomeViewController *homeViewController = [[HomeViewController alloc] init];
	UINavigationController *homeNavigationController = [self dsNavigationController];
	[homeNavigationController setViewControllers:@[homeViewController]];
	// 文章
	ArticleViewController *readingViewController = [[ArticleViewController alloc] init];
	UINavigationController *readingNavigationController = [self dsNavigationController];
	[readingNavigationController setViewControllers:@[readingViewController]];
	// 问题
	QuestionViewController *questionViewController = [[QuestionViewController alloc] init];
	UINavigationController *questionNavigationController = [self dsNavigationController];
	[questionNavigationController setViewControllers:@[questionViewController]];
	// 东西
	ThingViewController *thingViewController = [[ThingViewController alloc] init];
	UINavigationController *thingNavigationController = [self dsNavigationController];
	[thingNavigationController setViewControllers:@[thingViewController]];
	// 个人
	PersonViewController *personViewController = [[PersonViewController alloc] init];
	UINavigationController *personNavigationController = [self dsNavigationController];
	[personNavigationController setViewControllers:@[personViewController]];
	
	rootTabBarController.viewControllers = @[homeNavigationController, readingNavigationController, questionNavigationController, thingNavigationController, personNavigationController];
	rootTabBarController.tabBar.tintColor = [UIColor colorWithRed:55 / 255.0 green:196 / 255.0 blue:242 / 255.0 alpha:1];
	rootTabBarController.tabBar.barTintColor = [UIColor colorWithRed:239 / 255.0 green:239 / 255.0 blue:239 / 255.0 alpha:1];
	rootTabBarController.tabBar.backgroundColor = [UIColor clearColor];
	
	if ([AppConfigure boolForKey:APP_THEME_NIGHT_MODE]) {
		[[DSNavigationBar appearance] setNavigationBarWithColor:NightNavigationBarColor];
		
		rootTabBarController.tabBar.backgroundImage = [self imageWithColor:[UIColor colorWithRed:48 / 255.0 green:48 / 255.0 blue:48 / 255.0 alpha:1]];
		
		// 设置状态栏的字体颜色为黑色
		[application setStatusBarStyle:UIStatusBarStyleDefault];
		
		[DKNightVersionManager nightFalling];
		self.window.backgroundColor = NightBGViewColor;
	} else {
		// create a color and set it to the DSNavigationBar appereance
		[[DSNavigationBar appearance] setNavigationBarWithColor:DawnNavigationBarColor];
		
		rootTabBarController.tabBar.backgroundImage = [self imageWithColor:[UIColor colorWithRed:241 / 255.0 green:241 / 255.0 blue:241 / 255.0 alpha:1]];
		
		// 设置状态栏的字体颜色为黑色
		[application setStatusBarStyle:UIStatusBarStyleDefault];
		self.window.backgroundColor = [UIColor whiteColor];
	}
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(nightModeSwitch:) name:@"DKNightVersionNightFallingNotification" object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(nightModeSwitch:) name:@"DKNightVersionDawnComingNotification" object:nil];
	
	self.window.rootViewController = rootTabBarController;
	[self.window makeKeyAndVisible];
	
	if (!(isGreatThanIOS9)) {
		// 添加一个window, 点击这个window, 可以让屏幕上的scrollView滚到最顶部
		[TopWindow show];
	}
	
	return YES;
}

- (UINavigationController *)dsNavigationController {
	UINavigationController *navigationController = [[UINavigationController alloc] initWithNavigationBarClass:[DSNavigationBar class] toolbarClass:nil];
	[navigationController.navigationBar setOpaque:YES];
	navigationController.navigationBar.tintColor = [UIColor colorWithRed:100 / 255.0 green:100 / 255.0 blue:100 / 255.0 alpha:229 / 255.0];
	
	return navigationController;
}

- (UIImage *)imageWithColor:(UIColor *)color {
	CGRect rect = CGRectMake(0, 0, 1, 1);
	UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
	[color setFill];
	UIRectFill(rect);
	
	UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	return image;
}

#pragma mark - NSNotification

- (void)nightModeSwitch:(NSNotification *)notification {
	if (Is_Night_Mode) {
//		NSLog(@"AppDelegate ---- Night Mode");
		[[DSNavigationBar appearance] setNavigationBarWithColor:NightNavigationBarColor];
		self.window.backgroundColor = NightBGViewColor;
	} else {
//		NSLog(@"AppDelegate ---- Dawn Mode");
		[[DSNavigationBar appearance] setNavigationBarWithColor:DawnNavigationBarColor];
		self.window.backgroundColor = [UIColor whiteColor];
	}
}

- (void)applicationWillResignActive:(UIApplication *)application {
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
