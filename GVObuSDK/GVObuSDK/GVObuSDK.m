//
//  GVObuSDK.m
//  GVObuSDK
//
//  Created by JayZ on 16/8/9.
//  Copyright © 2016年 genvict. All rights reserved.
//

#import "GVObuSDK.h"
#import "GVObuSDKDelegate.h"
#import "GVBleDevAPI.h"

static NSString * s_sdkVersion = @"V1.0.0";

@interface GVObuSDK()

@property (nonatomic, strong) GVBleDevAPI * gvBleAPI;
@property (nonatomic, weak) id<GVObuSDKDelegate> gvObuSDKDelegate;

@end

@implementation GVObuSDK

//获取SDK单例实例
static GVObuSDK * s_instance = nil;
+(instancetype)sharedObuSDK{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        s_instance = [[[self class] alloc] init];
        //所有的属性必须放在这里初始化
        s_instance.gvBleAPI = [[GVBleDevAPI alloc]init];
        
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

//获取SDK版本信息
-(NSString *)getSDKVersion{
    return s_sdkVersion;
}

//设置代理
-(void)setObuSDKDelegate:(id)object{
    self.gvObuSDKDelegate = object;
    
    if (self.gvBleAPI != nil) {
        [self.gvBleAPI setObuSDKDelegate:object];
    }
}

//设置协议类型
-(void)setProtocolType:(GVProtocolType)type callback:(GVResultBlock)resultBlock{
    if (self.gvBleAPI != nil) {
        [self.gvBleAPI setProtocolType:type callback:resultBlock];
    }else if(resultBlock != nil) {
        GVObuResult * result = [[GVObuResult alloc]init];
        result.status = GVRCObjectIsNull;
        result.data = nil;
        result.desc = @"对象为空";
        
        resultBlock(result);
    }else{
        GVLog(@"GVBleAPI对象为空");
    }
}

//判断蓝牙是否打开
-(void)isEnabledBluetooth:(GVResultBlock)resultBlock{
    if (self.gvBleAPI != nil) {
        [self.gvBleAPI isEnabledBluetooth:resultBlock];
        
    }else if(resultBlock != nil){
        GVObuResult * result = [[GVObuResult alloc] init];
        
        result.status = GVRCObjectIsNull;
        result.data = nil;
        result.desc = @"对象为空";
        
        resultBlock(result);
    }
}

//检查设备连接状态
-(void)checkConnection:(GVResultBlock)resultBlock{
    if (self.gvBleAPI != nil) {
        [self.gvBleAPI checkConnection:resultBlock];
        
    }else if(resultBlock != nil){
        GVObuResult * result = [[GVObuResult alloc] init];
        
        result.status = GVRCObjectIsNull;
        result.data = nil;
        result.desc = @"对象为空";
        
        resultBlock(result);
    }
}

//绑定设备
-(void)bindDev:(NSString *)uuid callback:(GVResultBlock)resultBlock{
    
}

//设备解绑
-(void)unbindDev:(GVResultBlock)resultBlock{
    
}

//扫描设备
-(void)startScanDevice:(int)timeout callback:(GVResultBlock)resultBlock{
    if (self.gvBleAPI != nil) {
        [self.gvBleAPI startScanDevice:timeout callback:resultBlock];
    }else if(resultBlock != nil){
        GVObuResult * result = [[GVObuResult alloc]init];
        result.status = GVRCObjectIsNull;
        result.data = nil;
        result.desc = @"对象为空";
        
        resultBlock(result);
    }
}

//停止扫描设备
-(void)stopScanDevice{
    if (self.gvBleAPI != nil) {
        [self.gvBleAPI stopScanDevice];
    }
}

//按照金溢默认规则连接设备
-(void)connectDevice:(int)timeout callback:(GVResultBlock)resultBlock{
    
}

//根据设备蓝牙UUID连接
-(void)connectDeviceWithUUID:(NSString *)serviceUUID timeout:(int)timeout callback:(GVResultBlock)resultBlock{
    
}

//根据设备名称连接
-(void)connectDeviceWithName:(NSString *)devName timeout:(int)timeout callback:(GVResultBlock)resultBlock{
    
}

//断开设备连接，断电
-(void)disconnectDevice:(GVResultBlock)resultBlock{
    
}

//切换蓝牙通讯类型，Indication or Notification
-(void)switchCommType:(GVBleCommType)type callback:(GVResultBlock)resultBlock{
    
}

//初始化设备接口
-(void)initDevice:(NSData*) data callback:(GVResultBlock)resultBlock{
    
}

//设备通道接口
-(void)devChannel:(NSData*) data callback:(GVResultBlock)resultBlock{
    
}

//cos通道接口
-(void)cosChannel:(NSData*) data callback:(GVResultBlock)resultBlock{
    
}

//获取设备记录接口（设备日志）
-(void)getDevRecords:(NSData*) data callback:(GVResultBlock)resultBlock{
    
}

//认证通道接口
-(void)authChannel:(NSData*) data callback:(GVResultBlock)resultBlock{
    
}

//透传通道接口
-(void)transChannel:(NSData*) data callback:(GVResultBlock)resultBlock{
    
}

//厂商通道接口
-(void)manufacturerChannel:(NSData*) data callback:(GVResultBlock)resultBlock{
    
}

//获取设备表面号
-(void)getDevSN:(GVResultBlock)resultBlock{
    
}

//获取设备版本号
-(void)getDevVersion:(GVResultBlock)resultBlock{
    
}

//获取设备电池电量
-(void)getDevBattery:(GVResultBlock)resultBlock{
    
}

//设备复位
-(void)resetDev:(GVResultBlock)resultBlock{
    
}

//获取设备蓝牙MAC
-(void)getDevMac:(GVResultBlock)resultBlock{
    
}

//获取设备信息，ASCII，最长100字节
-(void)getDevInfo:(GVResultBlock)resultBlock{
    
}

//获取IC卡信息（0015文件）
-(void)getICCInfo:(GVResultBlock)resultBlock{
    
}

//获取IC卡交易记录
-(void)getICCTransactionRecords:(NSString *)pinCode maxNumber:(int)maxNumber callback:(GVResultBlock)resultBlock{
    
}

//获取IC卡消费记录
-(void)getICCConsumeRecords:(int)maxNumber callback:(GVResultBlock)resultBlock{
    
}

//获取IC卡持卡人信息
-(void)getICCOwnerRecord:(GVResultBlock)resultBlock{
    
}

//圈存初始化
-(void)initializeForLoad:(NSString *)cardId creditAmount:(int)amount terminalNo:(NSString *)number pinCode:(NSString *)pinCode procType:(NSString *)procType keyIndex:(NSString *)keyIndex callback:(GVResultBlock)resultBlock{
    
}

//圈存
-(void)creditForLoad:(NSString *)dataTimeAndMAC2 callback:(GVResultBlock)resultBlock{
    
}


@end
