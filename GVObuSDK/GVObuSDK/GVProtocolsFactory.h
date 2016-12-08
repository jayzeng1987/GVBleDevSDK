//
//  GVProtocolsFactory.h
//  GVObuSDK
//
//  Created by JayZ on 16/12/7.
//  Copyright © 2016年 genvict. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GVDefine.h"

#pragma mark - 简单工厂模式，创建协议

@class GVAbstractProtocols;

@interface GVProtocolsFactory : NSObject

#pragma mark 单例模式，获取实例对象
+(instancetype)shareInstance;

#pragma mark 创建具体协议
-(GVAbstractProtocols *)create:(GVProtocolType)protocolType callback:(GVResultBlock)resultBlock;


@end
