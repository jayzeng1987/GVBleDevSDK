//
//  GVGBFrame.h
//  GVObuSDK
//
//  Created by JayZ on 16/12/6.
//  Copyright © 2016年 genvict. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GVObuResult.h"

@interface GVGBFrame : NSObject

@property (nonatomic, copy) NSString * st;
@property (nonatomic, copy) NSString * ctl;
@property (nonatomic, assign) Byte len;
@property (nonatomic, strong) NSData * data;
@property (nonatomic, assign) unsigned char bcc;
@property (nonatomic, assign) GVGBFrameType frameType;
@property (nonatomic, strong) NSMutableData * frameData;

-(void)pack:(NSData *)data withFrameType:(GVGBFrameType)type callback:(GVResultBlock)resultBlock;
-(void)unpack:(NSData *)data callback:(GVResultBlock)resultBlock;
-(Byte)getBCC:(NSData *)data;

@end
