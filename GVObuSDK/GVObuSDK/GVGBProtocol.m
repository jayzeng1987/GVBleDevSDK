//
//  GVGBProtocol.m
//  GVObuSDK
//
//  Created by JayZ on 16/11/24.
//  Copyright © 2016年 genvict. All rights reserved.
//

#import "GVGBProtocol.h"
#import "GVGBTransmitStrategy.h"
#import "GVGBIndicationStrategy.h"
#import "GVGBNotificationStrategy.h"

@interface GVGBProtocol()

@property (nonatomic, assign) GVBleCommType bleCommType;
@property (nonatomic, strong) GVGBTransmitStrategy * transmitStrategy;
@property (nonatomic, assign) int maxFrameLength;

@end

@implementation GVGBProtocol

-(instancetype)init{
    self = [super init];
    if (self) {
        self.transmitStrategy = [GVGBIndicationStrategy shareInstance]; //默认初始化为Indication传输策略
        self.maxFrameLength = 100; //5字节帧头帧尾 + 95字节data
        [self.transmitStrategy setMaxFrameLength:self.maxFrameLength];
    }
    
    return self;
}

-(void)switchBleCommType:(GVBleCommType)type callback:(GVResultBlock)resultBlock{
    switch (type) {
        case GVBleCommIndicate:{
            self.transmitStrategy = [GVGBIndicationStrategy shareInstance];
            self.maxFrameLength = 100; //5字节帧头帧尾 + 95字节data
            [self.transmitStrategy setMaxFrameLength:self.maxFrameLength];
            [self.transmitStrategy setBleCommType:type];
            
            break;
        }
        case GVBleCommNotify:{
            self.transmitStrategy = [GVGBNotificationStrategy shareInstance];
            self.maxFrameLength = 20; //5字节帧头帧尾 + 15字节data
            [self.transmitStrategy setMaxFrameLength:self.maxFrameLength];
            [self.transmitStrategy setBleCommType:type];
            
            break;
        }
        default:{
            if (resultBlock != nil) {
                GVObuResult * result = [[GVObuResult alloc]init];
                result.status = GVRCParamsError;
                result.data = nil;
                result.desc = @"接口参数错误";
                
                resultBlock(result);
            }
            
            break;
        }
    }
}

-(void)transmit:(NSData *)data callback:(GVResultBlock)resultBlock{
    if (self.transmitStrategy != nil) {
        [self.transmitStrategy transmit:data callback:resultBlock];
    }else if(resultBlock != nil){
        GVObuResult * result = [[GVObuResult alloc]init];
        result.status = GVRCObjectIsNull;
        result.data = nil;
        result.desc = @"对象为空";
        
        resultBlock(result);
    }
}

@end
