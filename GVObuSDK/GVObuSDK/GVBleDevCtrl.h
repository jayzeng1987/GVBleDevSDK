//
//  GVBleDevCtrl.h
//  GVObuSDK
//
//  Created by JayZ on 16/12/6.
//  Copyright © 2016年 genvict. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GVDefine.h"

@interface GVBleDevCtrl : NSObject

-(void)setObuSDKDelegate:(id)object; //设置代理
-(Boolean)isEnabledBluetooth; //判断蓝牙是否打开
-(Boolean)checkConnection; //检查设备连接状态
-(Boolean)bindDev:(NSString *)uuid; //绑定设备
-(Boolean)unbindDev; //设备解绑
-(void)startScanDevice:(int)timeout callback:(GVResultBlock)resultBlock;  //扫描设备，timeout <= 0, 则需调用stopScanDevice接口
-(void)stopScanDevice; //停止扫描设备
-(void)connectDevice:(int)timeout callback:(GVResultBlock)resultBlock; //按照金溢默认规则连接设备
-(void)connectDeviceWithUUID:(NSString *)serviceUUID timeout:(int)timeout callback:(GVResultBlock)resultBlock; //根据设备蓝牙UUID连接
-(void)connectDeviceWithName:(NSString *)devName timeout:(int)timeout callback:(GVResultBlock)resultBlock; //根据设备名称连接

@end
