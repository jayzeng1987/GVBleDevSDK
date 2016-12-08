//
//  GVDefine.h
//  GVObuSDK
//
//  Created by JayZ on 16/8/15.
//  Copyright © 2016年 genvict. All rights reserved.
//

#ifndef GVDefine_h
#define GVDefine_h

#pragma mark - 常用宏定义

#ifdef DEBUG
#define GVLog(...) NSLog(__VA_ARGS__)
#else
#define GVLog(...)
#endif

#pragma mark - 枚举定义
//蓝牙设备状态
typedef NS_ENUM(NSUInteger, GVBleState) {
    GVBleStateUnknown = 0,
    GVBleStateResetting,
    GVBleStateUnsupported,
    GVBleStateUnauthorized,
    GVBleStatePoweredOff,
    GVBleStatePoweredOn,
    GVBleStateScanSuccess,
    GVBleStateScanFailed,
    GVBleStateScanTimeout,
    GVBleStateConnectSuccess,
    GVBleStateConnectFailed,
    GVBleStateConnectTimeout,
    GVBleStateWriteDataSuccess,
    GVBleStateWriteDataFailed,
    GVBleStateReadDataSuccess,
    GVBleStateReadDataFailed,
    GVBleStateFindServiceSuccess,
    GVBleStateFindServiceFailed,
    GVBleStateFindCharacteristicSuccess,
    GVBleStateFindCharacteristicFailed

};

//协议类型
typedef NS_ENUM(NSUInteger, GVProtocolType) {
    PROTOCOL_GB = 0,           //国标协议
    
};

//蓝牙通讯方式
typedef NS_ENUM(NSUInteger, GVBleCommType) {
    GVBleCommIndicate = 0,  //采用Indicate方式
    GVBleCommNotify,        //采用Notify方式
};

//通讯帧类型
typedef NS_ENUM(NSUInteger, GVGBFrameType) {
    GVGBDataFrame = 0,  //国标数据帧
    GVGBCtrlFrame,      //国标控制帧
};

//搜索类型
typedef NS_ENUM(NSInteger, GVBleScanType) {
    GVBleScanWithDefault = 0,       //默认搜索类型，搜索到设备后根据设备名称、UUID或名称过滤列表进行设备连接
    GVBleScanWithSearchOnly,        //只是搜索,不连接设备
    GVBleScanWithSearchDelegate,    //搜索设备，触发面向用户的delegate
};

//接口返回的操作结果代码
typedef NS_ENUM(NSInteger, GVResultCode) {
    GVRCSuccess = 0,            //操作成功
    GVRCBLEDisable,             //蓝牙未打开
    GVRCDevNotConnected,        //设备未连接
    GVRCScanFailed,             //搜索失败
    GVRCScanTimeout,            //搜索超时
    GVRCObjectIsNull,           //对象为空
    GVRCCreateObjectFailed,     //对象创建失败
    GVRCParamsError,            //接口参数错误
    
    
};

#pragma mark - 通用类定义
@interface GVObuResult : NSObject

@property (nonatomic, assign) GVResultCode status;   //结果代码，0成功
@property (nonatomic, assign) NSObject * data;       //执行某些操作时成功则返回相应的字典结构数据或是实体类
@property (nonatomic, copy) NSString * desc;       //结果描述

@end

typedef void(^GVResultBlock)(GVObuResult *obuResult);

#endif /* GVDefine_h */
