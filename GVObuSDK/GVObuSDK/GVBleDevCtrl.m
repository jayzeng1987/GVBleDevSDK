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
    if (self.gvBleCentralManage != nil) {
        [self.gvBleCentralManage setObuSDKDelegate:object];
    }
}

//判断蓝牙是否打开
-(Boolean)isEnabledBluetooth{
    return YES;
}

//检查设备连接状态
-(Boolean)checkConnection{
    return YES;
}

//绑定设备
-(Boolean)bindDev:(NSString *)uuid{
    return YES;
}

//设备解绑
-(Boolean)unbindDev{
    return YES;
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
