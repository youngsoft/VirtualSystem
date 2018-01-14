//
//  VProgress.h
//  VirtualSystem
//
//  Created by oubaiquan on 2018/1/11.
//  Copyright © 2018年 Youngsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VCPU.h"


/**
 虚拟进程类。虚拟进程用于应用代码。
 */
@interface VProgress : NSObject

//当进程被创建并运行时会执行这个方法中的代码。
-(void)main:(VCPU*)cpu memory:(VMemory*)memory;

@end
