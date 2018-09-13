//
//  ViewController.m
//  PerfectMessageForwarding
//
//  Created by Yang,Dongzheng on 2018/9/13.
//  Copyright © 2018年 Yang,Dongzheng. All rights reserved.
//

#import "ViewController.h"
#import "People.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"消息转发";
    
    People *p = [[People alloc] init];
    [p performSelector:@selector(perfectGotoSchool) withObject:nil afterDelay:0];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
