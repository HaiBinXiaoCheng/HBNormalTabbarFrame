//
//  HBGlobalConfig.m
//  HB_iOS
//
//  Created by 彭彬 on 2017/9/7.
//  Copyright © 2017年 Bin_Peng. All rights reserved.
//

#import "HBGlobalConfig.h"
#import "HBReachability.h"
#import "HBDefines.h"

static HBGlobalConfig *shareInstance = nil;

@implementation HBGlobalConfig

+ (HBGlobalConfig *)shareInstance {
    
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        shareInstance = [[HBGlobalConfig alloc] init];
    });
    return shareInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _globalNet = [[HBNetwork alloc] init];
    }
    return self;
}
/**
 *  获取当前正在展示控制器的HUD
 *
 *  @return HUD
 */
- (HBHUD *)globalHUD {
    if ([self HBPresentingVC] && [self HBPresentingVC].HUD) {
        _globalHUD = [self HBPresentingVC].HUD;
    }
    if (!_globalHUD) {
        _globalHUD = [[HBHUD alloc] init];
    }
    return _globalHUD;
}

/**
 APP启动入口

 @param launchOptions delegate入口
 */
- (void)applicationDidFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    _tabbarVC = [HBTabBarManager configTabBarController];
    [self.window setRootViewController:_tabbarVC];
    
    //初始化系统配置
    [self initSysConfig];
}

/**
App从后台变为活跃入口
 
@param application launchOptions AppDelegate中启动
 */
- (void)appDidBecomeActive:(UIApplication *)application {
    
}

//初始化系统配置
- (void)initSysConfig {
    //设置UIButton的排他性，点击互斥
    [[UIButton appearance] setExclusiveTouch:YES];
    //开始检查网络变化
    [HBReachability reachabilityNetStatus];
}

//获取到当前控制器
- (HBViewController *)HBPresentingVC {
    
    UIWindow * window = kKEY_WINDOW;
    if (window.windowLevel != UIWindowLevelNormal){
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows){
            if (tmpWin.windowLevel == UIWindowLevelNormal){
                window = tmpWin;
                break;
            }
        }
    }
    UIViewController *result = window.rootViewController;
    while (result.presentedViewController) {
        result = result.presentedViewController;
    }
    if ([result isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabbar = (UITabBarController *)result;
        result = tabbar.selectedViewController;
    }
    if ([result isKindOfClass:[UINavigationController class]]) {
        result = [(UINavigationController *)result visibleViewController];
    }
    if ([result isKindOfClass:[HBViewController class]]) {
        return (HBViewController *)result;
    }
    return nil;
}


@end
