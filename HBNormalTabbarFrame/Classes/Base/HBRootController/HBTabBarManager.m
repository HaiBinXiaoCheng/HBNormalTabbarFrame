//
//  HBTabBarManager.m
//  HB_iOS
//
//  Created by 彭彬 on 2017/9/6.
//  Copyright © 2017年 Bin_Peng. All rights reserved.
//

#import "HBTabBarManager.h"
#import "HBTabPropertyBean.h"


@implementation HBTabBarManager


// 对HBBaseTabViewController进行封装,返回tabController
+ (HBTabBarController *)configTabBarController {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"HBTabBarConfig" ofType:@"plist"];
    NSArray *allTabs = [NSArray arrayWithContentsOfFile:path];
    // 从plist中读取Controllers的设置
    NSMutableArray *tabsBeanArr = [NSMutableArray array];
    NSInteger selectedIndex = 0;
    for (int i = 0; i < [allTabs count]; i++) {
        NSDictionary *tabBeanDic = allTabs[i];
        if (tabBeanDic) {
            HBTabPropertyBean *bean = [[HBTabPropertyBean alloc] initWithControllersInfo:tabBeanDic];
            [tabsBeanArr addObject:bean];
            if (bean.isSelected) {
                selectedIndex = i;
            }
        }
    }
    HBTabBarController *tabbarController = [[HBTabBarController alloc] initWithTabsBeanArr:tabsBeanArr];
    //设置标签栏图片与文字颜色，如果使用自定义图片，此处应该注视
    tabbarController.tabBar.tintColor = [UIColor redColor];
    tabbarController.selectedIndex = selectedIndex;
    return tabbarController;
}


@end
