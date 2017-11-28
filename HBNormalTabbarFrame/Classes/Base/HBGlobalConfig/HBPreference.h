//
//  HBPreference.h
//  HBNormalTabbarFrame
//
//  Created by 彭彬 on 2017/11/27.
//  Copyright © 2017年 HB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HBReachability.h"

#define HBPREFERENCES_INSTANCE     [HBPreference sharedInstance]

@interface HBPreference : NSObject

/**
 *  单例
 */
+ (instancetype)sharedInstance;

@property (nonatomic)   HBNetStatus netStatus;

@property (nonatomic) BOOL limitedPhotoGraphDevice;//是否有相机访问权限
@property (nonatomic) BOOL limitedPhotoLibraryDevice;//是否有相册访问权限


@end
