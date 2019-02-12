//
//  PQViewController.m
//  PQNetworking
//
//  Created by zoudike on 01/28/2019.
//  Copyright (c) 2019 zoudike. All rights reserved.
//

#import "PQViewController.h"
#import "PQDemoApiManager.h"

@interface PQViewController ()

@end

@implementation PQViewController

- (IBAction)netRequestClick:(id)sender {
    //实际开发中可以放到viewmodel中进行处理
    [[[PQDemoApiManager alloc] init] executWithSuccess:^(PQURLResponse *response) {
        NSLog(@"");
    } failure:^(PQURLResponse *response) {
        NSLog(@"");
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
