# FYBarChart



a simple BarChart

#import "DayBarChartView.h"
#import "DayBarChartMessage.h"

define WIDTH  self.view.frame.size.width
define HEIGHT self.view.frame.size.height
@property (nonatomic, strong) DayBarChartView *dayBarChartView;

//- (void)setupBarChartView {\n
#property mark --- 这里分为周和月显示---item:type要设置好\n
NSArray *dataSources = [NSArray arrayWithObjects:@"100", @"17", @"37", @"100", @"200", @"300", @"700", @"100", @"17", @"37", @"100", @"200", @"300", @"700", @"100", @"17", @"37", @"100", @"200", @"300", @"700", @"100", @"17", @"37", @"100", @"200", @"300", nil];\n
//    NSArray *dataSources = [NSArray arrayWithObjects:@"100", @"17", @"37", @"100", @"200", @"300", @"700", nil];\n
CGFloat flo = [DayBarChartMessage getTheMostValueFromTheArray:dataSources];\n
NSArray *arr = [DayBarChartMessage showTheYcoordinates:flo];\n
self.dayBarChartView = [[DayBarChartView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - 100) item:MonthsType dateSource:dataSources];\n
[self.view addSubview:self.dayBarChartView];\n
}
