//
//  VOS.m
//  VirtualSystem
//
//  Created by oubaiquan on 2018/1/11.
//  Copyright © 2018年 Youngsoft. All rights reserved.
//

#import "VOS.h"

@implementation VOS
{
    BOOL _isLoad;
}

-(VProgress*)createProcess
{
    return [VProgress new];
}

-(void)runProcess:(VProgress*)process inCPU:(VCPU*)cpu inMemory:(VMemory*)memory
{
    [memory clear];
    [process main:cpu memory:memory];
}

-(void)destoryProcess:(VProgress*)process
{
    
}

//加载；
-(void)load:(VCPU*)cpu memory:(VMemory*)memory
{
    if (self.isLoad)
        return;
    
    VProgress *progress = [self createProcess];
    [self runProcess:progress inCPU:cpu inMemory:memory];
    [self destoryProcess:progress];
}

-(void)unload
{
    _isLoad = NO;
}

-(BOOL)isLoad
{
    return _isLoad;
}

@end
