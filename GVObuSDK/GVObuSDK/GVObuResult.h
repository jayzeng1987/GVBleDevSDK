//
//  GVObuResult.h
//  GVObuSDK
//
//  Created by JayZ on 16/12/6.
//  Copyright © 2016年 genvict. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GVDefine.h"

@interface GVObuResult : NSObject

@property (nonatomic, assign) GVResultCode status;   //结果代码，0成功
@property (nonatomic, assign) NSObject * data;       //执行某些操作时成功则返回相应的字典结构数据或是实体类
@property (nonatomic, copy) NSString * desc;       //结果描述

@end

typedef void(^GVResultBlock)(GVObuResult *obuResult);
