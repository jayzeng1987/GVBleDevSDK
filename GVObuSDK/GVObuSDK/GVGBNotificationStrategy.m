//
//  GVGBNotificationStrategy.m
//  GVObuSDK
//
//  Created by JayZ on 16/12/6.
//  Copyright © 2016年 genvict. All rights reserved.
//

#import "GVGBNotificationStrategy.h"

@implementation GVGBNotificationStrategy

static GVGBNotificationStrategy * s_instance = nil;
+(instancetype)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        s_instance = [[[self class] alloc] init];
        //所有的属性必须放在这里初始化
        
        
    });
    
    return s_instance;
}

+(instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        s_instance = [super allocWithZone:zone];
    });
    
    return s_instance;
}

@end
