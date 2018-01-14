//
//  ViewController.m
//  VirtualSystem
//
//  Created by oubaiquan on 2018/1/11.
//  Copyright © 2018年 Youngsoft. All rights reserved.
//

#import "ViewController.h"
#import "VComputer.h"


@interface ViewController ()

@property(nonatomic, strong) VComputer *computer;
@property(nonatomic, strong) VOS *os;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)handleCreateComputer:(id)sender {
    
    if (self.computer == nil)
    {
        self.computer = [VComputer new];
        NSLog(@"安装机器成功");
    }
    else
    {
        NSLog(@"机器已安装");
    }
}

- (IBAction)handleInstallOS:(id)sender {
    
    if (self.os == nil)
    {
        self.os = [VOS new];
        
        [self.computer installOS:self.os];
        
        NSLog(@"安装操作系统成功");

    }
    else
    {
        NSLog(@"操作系统已安装");
    }
    
}

- (IBAction)handleBoot:(id)sender {
    
    NSLog(@"开机启动");
    [self.computer boot];
    
}

- (IBAction)handleShutdown:(id)sender {
    
    [self.computer shutdown];
    NSLog(@"已关机");
}

@end
