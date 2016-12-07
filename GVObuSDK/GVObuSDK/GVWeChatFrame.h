//
//  GVWeChatFrame.h
//  GVObuSDK
//
//  Created by JayZ on 16/12/6.
//  Copyright © 2016年 genvict. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GVObuResult.h"

@interface GVWeChatFrame : NSObject

@property (nonatomic, assign) Byte bMagicNumber;
@property (nonatomic, assign) Byte bVer;
@property (nonatomic, assign) UInt16 nLength;
@property (nonatomic, assign) UInt16 nCmdId;
@property (nonatomic, assign) UInt16 nSeq;
@property (nonatomic, strong) NSMutableData * protobufData;

-(void)pack:(NSData *)data callback:(GVResultBlock)resultBlock;
-(void)unpack:(NSData *)data callback:(GVResultBlock)resultBlock;

@end
