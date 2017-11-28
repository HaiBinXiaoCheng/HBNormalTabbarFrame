//
//  HBTabBarController.h
//  HBNormalTabbarFrame
//
//  Created by mass on 2017/11/27.
//  Copyright © 2017年 HB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HBTabBarController : UITabBarController

@property (nonatomic, strong) NSArray               *tabsBeanArr;

/**
 *  初始化TabbarController
 *
 *  @param tabsBeanArr 每个tab的配置信息
 *
 *  @return HBTabBarController
 */
- (instancetype)initWithTabsBeanArr:(NSArray *)tabsBeanArr;

@end
