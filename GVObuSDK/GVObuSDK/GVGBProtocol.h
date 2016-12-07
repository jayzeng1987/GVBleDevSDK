//
//  GVGBProtocol.h
//  GVObuSDK
//
//  Created by JayZ on 16/11/24.
//  Copyright © 2016年 genvict. All rights reserved.
//

#import "GVAbstractProtocols.h"


@interface GVGBProtocol : GVAbstractProtocols

-(void)switchBleCommType:(GVBleCommType)type callback:(GVResultBlock)resultBlock;
-(void)transmit:(NSData *)data callback:(GVResultBlock)resultBlock;

@end
