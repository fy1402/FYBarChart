//
//  LineChartViewController.m
//  BarChart
//
//  Created by 丰雨 on 16/5/20.
//  Copyright © 2016年 Feng. All rights reserved.
//

#import "LineChartViewController.h"
#import "LineChartView.h"

@interface LineChartViewController ()
@property (nonatomic, strong) LineChartView *lineChartView;
@end

@implementation LineChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupLineChart];
    self.title = @"折线图";
}

- (void)setupLineChart {
    self.lineChartView = [[LineChartView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - 100) item:MonthsType dateSource:nil];
    self.lineChartView.dateArray = [NSMutableArray arrayWithObjects:@"2016-4-14",@"2016-4-18",@"2016-4-20",@"2016-4-23",@"2016-4-24", @"2016-4-25", nil];
    self.lineChartView.dateDetailArray = [NSMutableArray arrayWithObjects:@"2016-4-14",@"2016-4-15",@"2016-4-16",@"2016-4-17",@"2016-4-18", @"2016-4-19",@"2016-4-20",@"2016-4-21",@"2016-4-22",@"2016-4-23",@"2016-4-24", @"2016-4-25", nil];
    self.lineChartView.dataDictionary = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"0.2",@"2016-4-25", @"0.9",@"2016-4-24", @"0.6",@"2016-4-23", @"0.0",@"2016-4-22", @"0.8",@"2016-4-21",@"0.01",@"2016-4-20",@"0.3",@"2016-4-19",@"0.01",@"2016-4-18",@"0.73",@"2016-4-17",@"0.5",@"2016-4-16",@"0.02",@"2016-4-15",@"0.7",@"2016-4-14", nil];
    self.lineChartView.data1Dictionary = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"0.3",@"2016-4-25", @"0.9",@"2016-4-24", @"0.5",@"2016-4-23", @"0.1",@"2016-4-22", @"0.2",@"2016-4-21",@"0.9",@"2016-4-20",@"0.05",@"2016-4-19",@"0.02",@"2016-4-18",@"0.03",@"2016-4-17",@"0.04",@"2016-4-16",@"0.02",@"2016-4-15",@"0.8",@"2016-4-14", nil];
    [self.view addSubview:self.lineChartView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
