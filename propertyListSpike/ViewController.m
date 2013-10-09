//
//  ViewController.m
//  propertyListSpike
//
//  Created by u16suzu on 2013/10/10.
//  Copyright (c) 2013年 u16suzu. All rights reserved.
//

#import "ViewController.h"
#import "User.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    User*u = [[User alloc]init];

    u.name = @"taro";
    u.age = @23;
    u.height = 178;
    u.weight = 65;
    u.marriage = YES;
    u.initial = 't'; // return ascii code
    u.hobby = @"coding";
    
    [u p];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
