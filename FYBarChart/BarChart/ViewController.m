//
//  ViewController.m
//  BarChart
//
//  Created by 丰雨 on 16/3/18.
//  Copyright © 2016年 Feng. All rights reserved.
//

#import "ViewController.h"
#import "DayBarChartView.h"
#import "DayBarChartMessage.h"
#import "PopViewController.h"

#define WIDTH  self.view.frame.size.width
#define HEIGHT self.view.frame.size.height
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;


@interface ViewController ()<UIPopoverPresentationControllerDelegate>
@property (nonatomic, strong) DayBarChartView *dayBarChartView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"柱状图";
    [self setupBarChartView];
}

- (void)touchMe {
    NSLog(@"pop");
}

- (void)setupBarChartView {
    
    NSArray *dataSources = [NSArray arrayWithObjects:@"100", @"17", @"37", @"100", @"200", @"300", @"700", @"100", @"17", @"37", @"100", @"200", @"300", @"700", @"100", @"17", @"37", @"100", @"200", @"300", @"700", @"100", @"17", @"37", @"100", @"200", @"300", @"100", @"200", @"300", @"300", nil];
//    NSArray *dataSources = [NSArray arrayWithObjects:@"100", @"17", @"37", @"100", @"200", @"300", @"700", nil];
    CGFloat flo = [DayBarChartMessage getTheMostValueFromTheArray:dataSources];
    NSArray *arr = [DayBarChartMessage showTheYcoordinates:flo];
    self.dayBarChartView = [[DayBarChartView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - 100) item:MonthsType dateSource:dataSources];
    [self.view addSubview:self.dayBarChartView];
//    WS(weakSelf)
    self.dayBarChartView.popViewStartBlock = ^(NSString *valueStr){
        
    };
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
