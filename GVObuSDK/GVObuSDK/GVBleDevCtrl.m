//
//  GVBleDevCtrl.m
//  GVObuSDK
//
//  Created by JayZ on 16/12/6.
//  Copyright © 2016年 genvict. All rights reserved.
//

#import "GVBleDevCtrl.h"
#import "GVBleCentralManage.h"

@interface GVBleDevCtrl()

@property (nonatomic, strong) GVBleCentralManage * gvBleCentralManage;
@property (nonatomic, weak) id<GVObuSDKDelegate> gvObuSDKDelegate;

@end

@implementation GVBleDevCtrl

-(id)init{
    if(self = [super init]){
        self.gvBleCentralManage = [GVBleCentralManage shareInstance];
    }
    
    return self;
}

//设置代理
-(void)setObuSDKDelegate:(id)object{
    self.gvObuSDKDelegate = object;
    
    if (self.gvBleCentralManage != nil) {
        [self.gvBleCentralManage setObuSDKDelegate:object];
    }
}

//判断蓝牙是否打开
-(void)isEnabledBluetooth:(GVResultBlock)resultBlock{
    if (resultBlock != nil) {
        
        GVObuResult * result = [[GVObuResult alloc]init];
        
        if (self.gvBleCentralManage != nil) {
            if(self.gvBleCentralManage.blePowerOn){
                result.status = GVRCSuccess;
                result.data = nil;
                result.desc = @"蓝牙已打开";
            }else{
                result.status = GVRCBLEDisable;
                result.data = nil;
                result.desc = @"蓝牙未打开";
            }
        }else{
            
            result.status = GVRCObjectIsNull;
            result.data = nil;
            result.desc = @"对象为空";
        }
        
        resultBlock(result);
    }
}

//检查设备连接状态
-(void)checkConnection:(GVResultBlock)resultBlock{
    if (resultBlock != nil) {
        
        GVObuResult * result = [[GVObuResult alloc]init];
        
        if (self.gvBleCentralManage != nil) {
            if([self.gvBleCentralManage checkConnection]){
                result.status = GVRCSuccess;
                result.data = nil;
                result.desc = @"设备已连接";
            }else{
                result.status = GVRCDevNotConnected;
                result.data = nil;
                result.desc = @"设备未连接";
            }
        }else{
            
            result.status = GVRCObjectIsNull;
            result.data = nil;
            result.desc = @"对象为空";
        }
        
        resultBlock(result);
    }
}

//绑定设备
-(void)bindDev:(NSString *)uuid callback:(GVResultBlock)resultBlock{

}

//设备解绑
-(void)unbindDev:(GVResultBlock)resultBlock{

}

//扫描设备，timeout <= 0, 则需调用stopScanDevice接口
-(void)startScanDevice:(int)timeout callback:(GVResultBlock)resultBlock{
    
}

//停止扫描设备
-(void)stopScanDevice{
    
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


@end
