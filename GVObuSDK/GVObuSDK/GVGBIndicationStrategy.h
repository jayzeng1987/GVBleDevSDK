//
//  GVGBIndicationStrategy.h
//  GVObuSDK
//
//  Created by JayZ on 16/12/6.
//  Copyright © 2016年 genvict. All rights reserved.
//

#import "GVGBTransmitStrategy.h"
#import "GVObuResult.h"

@interface GVGBIndicationStrategy : GVGBTransmitStrategy

+(instancetype)shareInstance;
-(void)transmit:(NSData *)data callback:(GVResultBlock)resultBlock;
-(void)setMaxFrameLength:(int)length;
-(void)setBleCommType:(GVBleCommType)type;

@end
