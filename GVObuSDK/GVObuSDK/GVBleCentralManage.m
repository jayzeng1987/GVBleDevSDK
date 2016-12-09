//
//  BleCentralManage.m
//  GVObuSDK
//
//  Created by JayZ on 16/8/9.
//  Copyright © 2016年 genvict. All rights reserved.
//

#import "GVBleCentralManage.h"

@interface GVBleCentralManage () {
    NSMutableArray * _filterList;
    GVProtocolType _protocolType;
}

@property (nonatomic, weak) id<GVObuSDKDelegate> gvObuSDKDelegate;
@property (nonatomic, strong) CBCentralManager *manager;
@property (nonatomic, strong) CBPeripheral *foundPeripheral;
@property (nonatomic, strong) CBPeripheral *activedPeripheral;
@property (nonatomic, strong) GVResultBlock resultBlock;
@property (nonatomic, assign) Boolean blePowerOn; //蓝牙是否开启
@property (nonatomic, strong) NSTimer * scanTimer; //扫描设备计时器

@end

@implementation GVBleCentralManage

#pragma mark - 实现CBCentralManagerDelegate代理
-(void)centralManagerDidUpdateState:(CBCentralManager *)central{
    GVLog(@"centralManagerDidUpdateState");
    
//    if (self.bleStateBlock != nil) {
//        self.bleStateBlock(central.state, nil, (NSObject*)central);
//    }
    switch (central.state) {
        case CBManagerStateUnknown:
            GVLog(@"centralManagerDidUpdateState: CBManagerStateUnknown");
            break;
        case CBManagerStateResetting:
            GVLog(@"centralManagerDidUpdateState: CBManagerStateResetting");
            break;
        case CBManagerStateUnsupported:
            GVLog(@"centralManagerDidUpdateState: CBManagerStateUnsupported");
            break;
        case CBManagerStateUnauthorized:
            GVLog(@"centralManagerDidUpdateState: CBManagerStateUnauthorized");
            break;
        case CBManagerStatePoweredOff:
            GVLog(@"centralManagerDidUpdateState: CBManagerStatePoweredOff");
            self.blePowerOn = NO;
            break;
        case CBManagerStatePoweredOn:
            GVLog(@"centralManagerDidUpdateState: CBManagerStatePoweredOn");
            self.blePowerOn = YES;
            break;
            
        default:
            break;
    }
    
    if(self.gvObuSDKDelegate && [self.gvObuSDKDelegate respondsToSelector:@selector(didUpdateBleState:)]){
        [self.gvObuSDKDelegate didUpdateBleState:(GVBleState)central.state];
    }
}

-(void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary<NSString *,id> *)advertisementData RSSI:(NSNumber *)RSSI{
    GVLog(@"didDiscoverPeripheral");
    
}

-(void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral{
    GVLog(@"didConnectPeripheral");
}

-(void)centralManager:(CBCentralManager *)central didFailToConnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error{
    GVLog(@"didFailToConnectPeripheral");
}

-(void)centralManager:(CBCentralManager *)central didDisconnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error{
    GVLog(@"didDisconnectPeripheral");
}

#pragma mark - 实现CBPeripheralDelegate代理
-(void)peripheral:(CBPeripheral *)peripheral didDiscoverServices:(NSError *)error{
    GVLog(@"didDiscoverServices");
}

-(void)peripheral:(CBPeripheral *)peripheral didDiscoverCharacteristicsForService:(CBService *)service error:(NSError *)error{
    GVLog(@"didDiscoverCharacteristicsForService");
}

-(void)peripheral:(CBPeripheral *)peripheral didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error{
    GVLog(@"didUpdateValueForCharacteristic");
}

-(void)peripheral:(CBPeripheral *)peripheral didUpdateNotificationStateForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error{
    GVLog(@"didUpdateNotificationStateForCharacteristic");
}

-(void)peripheral:(CBPeripheral *)peripheral didWriteValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error{
    GVLog(@"didWriteValueForCharacteristic");
}

#pragma mark - GVBleCentralManage对外接口
#pragma mark 单例模式，获取实例对象
static GVBleCentralManage * instance = nil;
+(instancetype)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[[self class] alloc] init];
        //所有的属性必须放在这里初始化
        instance.manager = [[CBCentralManager alloc] initWithDelegate:instance queue:nil];
        instance.blePowerOn = NO;
        
    });
    
    return instance;
}

+(instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [super allocWithZone:zone];
    });
    
    return instance;
}

#pragma mark 设置代理
-(void)setObuSDKDelegate:(id)object{
    GVLog(@"GVBleCentralManage: setObuSDKDelegate");
    self.gvObuSDKDelegate = object;
    
    if(self.gvObuSDKDelegate && [self.gvObuSDKDelegate respondsToSelector:@selector(test)]){
        [self.gvObuSDKDelegate test];
    }
}

#pragma mark 扫描设备
-(void)startScanDevice:(NSArray *)serviceUUIDs timeout:(NSTimeInterval)timeout{
    
    if (timeout > 0) {
        self.scanTimer = [NSTimer scheduledTimerWithTimeInterval:(NSTimeInterval)timeout target:self selector:@selector(scanTimeout:) userInfo:nil repeats:NO];
    }
    
    [self.manager scanForPeripheralsWithServices:serviceUUIDs options:@{CBCentralManagerScanOptionAllowDuplicatesKey: @YES}];
}

-(void)scanTimeout:(NSTimer *)timer{
    if (self.manager != nil) {
        [self.scanTimer invalidate];
        [self.manager stopScan];
    }
    
}

#pragma mark 停止扫描
-(void)stopScanPeripheral{
    
}

#pragma mark 连接设备
-(void)connectPeripheral:(CBPeripheral*)peripheral{
    
}

#pragma mark 断开当前连接
-(void)disconnectCurrentPeripheral{
    
}

#pragma mark 断开指定设备
-(void)disconnectPeripheral:(CBPeripheral*)peripheral{
    
}

#pragma mark 写数据
-(void)writeData:(NSData *)data{
    
}

#pragma mark 检查设备连接状态
-(Boolean)checkConnection{
    if(self.activedPeripheral != nil && [self.activedPeripheral state] == CBPeripheralStateConnected){
        return YES;
    }
    
    return NO;
}













@end
