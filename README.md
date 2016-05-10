# FYBarChart



a simple BarChart

#import "DayBarChartView.h"
#import "DayBarChartMessage.h"

#define WIDTH  self.view.frame.size.width
#define HEIGHT self.view.frame.size.height
@property (nonatomic, strong) DayBarChartView *dayBarChartView;

- (void)setupBarChartView {
#property mark --- 这里分为周和月显示---item:type要设置好
NSArray *dataSources = [NSArray arrayWithObjects:@"100", @"17", @"37", @"100", @"200", @"300", @"700", @"100", @"17", @"37", @"100", @"200", @"300", @"700", @"100", @"17", @"37", @"100", @"200", @"300", @"700", @"100", @"17", @"37", @"100", @"200", @"300", nil];
//    NSArray *dataSources = [NSArray arrayWithObjects:@"100", @"17", @"37", @"100", @"200", @"300", @"700", nil];
CGFloat flo = [DayBarChartMessage getTheMostValueFromTheArray:dataSources];
NSArray *arr = [DayBarChartMessage showTheYcoordinates:flo];
NSLog(@"%@", arr);
self.dayBarChartView = [[DayBarChartView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - 100) item:MonthsType dateSource:dataSources];
[self.view addSubview:self.dayBarChartView];
}
