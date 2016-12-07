//
//  GVObuSDKDelegate.h
//  GVObuSDK
//
//  Created by JayZ on 16/12/6.
//  Copyright © 2016年 genvict. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GVBleDev.h"

@protocol GVObuSDKDelegate <NSObject>

@optional
-(void)didUpdateBleState:(GVBleState)state; //设备状态更新时触发
-(void)didDiscoverDev:(GVBleDev *)dev; //发现设备时触发
-(void)didDisConnectDev; //设备断开时触发

@end
