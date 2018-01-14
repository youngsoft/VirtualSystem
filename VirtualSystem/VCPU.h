//
//  VCPU.h
//  VirtualSystem
//
//  Created by oubaiquan on 2018/1/11.
//  Copyright © 2018年 Youngsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "VMemory.h"

//定义寄存器编号
typedef enum : int {
    Reg0,
    Reg1,
    Reg2,
    Reg3
} RegNum;


//定义系统调用编号
typedef enum : int {
    Int3         //设备输出，将寄存器Reg0中的内容输出到屏幕
} Interrupt;

//定义指令索引
typedef int Instruct;


/**
 虚拟CPU类，模拟CPU所提供的指令。
 虚拟CPU由4个寄存器和运算部件组成。四个寄存器的编号分别定义在RegNum中；运算部件提供了赋值、加减、比较、跳转9个指令。
 */
@interface VCPU : NSObject


//将一个常量值赋值给编号为reg的寄存器中。
-(void)moveFromConst:(int)val toReg:(RegNum)reg;
//将编号为reg1的寄存器中的值赋值给编号为reg2的寄存器中。
-(void)moveFromReg:(RegNum)reg1 toReg:(RegNum)reg2;
//将编号为reg的寄存器中的值赋值给地址为addr的内存中。
-(void)moveFromReg:(RegNum)reg toAddr:(Addr)addr;
//将地址为addr的内存中的值赋值给编号为reg的寄存器中。
-(void)moveFromAddr:(Addr)addr toReg:(RegNum)reg;

//将编号为reg1的寄存器中的值加上编号为reg2的寄存器中的值并将结果保存到编号为reg2的寄存器中。
-(void)addFromReg:(RegNum)reg1 toReg:(RegNum)reg2;
//将编号为reg1的寄存器中的值减去编号为reg2的寄存器中的值并将结果保存到编号为reg2的寄存器中。
-(void)subFromReg:(RegNum)reg1 toReg:(RegNum)reg2;

//如果两个寄存器内容相等则执行instruct所指定的指令，否则什么也不做。
-(void)isEqualReg:(RegNum)reg1 withReg:(RegNum)reg2 thenGoto:(Instruct)instruct;

//跳转到instruct所指定的指令中去。
-(void)jumpTo:(Instruct)instruct;

//系统返回
-(void)ret;

//系统调用，目前只支持屏幕输出调用Int3,表示将寄存器编号为0中的值输出到屏幕。
-(void)sys:(Interrupt)interrupt;

@end
