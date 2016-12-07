//
//  GVGBBleDevAPI.h
//  GVObuSDK
//
//  Created by JayZ on 16/12/6.
//  Copyright © 2016年 genvict. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GVObuResult.h"

@interface GVGBBleDevAPI : NSObject

-(void)setObuSDKDelegate:(id)object; //设置代理
-(void)setProtocolType:(GVProtocolType)type callback:(GVResultBlock)resultBlock; //设置协议类型
-(Boolean)isEnabledBluetooth; //判断蓝牙是否打开
-(Boolean)checkConnection; //检查设备连接状态
-(Boolean)bindDev:(NSString *)uuid; //绑定设备
-(Boolean)unbindDev; //设备解绑
-(void)startScanDevice:(int)timeout callback:(GVResultBlock)resultBlock;  //扫描设备，timeout <= 0, 则需调用stopScanDevice接口
-(void)stopScanDevice; //停止扫描设备
-(void)connectDevice:(int)timeout callback: (GVResultBlock)resultBlock; //按照金溢默认规则连接设备
-(void)connectDeviceWithUUID:(NSString *)serviceUUID timeout:(int)timeout callback:(GVResultBlock)resultBlock; //根据设备蓝牙UUID连接
-(void)connectDeviceWithName:(NSString *)devName timeout:(int)timeout callback:(GVResultBlock)resultBlock; //根据设备名称连接
-(void)disconnectDevice:(GVResultBlock)resultBlock; //断开设备连接，断电
-(void)switchCommType:(GVBleCommType)type callback: (GVResultBlock)resultBlock; //切换蓝牙通讯类型，Indication or Notification
-(void)initDevice:(NSData*) data callback:(GVResultBlock)resultBlock; //初始化设备接口
-(void)devChannel:(NSData*)data callback:(GVResultBlock)resultBlock; //设备通道接口
-(void)cosChannel:(NSData*)data callback:(GVResultBlock)resultBlock; //cos通道接口
-(void)getDevRecords:(NSData*)data callback:(GVResultBlock)resultBlock; //获取设备记录接口（设备日志）
-(void)authChannel:(NSData*)data callback:(GVResultBlock)resultBlock; //认证通道接口
-(void)transChannel:(NSData*)data callback:(GVResultBlock)resultBlock; //透传通道接口
-(void)manufacturerChannel: (NSData*)data callback:(GVResultBlock)resultBlock; //厂商通道接口

@end
