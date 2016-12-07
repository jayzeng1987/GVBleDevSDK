//
//  GVGBTransmitStrategy.m
//  GVObuSDK
//
//  Created by JayZ on 16/12/6.
//  Copyright © 2016年 genvict. All rights reserved.
//

#import "GVGBTransmitStrategy.h"

@implementation GVGBTransmitStrategy

-(instancetype)init{
    if ([self isMemberOfClass:[GVGBTransmitStrategy class]]) {
        [self doesNotRecognizeSelector:_cmd];
        
        return nil;
    } else{
        self = [super init];
        if (self) {
            return self;
        }
    }
    
    return nil;
}

-(void)transmit:(NSData *)data callback:(GVResultBlock)resultBlock{
    [self doesNotRecognizeSelector:_cmd];
}

-(void)setMaxFrameLength:(int)length{
    [self doesNotRecognizeSelector:_cmd];
}

-(void)setBleCommType:(GVBleCommType)type{
    [self doesNotRecognizeSelector:_cmd];
}


@end
