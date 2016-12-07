//
//  GVProtocols.m
//  GVObuSDK
//
//  Created by JayZ on 16/11/24.
//  Copyright © 2016年 genvict. All rights reserved.
//

#import "GVAbstractProtocols.h"
#import "GVGBProtocol.h"

@implementation GVAbstractProtocols

-(instancetype)init{
    if ([self isMemberOfClass:[GVAbstractProtocols class]]) {
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

-(void)testAPI{
    [self doesNotRecognizeSelector:_cmd];
}

-(void)switchBleCommType:(GVBleCommType)type callback:(GVResultBlock)resultBlock{
    [self doesNotRecognizeSelector:_cmd];
}

-(void)transmit:(NSData *)data callback:(GVResultBlock)resultBlock{
    [self doesNotRecognizeSelector:_cmd];
}

@end










