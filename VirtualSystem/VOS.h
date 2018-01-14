//
//  VOS.h
//  VirtualSystem
//
//  Created by oubaiquan on 2018/1/11.
//  Copyright © 2018年 Youngsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VProgress.h"
#import "VCPU.h"
#import "VMemory.h"


/**
 虚拟的操作系统类。
 */
@interface VOS : NSObject


//创建一个进程
-(VProgress*)createProcess;

//运行一个进程
-(void)runProcess:(VProgress*)process inCPU:(VCPU*)cpu inMemory:(VMemory*)memory;

//销毁一个进程
-(void)destoryProcess:(VProgress*)process;

//操作系统启动
-(void)load:(VCPU*)cpu memory:(VMemory*)memory;

//操作系统关闭
-(void)unload;

//判断操作系统是否启动。
-(BOOL)isLoad;

@end
