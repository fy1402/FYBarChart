//
//  ViewController.m
//  BarChart
//
//  Created by 丰雨 on 16/3/18.
//  Copyright © 2016年 Feng. All rights reserved.
//

#import "ViewController.h"
#import "BarChartViewController.h"
#import "LineChartViewController.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"柱状图";
}


- (IBAction)BarChartClick:(id)sender {
    [self.navigationController pushViewController:[[BarChartViewController alloc] init] animated:YES];
}


- (IBAction)LineChartClick:(id)sender {
    [self.navigationController pushViewController:[[LineChartViewController alloc] init] animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
