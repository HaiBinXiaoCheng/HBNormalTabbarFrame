//
//  HBReachability.m
//  HB_iOS
//
//  Created by 彭彬 on 2017/9/11.
//  Copyright © 2017年 Bin_Peng. All rights reserved.
//

#import "HBReachability.h"
#import <AFNetworkReachabilityManager.h>
#import "HBGlobalConfig.h"
#import "HBPreference.h"

@implementation HBReachability

+ (void)reachabilityNetStatus {
    BOOL isFirst = YES;
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    // 提示：要监控网络连接状态，必须要先调用单例的startMonitoring方法
    [manager startMonitoring];
    __block typeof(isFirst) blockIsFirst = isFirst;
    //检测的结果
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        HBNetStatus netStatus;
        if (status == AFNetworkReachabilityStatusNotReachable) {
            netStatus = HBNetStatus_None;
            [[HBGlobalConfig shareInstance].globalHUD showToastWithText:@"网络连接有问题"];
        }else if (status == AFNetworkReachabilityStatusReachableViaWWAN) {
            netStatus = HBNetStatus_GPRS;
            [[HBGlobalConfig shareInstance].globalHUD showToastWithText:@"正在使用移动网络"];
        }else if (status == AFNetworkReachabilityStatusReachableViaWiFi) {
            netStatus = HBNetStatus_WiFi;
            if (!blockIsFirst) {
                [[HBGlobalConfig shareInstance].globalHUD showToastWithText:@"WIFI连接成功"];
            }
        }else {
            netStatus = HBNetStatus_UnKonw;
//            [[HBGlobalConfig shareInstance].globalHUD showToastWithText:@"谁知道用的什么网络"];
        }
        HBPREFERENCES_INSTANCE.netStatus = netStatus;
        blockIsFirst = NO;
    }];
}

@end
