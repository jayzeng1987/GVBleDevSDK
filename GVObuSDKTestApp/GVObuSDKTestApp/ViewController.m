//
//  ViewController.m
//  GVObuSDKTestApp
//
//  Created by 曾晓江 on 2016/12/7.
//  Copyright © 2016年 GENVICT. All rights reserved.
//

#import "ViewController.h"
#import "GVObuSDK.h"
#import "GVObuSDKDelegate.h"

@interface ViewController () <GVObuSDKDelegate>

@property (nonatomic, strong) GVObuSDK * gvObuSDK;
- (IBAction)onTestBtnClick:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.gvObuSDK = [GVObuSDK sharedObuSDK];
    [self.gvObuSDK setObuSDKDelegate:self];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 实现GVObuSDKDelegate
//for test
-(void)test{
    GVLog(@"Just for testing delegate...");
}

//设备状态更新时触发
-(void)didUpdateBleState:(GVBleState)state{
    GVLog(@"GVObuSDKDelegate: didUpdateBleState, state: %lu", (unsigned long)state);
}

//发现设备时触发
-(void)didDiscoverDev:(GVBleDev *)dev{
    GVLog(@"GVObuSDKDelegate: didDiscoverDev");
}

//设备断开时触发
-(void)didDisConnectDev{
    GVLog(@"GVObuSDKDelegate: didDisConnectDev");
}


#pragma mark 按钮点击事件
GVResultBlock resultblock = ^(GVObuResult * result){
    GVLog(@"%@", result.desc);
};

- (IBAction)onTestBtnClick:(id)sender {

    //getSDKVersion接口测试
    GVLog(@"SDK Version: %@", [self.gvObuSDK getSDKVersion]);

    //isEnabledBluetooth接口测试
    [self.gvObuSDK isEnabledBluetooth:resultblock];

    //setProtocolType接口测试
    [self.gvObuSDK setProtocolType:PROTOCOL_GB callback:resultblock];
    
    //checkConnection接口测试
    [self.gvObuSDK checkConnection:resultblock];
}

@end
