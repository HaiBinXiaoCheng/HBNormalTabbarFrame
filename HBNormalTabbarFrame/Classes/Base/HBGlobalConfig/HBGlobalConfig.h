//
//  HBGlobalConfig.h
//  HB_iOS
//
//  Created by 彭彬 on 2017/9/7.
//  Copyright © 2017年 Bin_Peng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HBNavigationController.h"
#import "HBTabBarManager.h"
#import "HBNetwork.h"
#import "HBHUD.h"
#import "HBViewController.h"

@interface HBGlobalConfig : NSObject


@property (nonatomic, strong)   UIWindow                  *window;
@property (nonatomic, strong)   HBTabBarController        *tabbarVC;
@property (nonatomic, strong)   HBNetwork                 *globalNet;
@property (nonatomic, strong)   HBHUD                     *globalHUD;

@property (nonatomic, strong)   HBViewController           *HBPresentingVC;

/**
 单利

 @return 返回全局唯一的一个全局配置对象
 */
+ (HBGlobalConfig *)shareInstance;

/**
 APP启动入口
 
 @param launchOptions delegate入口
 */
- (void)applicationDidFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

/**
 App从后台变为活跃入口
 
 @param application launchOptions AppDelegate中启动
 */
- (void)appDidBecomeActive:(UIApplication *)application;

@end
