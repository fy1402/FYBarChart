//
//  DayBarChartViewController.m
//  BarChart
//
//  Created by 丰雨 on 16/5/20.
//  Copyright © 2016年 Feng. All rights reserved.
//

#import "BarChartViewController.h"

#import "DayBarChartView.h"
#import "DayBarChartMessage.h"


@interface BarChartViewController ()
@property (nonatomic, strong) DayBarChartView *dayBarChartView;
@end

@implementation BarChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"柱状图";
    [self setupBarChartView];
}


- (void)setupBarChartView {
    
    //更换的时候请把初始化方法中的type（Item）也更换了，下期优化这个
    NSArray *dataSources = [NSArray arrayWithObjects:@"100", @"17", @"37", @"100", @"200", @"300", @"700", @"100", @"17", @"37", @"100", @"200", @"300", @"700", @"100", @"17", @"37", @"100", @"200", @"300", @"700", @"100", @"17", @"37", @"100", @"200", @"300", @"100", @"200", @"300", @"300", nil];
    //    NSArray *dataSources = [NSArray arrayWithObjects:@"100", @"17", @"37", @"100", @"200", @"300", @"700", nil];
    //    CGFloat flo = [DayBarChartMessage getTheMostValueFromTheArray:dataSources];
    //    NSArray *arr = [DayBarChartMessage showTheYcoordinates:flo];
    self.dayBarChartView = [[DayBarChartView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - 100) item:MonthsType dateSource:dataSources];
    [self.view addSubview:self.dayBarChartView];
    //    WS(weakSelf)
    self.dayBarChartView.popViewStartBlock = ^(NSString *valueStr){
        
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
