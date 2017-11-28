//
//  HBTabPropertyBean.m
//  HB_iOS
//
//  Created by 彭彬 on 2017/9/6.
//  Copyright © 2017年 Bin_Peng. All rights reserved.
//

#import "HBTabPropertyBean.h"

static NSString * const kTabBarTitle            =    @"TabTitle";
static NSString * const kTabBarClassName        =    @"className";
static NSString * const kTabBarIsSelected       =    @"isSelected";
static NSString * const kTabBarDefaultImage     =    @"defaultImage";
static NSString * const kTabBarSelectedImage    =    @"selectedImage";

@implementation HBTabPropertyBean

- (instancetype)initWithControllersInfo:(NSDictionary *)dic {
    
    self = [super init];
    if (self) {
        if (dic && [dic isKindOfClass:[NSDictionary class]]) {
            _tabTitle = dic[kTabBarTitle];
            _className = dic[kTabBarClassName];
            _isSelected = [dic[kTabBarIsSelected] boolValue];
            _defaultImage = dic[kTabBarDefaultImage];
            _selectedImage = dic[kTabBarSelectedImage];
        }
        
    }
    return self;
}

@end
