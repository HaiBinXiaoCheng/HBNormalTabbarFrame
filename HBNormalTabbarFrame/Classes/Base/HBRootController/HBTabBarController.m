//
//  HBTabBarController.m
//  HBNormalTabbarFrame
//
//  Created by mass on 2017/11/27.
//  Copyright © 2017年 HB. All rights reserved.
//

#import "HBTabBarController.h"
#import "HBNavigationController.h"
#import "HBTabPropertyBean.h"
#import "HBViewController.h"

@interface HBTabBarController ()

@end

@implementation HBTabBarController

- (instancetype)initWithTabsBeanArr:(NSArray *)tabsBeanArr
{
    self = [super init];
    if (self) {
        _tabsBeanArr = tabsBeanArr;
        
        [self setUpAllChildViewController];
    }
    return self;
}

/**
 *  添加所有子控制器
 */
- (void)setUpAllChildViewController{
    for (HBTabPropertyBean *tabBean in _tabsBeanArr) {
        [self creatChildViewControllerWithTabPropertyBean:tabBean];
    }
}
/**
 *  添加一个子控制器的方法
 */
- (void)creatChildViewControllerWithTabPropertyBean:(HBTabPropertyBean *)tabBean {
    HBViewController *viewController = [(HBViewController *)[NSClassFromString(tabBean.className) alloc] init];
    viewController.tabBarItem.title = tabBean.tabTitle;
    viewController.tabBarItem.titlePositionAdjustment = UIOffsetMake(10, 0);
    viewController.tabBarItem.image = [UIImage imageNamed:tabBean.defaultImage];
    HBNavigationController *navi = [[HBNavigationController alloc] initWithRootViewController:viewController];
    [self addChildViewController:navi];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
