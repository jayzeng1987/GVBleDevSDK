//
//  GVGBIndicationStrategy.m
//  GVObuSDK
//
//  Created by JayZ on 16/12/6.
//  Copyright © 2016年 genvict. All rights reserved.
//

#import "GVGBIndicationStrategy.h"
#import "GVBleCentralManage.h"

@interface GVGBIndicationStrategy()

@property (nonatomic, strong) GVResultBlock resultBlock;
@property (nonatomic, strong) GVBleCentralManage * bleCentralManage;
@property (nonatomic, assign) int maxFrameLength; //最大帧长度
@property (nonatomic, assign) int blePackageLength; //发送包长度
@property (nonatomic, assign) Boolean useWeChat; //是否使用微信ProtocolBuf协议
@property (nonatomic, assign) Boolean hasRspACK; //发送数据后是否收到应答
@property (nonatomic, assign) int rspACKTimeout; //数据发送后等待接收端应答ACK响应超时时间
@property (nonatomic, assign) int waitDataTimeout; //等待响应数据超时时间
@property (nonatomic, strong) NSTimer * transmitTimer; //根据waitDataTimeout启动计时器
@property (nonatomic, strong) NSMutableArray * sendDataBuf; //存储发送的数据帧 (GVGBFrame对象)
@property (nonatomic, strong) NSMutableArray * recvDataBuf; //存储接收的数据帧 (GVGBFrame对象)

@end

@implementation GVGBIndicationStrategy

static GVGBIndicationStrategy * s_instance = nil;
+(instancetype)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        s_instance = [[[self class] alloc] init];
        //所有的属性必须放在这里初始化
        s_instance.bleCentralManage = [GVBleCentralManage shareInstance];
        s_instance.maxFrameLength = 100; //默认100字节，5字节帧头帧尾 + 95字节data
        s_instance.blePackageLength = 20; //蓝牙分包发送长度
        
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

-(void)transmit:(NSData *)data callback:(GVResultBlock)resultBlock{
    
}

-(void)setMaxFrameLength:(int)length{
    
}

-(void)setBleCommType:(GVBleCommType)type{
    if (self.bleCentralManage != nil) {
        [self.bleCentralManage setCommType:type];
    }
}

-(void)splitPackage:(NSData *)data callback:(GVResultBlock) resultBlock{
    
}

-(void)processRecvData:(NSData*)data callback:(GVResultBlock) resultBlock{
    
}

-(void)doSendData:(NSData *)data callback:(GVResultBlock)resultBlock{
    
}

@end
