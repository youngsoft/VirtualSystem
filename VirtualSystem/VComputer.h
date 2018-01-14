//
//  VComputer.h
//  VirtualSystem
//
//  Created by oubaiquan on 2018/1/11.
//  Copyright © 2018年 Youngsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VCPU.h"
#import "VMemory.h"
#import "VOS.h"

/**
 虚拟的计算机类。
 */
@interface VComputer : NSObject

@property(nonatomic, readonly) VCPU *cpu;     //计算机中的CPU
@property(nonatomic, readonly) VMemory *memory; //计算机中的内存
@property(nonatomic, readonly)  VOS *os;    //计算机中的操作系统。

//安装操作系统。
-(void)installOS:(VOS*)os;
//卸载操作系统。
-(void)uninstallOS;

//开机并加载操系统。
-(void)boot;

//关机。
-(void)shutdown;

@end
