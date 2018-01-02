//
//  ViewController.m
//  LDX-Bluetooth
//
//  Created by mac on 2017/11/9.
//  Copyright © 2017年 LDX. All rights reserved.
//

#import "ViewController.h"
#import <CoreBluetooth/CoreBluetooth.h>//蓝牙框架
@interface ViewController ()<CBCentralManagerDelegate>
@property (nonatomic,strong)CBCentralManager * centerManager;//蓝牙
@end

@implementation ViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    // 一般使用第二种，简单粗暴自带代理
    self.centerManager = [[CBCentralManager alloc] init];
    self.centerManager = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
    
    // 这个....初始化特定的中心，可能与后台使用有关，确实不了解，请告知，谢谢；
    self.centerManager = [[CBCentralManager alloc] initWithDelegate:self
                                                              queue:nil
                                                            options:@{CBCentralManagerOptionShowPowerAlertKey:@(YES),
                                                                      CBCentralManagerOptionRestoreIdentifierKey:@"UUID"}];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 一般使用第二种，简单粗暴自带代理
    self.centerManager = [[CBCentralManager alloc] init];
    self.centerManager = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
    
    // 这个....初始化特定的中心，可能与后台使用有关，确实不了解，请告知，谢谢；
    self.centerManager = [[CBCentralManager alloc] initWithDelegate:self
                                                              queue:nil
                                                            options:@{CBCentralManagerOptionShowPowerAlertKey:@(YES),
                                                                      CBCentralManagerOptionRestoreIdentifierKey:@"UUID"}];

    // Do any additional setup after loading the view, typically from a nib.
}
- (void)centralManagerDidUpdateState:(CBCentralManager *)central {
    if (central.state == CBCentralManagerStatePoweredOn) {
        // 蓝牙打开，则开始搜索
        
        NSLog(@"蓝牙设备开着");
    } else {
//        NSURL *url = [NSURL URLWithString:@"prefs:root=Bluetooth"];
//        if ([[UIApplication sharedApplication]canOpenURL:url]) {
//            [[UIApplication sharedApplication]openURL:url];
//        }
        NSLog(@"蓝牙设备关着");
        NSLog(@"蓝牙 异常");
    }
}
// 注意，这个代理有毒，可能与后台蓝牙有关
- (void)centralManager:(CBCentralManager *)central willRestoreState:(NSDictionary<NSString *, id> *)dict {
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
