//
//  VCPU.m
//  VirtualSystem
//
//  Created by oubaiquan on 2018/1/11.
//  Copyright © 2018年 Youngsoft. All rights reserved.
//

#import "VCPU.h"
#include <setjmp.h>

@interface VCPU()

@property(nonatomic,weak) VMemory *memory;

@end


@implementation VCPU
{
    int _regvals[Reg3 + 1];
}



-(void)moveFromConst:(int)val toReg:(RegNum)reg
{
    _regvals[reg] = val;
}

-(void)moveFromReg:(RegNum)reg1 toReg:(RegNum)reg2
{
  
    _regvals[reg2] = _regvals[reg1];
    
}

-(void)moveFromReg:(RegNum)reg toAddr:(Addr)addr
{
    self.memory[addr] = [NSData dataWithBytes:&_regvals[reg] length:sizeof(int)];
}

-(void)moveFromAddr:(Addr)addr toReg:(RegNum)reg
{
    _regvals[reg] =  *(int*)self.memory[addr].bytes;
}

//加减法操作
-(void)addFromReg:(RegNum)reg1 toReg:(RegNum)reg2
{
   _regvals[reg2] = _regvals[reg1] + _regvals[reg2];
}

-(void)subFromReg:(RegNum)reg1 toReg:(RegNum)reg2
{
    _regvals[reg2] = _regvals[reg1] - _regvals[reg2];
}

//如果两个寄存器内容相等则执行
-(void)isEqualReg:(RegNum)reg1 withReg:(RegNum)reg2 thenGoto:(Instruct)instruct
{
    if (_regvals[reg1] == _regvals[reg2])
    {
        [self jumpTo:instruct];
    }
}


-(void)jumpTo:(Instruct)instruct
{
    jmp_buf jmpbuf;
    memcpy(jmpbuf, self.memory[instruct].bytes, sizeof(jmp_buf));
    longjmp(jmpbuf, 1);
}

-(void)ret
{
    [self.memory clear];
}



-(void)sys:(Interrupt)interrupt
{
    switch (interrupt) {
        case Int3:
            NSLog(@"output:%d", _regvals[Reg0]);
            break;
        default:
            break;
    }
}


@end
