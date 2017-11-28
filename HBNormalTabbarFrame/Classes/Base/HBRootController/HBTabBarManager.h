//
//  HBTabBarManager.h
//  HB_iOS
//
//  Created by 彭彬 on 2017/9/6.
//  Copyright © 2017年 Bin_Peng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HBTabBarController.h"


@interface HBTabBarManager : NSObject

/**
*  对HBTabBarController进行封装
*
*  @return 返回配置好的tabBarController
*/
+ (HBTabBarController *)configTabBarController;

@end
