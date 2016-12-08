//
//  GVObuSDK.h
//  GVObuSDK
//
//  Created by JayZ on 16/8/9.
//  Copyright © 2016年 genvict. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GVDefine.h"

@interface GVObuSDK : NSObject

+(instancetype)sharedObuSDK; //获取SDK单例实例
-(NSString *)getSDKVersion; //获取SDK版本信息
-(void)setObuSDKDelegate:(id)object; //设置代理
-(void)setProtocolType:(GVProtocolType)type callback:(GVResultBlock)resultBlock; //设置协议类型
-(void)isEnabledBluetooth:(GVResultBlock)resultBlock; //判断蓝牙是否打开
-(void)checkConnection:(GVResultBlock)resultBlock; //检查设备连接状态
-(void)bindDev:(NSString *)uuid callback:(GVResultBlock)resultBlock; //绑定设备
-(void)unbindDev:(GVResultBlock)resultBlock; //设备解绑
-(void)startScanDevice:(int)timeout callback:(GVResultBlock)resultBlock;  //扫描设备，timeout <= 0, 则需调用stopScanDevice接口
-(void)stopScanDevice; //停止扫描设备
-(void)connectDevice:(int)timeout callback:(GVResultBlock)resultBlock; //按照金溢默认规则连接设备
-(void)connectDeviceWithUUID:(NSString *)serviceUUID timeout:(int)timeout callback:(GVResultBlock)resultBlock; //根据设备蓝牙UUID连接
-(void)connectDeviceWithName:(NSString *)devName timeout:(int)timeout callback:(GVResultBlock)resultBlock; //根据设备名称连接
-(void)disconnectDevice:(GVResultBlock)resultBlock;  //断开设备连接，断电
-(void)switchCommType:(GVBleCommType)type callback:(GVResultBlock)resultBlock; //切换蓝牙通讯类型，Indication or Notification
-(void)initDevice:(NSData*) data callback:(GVResultBlock)resultBlock; //初始化设备接口
-(void)devChannel:(NSData*) data callback:(GVResultBlock)resultBlock; //设备通道接口
-(void)cosChannel:(NSData*) data callback:(GVResultBlock)resultBlock; //cos通道接口
-(void)getDevRecords:(NSData*) data callback:(GVResultBlock)resultBlock; //获取设备记录接口（设备日志）
-(void)authChannel:(NSData*) data callback:(GVResultBlock)resultBlock; //认证通道接口
-(void)transChannel:(NSData*) data callback:(GVResultBlock)resultBlock; //透传通道接口
-(void)manufacturerChannel:(NSData*) data callback:(GVResultBlock)resultBlock; //厂商通道接口
-(void)getDevSN:(GVResultBlock)resultBlock;  //获取设备表面号
-(void)getDevVersion:(GVResultBlock)resultBlock; //获取设备版本号
-(void)getDevBattery:(GVResultBlock)resultBlock; //获取设备电池电量
-(void)resetDev:(GVResultBlock)resultBlock; //设备复位
-(void)getDevMac:(GVResultBlock)resultBlock; //获取设备蓝牙MAC
-(void)getDevInfo:(GVResultBlock)resultBlock; //获取设备信息，ASCII，最长100字节
-(void)getICCInfo:(GVResultBlock)resultBlock; //获取IC卡信息（0015文件）
-(void)getICCTransactionRecords:(NSString *)pinCode maxNumber:(int)maxNumber callback:(GVResultBlock)resultBlock; //获取IC卡交易记录
-(void)getICCConsumeRecords:(int)maxNumber callback:(GVResultBlock)resultBlock; //获取IC卡消费记录
-(void)getICCOwnerRecord:(GVResultBlock)resultBlock; //获取IC卡持卡人信息
-(void)initializeForLoad:(NSString *)cardId creditAmount:(int)amount terminalNo:(NSString *)number pinCode:(NSString *)pinCode procType:(NSString *)procType keyIndex:(NSString *)keyIndex callback:(GVResultBlock)resultBlock; //圈存初始化
-(void)creditForLoad:(NSString *)dataTimeAndMAC2 callback:(GVResultBlock)resultBlock; //圈存

@end
