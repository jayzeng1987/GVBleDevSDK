//
//  GVProtocolsFactory.m
//  GVObuSDK
//
//  Created by JayZ on 16/12/7.
//  Copyright © 2016年 genvict. All rights reserved.
//

#import "GVProtocolsFactory.h"
#import "GVGBProtocol.h"

#pragma mark - 简单工厂模式，创建协议
@implementation GVProtocolsFactory

#pragma mark 单例模式，获取实例对象
static GVProtocolsFactory * s_protocolsFactoryInstance = nil;
+(instancetype)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        s_protocolsFactoryInstance = [[[self class] alloc] init];
        //所有的属性必须放在这里初始化
        
        
    });
    
    return s_protocolsFactoryInstance;
}

+(instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        s_protocolsFactoryInstance = [super allocWithZone:zone];
    });
    
    return s_protocolsFactoryInstance;
}

#pragma mark 根据协议类型创建对象
-(GVAbstractProtocols *)create:(GVProtocolType)protocolType callback:(GVResultBlock)resultBlock{
    GVAbstractProtocols * concreteProtocol = nil;
    
    switch (protocolType) {
            
        case PROTOCOL_GB:{ //国标协议
            concreteProtocol = [[GVGBProtocol alloc] init];
            GVLog(@"Create GB protocol.");
            
            break;
        }
        default:
            
            break;
    }
    
    if (resultBlock != nil) {
        GVObuResult * result = [[GVObuResult alloc]init];
        
        if (concreteProtocol != nil) {
            result.status = GVRCSuccess;
            result.data = nil;
            result.desc = @"对象创建成功";

        } else {
            result.status = GVRCCreateObjectFailed;
            result.data = nil;
            result.desc = @"对象创建失败";
        }
        
        resultBlock(result);
    }
    
    return concreteProtocol;
}

@end
