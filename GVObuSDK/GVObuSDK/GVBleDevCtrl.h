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
-(void)isEnabledBluetooth:(GVResultBlock)resultBlock; //判断蓝牙是否打开
-(void)checkConnection:(GVResultBlock)resultBlock; //检查设备连接状态
-(void)bindDev:(NSString *)uuid callback:(GVResultBlock)resultBlock; //绑定设备
-(void)unbindDev:(GVResultBlock)resultBlock; //设备解绑
-(void)startScanDevice:(NSTimeInterval)timeout callback:(GVResultBlock)resultBlock;  //扫描设备，timeout <= 0, 则需调用stopScanDevice接口
-(void)stopScanDevice; //停止扫描设备
-(void)connectDevice:(NSTimeInterval)timeout callback:(GVResultBlock)resultBlock; //按照金溢默认规则连接设备
-(void)connectDeviceWithUUID:(NSString *)serviceUUID timeout:(NSTimeInterval)timeout callback:(GVResultBlock)resultBlock; //根据设备蓝牙UUID连接
-(void)connectDeviceWithName:(NSString *)devName timeout:(NSTimeInterval)timeout callback:(GVResultBlock)resultBlock; //根据设备名称连接

@end
