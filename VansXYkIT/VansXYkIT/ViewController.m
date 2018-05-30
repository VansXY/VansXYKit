//
//  ViewController.m
//  VansXYKit
//
//  Created by 肖扬 on 2018/5/30.
//  Copyright © 2018年 Vickate. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"develop");
    [self addMethod];
    [self addSecondMethod];
    [self addThirdMethod];
    [self addFixBug];
}

- (void)addMethod {
    NSLog(@"addMethod");
}

- (void)addSecondMethod {
    NSLog(@"addSecondMethod");
}

- (void)addThirdMethod {
    NSLog(@"addThirdMethod");
}

- (void)addFixBug {
    NSLog(@"addFixBug");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
