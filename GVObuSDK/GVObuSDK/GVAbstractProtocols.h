//
//  GVProtocols.h
//  GVObuSDK
//
//  Created by JayZ on 16/11/24.
//  Copyright © 2016年 genvict. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GVDefine.h"


@interface GVAbstractProtocols : NSObject

-(void)testAPI; //For test, nonuse!!!
-(void)switchBleCommType:(GVBleCommType)type callback:(GVResultBlock)resultBlock; //切换蓝牙通讯类型，Indication or Notification
-(void)transmit:(NSData *)data callback:(GVResultBlock)resultBlock; //数据传输


@end
