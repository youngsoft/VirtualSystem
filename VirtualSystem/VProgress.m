//
//  VProgress.m
//  VirtualSystem
//
//  Created by oubaiquan on 2018/1/11.
//  Copyright © 2018年 Youngsoft. All rights reserved.
//

#import "VProgress.h"
#include <setjmp.h>

#define VINSTRUCT_BEGIN  \
    jmp_buf jmpbuf;    \


#define VINSTRUCT(idx, ins)     \
    memcpy(jmpbuf, memory[idx].bytes, sizeof(jmp_buf)); \
    if (setjmp(jmpbuf)) {\
            ins;  \
            memcpy(jmpbuf, memory[idx + 1].bytes, sizeof(jmp_buf)); \
            if (jmpbuf[0] != 0) \
                longjmp(jmpbuf, 1); \
            else\
                return; \
   }\
   else {\
     memcpy((void*)memory[idx].bytes, jmpbuf, sizeof(jmp_buf));\
   }\



#define VINSTRUCT_END  \
    memcpy(jmpbuf, memory[0].bytes, sizeof(jmp_buf)); \
    longjmp(jmpbuf, 1); \



@implementation VProgress



-(void)main:(VCPU*)cpu memory:(VMemory*)memory
{
    VINSTRUCT_BEGIN
    
    VINSTRUCT(0, [cpu moveFromConst:10 toReg:Reg0])             //将常数10保存到CPU的寄存器Reg0中
    VINSTRUCT(1, [cpu moveFromConst:15 toReg:Reg1])             //将常数15保存到CPU的寄存器Reg1中
    VINSTRUCT(2, [cpu addFromReg:Reg0 toReg:Reg1])              //将寄存器Reg0中的值于寄存器Reg1中的值相加并保存到Reg1中
    VINSTRUCT(3, [cpu moveFromReg:Reg1 toAddr:0x1000])           //将保存在Reg1中的相加结果保存到内存地址为0x1000处的内存中
    VINSTRUCT(4, [cpu moveFromAddr:0x1000 toReg:Reg0])           //将内存地址0x1000处的内存值保存到寄存器Reg0中
    VINSTRUCT(5, [cpu moveFromConst:25 toReg:Reg1])             //将常数25保存到CPU的寄存器Reg1中
    VINSTRUCT(6, [cpu isEqualReg:Reg0 withReg:Reg1 thenGoto:9]) //如果Reg0中的值和Reg1中的值相等则执行第9条指令：进行打印输出
    VINSTRUCT(7, [cpu moveFromReg:Reg1 toAddr:0x1000])           //将寄存器Reg1中的值保存到内存地址为0x1000中。
    VINSTRUCT(8, [cpu jumpTo:10])                               //跳转去执行第10条指令
    VINSTRUCT(9, [cpu sys:Int3])                                //系统调用，输出保存在Reg0中的值。
    VINSTRUCT(10, [cpu ret])                                    //程序结束。
    
    VINSTRUCT_END

}


@end
