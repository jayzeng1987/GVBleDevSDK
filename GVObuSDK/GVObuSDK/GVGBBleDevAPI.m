//
//  GVGBBleDevAPI.m
//  GVObuSDK
//
//  Created by JayZ on 16/12/6.
//  Copyright © 2016年 genvict. All rights reserved.
//

#import "GVGBBleDevAPI.h"
#import "GVAbstractProtocols.h"
#import "GVProtocolsFactory.h"
#import "GVBleDevCtrl.h"
#import "GVObuSDKDelegate.h"

@interface GVGBBleDevAPI()

@property (nonatomic, strong) GVAbstractProtocols * protocols;
@property (nonatomic, strong) GVBleDevCtrl * gvBleDevCtrl;
@property (nonatomic, weak) id<GVObuSDKDelegate> gvObuSDKDelegate;

@end

@implementation GVGBBleDevAPI

-(instancetype)init{
    if(self = [super init]){
        self.protocols = [[GVProtocolsFactory shareInstance] create:PROTOCOL_GB callback:nil];
        self.gvBleDevCtrl = [[GVBleDevCtrl alloc]init];
    }
    
    return self;
}

//设置代理
-(void)setObuSDKDelegate:(id)object{
    self.gvObuSDKDelegate = object;
    if (self.gvBleDevCtrl != nil) {
        [self.gvBleDevCtrl setObuSDKDelegate:object];
    }
}

//设置协议类型
-(void)setProtocolType:(GVProtocolType)type callback:(GVResultBlock)resultBlock{
    self.protocols = [[GVProtocolsFactory shareInstance]create:type callback:resultBlock];
}

//判断蓝牙是否打开
-(Boolean)isEnabledBluetooth{
    if (self.gvBleDevCtrl != nil) {
        return [self.gvBleDevCtrl isEnabledBluetooth];
    }
    
    return NO;
}

//检查设备连接状态
-(Boolean)checkConnection{
    if (self.gvBleDevCtrl != nil) {
        return [self.gvBleDevCtrl checkConnection];
    }
    
    return NO;
}

//绑定设备
-(Boolean)bindDev:(NSString *)uuid{
    
    //binding devices here
    
    return YES;
}

//设备解绑
-(Boolean)unbindDev{
    
    //unbinding devices here
    
    return YES;
}

//扫描设备，timeout <= 0, 则需调用stopScanDevice接口
-(void)startScanDevice:(int)timeout callback:(GVResultBlock)resultBlock{
    if (self.gvBleDevCtrl != nil) {
        [self.gvBleDevCtrl startScanDevice:timeout callback:resultBlock];
    }else if(resultBlock != nil){
        GVObuResult * result = [[GVObuResult alloc]init];
        result.status = GVObjectIsNull;
        result.data = nil;
        result.desc = @"对象为空";
        
        resultBlock(result);
    }
}

//停止扫描设备
-(void)stopScanDevice{
    if (self.gvBleDevCtrl != nil) {
        [self.gvBleDevCtrl stopScanDevice];
    }
}

//按照金溢默认规则连接设备
-(void)connectDevice:(int)timeout callback: (GVResultBlock)resultBlock{
    if (self.gvBleDevCtrl != nil) {
        [self.gvBleDevCtrl connectDevice:timeout callback:resultBlock];
    }else{
        GVObuResult * result = [[GVObuResult alloc]init];
        result.status = GVObjectIsNull;
        result.data = nil;
        result.desc = @"对象为空";
        
        resultBlock(result);
    }
}

//根据设备蓝牙UUID连接
-(void)connectDeviceWithUUID:(NSString *)serviceUUID timeout:(int)timeout callback:(GVResultBlock)resultBlock{
    if (self.gvBleDevCtrl != nil) {
        [self.gvBleDevCtrl connectDeviceWithUUID:serviceUUID timeout:timeout callback:resultBlock];
    }else{
        GVObuResult * result = [[GVObuResult alloc]init];
        result.status = GVObjectIsNull;
        result.data = nil;
        result.desc = @"对象为空";
        
        resultBlock(result);
    }
}

//根据设备名称连接
-(void)connectDeviceWithName:(NSString *)devName timeout:(int)timeout callback:(GVResultBlock)resultBlock{
    
}

//断开设备连接，断电
-(void)disconnectDevice:(GVResultBlock)resultBlock{
    
}

//切换蓝牙通讯类型，Indication or Notification
-(void)switchCommType:(GVBleCommType)type callback: (GVResultBlock)resultBlock{
    if (self.protocols != nil) {
        [self.protocols switchBleCommType:type callback:resultBlock];
    }else{
        GVObuResult * result = [[GVObuResult alloc]init];
        result.status = GVObjectIsNull;
        result.data = nil;
        result.desc = @"对象为空";
        
        resultBlock(result);
    }
}

//初始化设备接口
-(void)initDevice:(NSData*) data callback:(GVResultBlock)resultBlock{
    
}

//设备通道接口
-(void)devChannel:(NSData*)data callback:(GVResultBlock)resultBlock{
    
}

//cos通道接口
-(void)cosChannel:(NSData*)data callback:(GVResultBlock)resultBlock{
    
}

//获取设备记录接口（设备日志）
-(void)getDevRecords:(NSData*)data callback:(GVResultBlock)resultBlock{
    
}

//认证通道接口
-(void)authChannel:(NSData*)data callback:(GVResultBlock)resultBlock{
    
}

//透传通道接口
-(void)transChannel:(NSData*)data callback:(GVResultBlock)resultBlock{
    
}

//厂商通道接口
-(void)manufacturerChannel: (NSData*)data callback:(GVResultBlock)resultBlock{
    
}

@end
