//
//  GVBleDev.h
//  GVObuSDK
//
//  Created by JayZ on 16/12/6.
//  Copyright © 2016年 genvict. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GVDefine.h"

@interface GVBleDev : NSObject

@property (nonatomic, strong) NSString * serviceUUID; //设备服务UUID
@property (nonatomic, strong) NSString * mac; //设备mac地址
@property (nonatomic, strong) NSString * name; //设备名称
@property (nonatomic, strong) NSString * sn; //设备SN号
@property (nonatomic, strong) NSString * version; //设备软件版本信息
@property (nonatomic, assign) int battery; //设备电池电量
@property (nonatomic, assign) GVBleState state; //设备状态

@end
