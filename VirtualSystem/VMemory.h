//
//  VMemory.h
//  VirtualSystem
//
//  Created by oubaiquan on 2018/1/11.
//  Copyright © 2018年 Youngsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSUInteger Addr;


/**
 虚拟内存类，用于内存的模拟。内存占用8192个int值，上半部分保存指令，下半部分保存数据。
 */
@interface VMemory : NSObject

//清除内存
-(void)clear;

//读取和设置内存中的数据。
- (NSData*)objectAtIndexedSubscript:(Addr)addr;
- (void)setObject:(NSData*)obj atIndexedSubscript:(Addr)addr;

@end
