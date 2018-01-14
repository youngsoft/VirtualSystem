//
//  VMemory.m
//  VirtualSystem
//
//  Created by oubaiquan on 2018/1/11.
//  Copyright © 2018年 Youngsoft. All rights reserved.
//

#import "VMemory.h"

@implementation VMemory
{
    //内存分为上下两部分，上部分4096保存代码，下部分4096保持数据。
    int _memSpace[8912];
}

-(void)clear
{
    memset(_memSpace, 0, sizeof(int)*8912);
}

- (NSData*)objectAtIndexedSubscript:(Addr)addr
{
    //这里要区分代码部分还是数据部分。
    if (addr >= 4096)
    {
        return [NSData dataWithBytesNoCopy:_memSpace + addr length:sizeof(int) freeWhenDone:NO];
    }
    else
    {
        return  [NSData dataWithBytesNoCopy:_memSpace + (addr * _JBLEN) length:sizeof(jmp_buf) freeWhenDone:NO];
    }
}

- (void)setObject:(NSData*)obj atIndexedSubscript:(Addr)addr
{
    if (addr >= 4096)
    {
        [obj getBytes:_memSpace + addr length:sizeof(int)];
    }
    else
    {
        [obj getBytes:_memSpace + (addr * _JBLEN) length:sizeof(jmp_buf)];
    }
}


@end
