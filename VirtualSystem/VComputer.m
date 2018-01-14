//
//  VComputer.m
//  VirtualSystem
//
//  Created by oubaiquan on 2018/1/11.
//  Copyright © 2018年 Youngsoft. All rights reserved.
//

#import "VComputer.h"

@interface VCPU()

@property(nonatomic,weak) VMemory *memory;

@end


@interface VComputer()

@property(nonatomic)  VOS *os;

@end

@implementation VComputer

-(instancetype)init
{
    self = [super init];
    if (self != nil)
    {
        _cpu = [VCPU new];
        _memory = [VMemory new];
        _cpu.memory = _memory;
        _os = nil;
    }
    
    return self;
}


-(void)installOS:(VOS*)os
{
    _os = os;
}

-(void)uninstallOS
{
    _os = nil;
}

//开机并加载操系统。
-(void)boot
{
    if (_os == nil)
    {
        NSLog(@"您尚未安装操作系统！");
    }
    else
    {
        [_os load:self.cpu memory:self.memory];
    }
}

//关机。
-(void)shutdown
{
    if (_os == nil)
    {
        NSLog(@"您尚未安装操作系统！");
    }
    {
        [_os unload];
    }
}

@end
