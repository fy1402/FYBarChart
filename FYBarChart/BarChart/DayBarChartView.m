//
//  DayBarChartView.m
//  BarChart
//
//  Created by 丰雨 on 16/3/18.
//  Copyright © 2016年 Feng. All rights reserved.
//

#import "DayBarChartView.h"
#import "DayBarChartMessage.h"

@interface DayBarChartView ()
@property (nonatomic, assign) CGFloat theMostValue;
@property (nonatomic, strong) NSArray *Yarray;
@property (nonatomic, strong) NSArray *weeks;
@property (nonatomic, strong) NSArray *months;
@end

@implementation DayBarChartView

- (instancetype)initWithFrame:(CGRect)frame
                         item:(BarCharType)barcharType
                   dateSource:(NSArray *)dataArray {
    self = [super initWithFrame:frame];
    if (self) {
        _dataSourceArr = dataArray;
        _type = barcharType;
        [self loadData];
        [self insertColorGradient];
    }
    return self;
}

#pragma mark ----LoadData
- (void)loadData {
    _theMostValue = [DayBarChartMessage getTheMostValueFromTheArray:_dataSourceArr];
    _Yarray = [DayBarChartMessage showTheYcoordinates:_theMostValue];
    _than = [DayBarChartMessage valueOfHeightRatiovalue:20 thanValue:50];
}


#pragma mark ------setup UI

- (void)drawRect:(CGRect)rect {
    [self setupTheYcoordinates];
    [self setupTheXcoordinatesType:self.type];
    [self setupTheHistogramView];
}

- (void) insertTransparentGradient {
    //Transparent Gradient Layer 透明梯度层
//    self.backgroundColor = [UIColor orangeColor];
    UIColor *colorOne = [UIColor colorWithRed:(240/255.0)  green:(104/255.0)  blue:(30/255.0)  alpha:0.0];
    UIColor *colorTwo = [UIColor colorWithRed:(33/255.0)  green:(33/255.0)  blue:(33/255.0)  alpha:1.0];
    NSArray *colors = [NSArray arrayWithObjects:(id)colorOne.CGColor, colorTwo.CGColor, nil , nil];
    NSNumber *stopOne = [NSNumber numberWithFloat:0.0];
    NSNumber *stopTwo = [NSNumber numberWithFloat:1.0];
    NSArray *locations = [NSArray arrayWithObjects:stopOne, stopTwo, nil, nil];
    
    //crate gradient layer
    CAGradientLayer *headerLayer = [CAGradientLayer layer];
    
    headerLayer.colors = colors;
    headerLayer.locations = locations;
    headerLayer.frame = self.bounds;
    
    [self.layer insertSublayer:headerLayer atIndex:0];
}

//color gradient layer 不透明
- (void) insertColorGradient {
    
    UIColor *colorOne = [UIColor colorWithRed:(56/255.0) green:(131/255.0) blue:(226/255.0) alpha:1.0];
    UIColor *colorTwo = [UIColor colorWithRed:(149/255.0)  green:(193/255.0)  blue:(253/255.0)  alpha:1.0];
    
    NSArray *colors = [NSArray arrayWithObjects:(id)colorOne.CGColor, colorTwo.CGColor, nil];
    NSNumber *stopOne = [NSNumber numberWithFloat:0.0];
    NSNumber *stopTwo = [NSNumber numberWithFloat:1.0];
    
    NSArray *locations = [NSArray arrayWithObjects:stopOne, stopTwo, nil];
    CAGradientLayer *headerLayer = [CAGradientLayer layer];
    headerLayer.colors = colors;
    headerLayer.locations = locations;
    headerLayer.frame = self.bounds;
    
    [self.layer insertSublayer:headerLayer above:0];
    
}

- (void)createDayBarChartView {
    
}

//创建Y坐标
- (void)setupTheYcoordinates{
    int i = 0;
    for (NSString *str in self.Yarray) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 100 - i * 20, 50, 20)];
        label.text = str;
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:11];
        label.textColor = [UIColor whiteColor];
        [self addSubview:label];
        
        UIView *divider = [[UIView alloc] initWithFrame:CGRectMake(50, self.frame.size.height - 84 - i * 20, self.frame.size.width - 70, 0.7)];
        divider.backgroundColor = [UIColor whiteColor];
        divider.alpha = 0.3;
        [self addSubview:divider];
        
        i++;
    }
}

//创建X坐标
- (void)setupTheXcoordinatesType:(BarCharType)type {
    int i = 0;
    NSInteger k;
    if (type == WeeksType) {
        k = 9;
        for (NSString *str in self.weeks) {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake((75 + (self.frame.size.width - 50) / k * i), self.frame.size.height - 100 + 20, 20, 20)];
            label.text = str;
            label.textAlignment = NSTextAlignmentCenter;
            label.font = [UIFont systemFontOfSize:11];
            label.textColor = [UIColor whiteColor];
            [self addSubview:label];
            i++;
        }
    } else if (type == MonthsType) {
        k = self.months.count + 2;
        for (NSString *str in self.months) {
            if (str.integerValue % 2) {
                UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake((53 + (self.frame.size.width - 50) / k * i), self.frame.size.height - 100 + 20, 20, 20)];
                label.text = str;
                label.textAlignment = NSTextAlignmentCenter;
                label.font = [UIFont systemFontOfSize:11];
                label.textColor = [UIColor whiteColor];
                [self addSubview:label];
            }
            i++;
        }
    } else {
        k = 9;
        for (NSString *str in self.weeks) {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake((100 + (self.frame.size.width - 50) / k * i), self.frame.size.height - 100 + 20, 20, 20)];
            label.text = str;
            label.textAlignment = NSTextAlignmentCenter;
            label.font = [UIFont systemFontOfSize:11];
            label.textColor = [UIColor whiteColor];
            [self addSubview:label];
            i++;
        }
    }
    
}

//给你个柱子
- (void)setupTheHistogramView {
    int i = 0;
    for (NSString *str in self.dataSourceArr) {
        i++;
        UIView *hView = [[UIView alloc] initWithFrame:CGRectMake((50 + (self.frame.size.width - 50) / (self.dataSourceArr.count + 2) * i), (self.frame.size.height - self.than * str.floatValue - 84), 5, self.than * str.floatValue)];
        hView.backgroundColor = [UIColor whiteColor];
        hView.alpha = 0.7;
        hView.tag = i;
        [self addSubview:hView];
        
        UITapGestureRecognizer *singleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap:)];
        singleRecognizer.numberOfTapsRequired = 1;
        [hView addGestureRecognizer:singleRecognizer];
        
        UITapGestureRecognizer *doubleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
        doubleRecognizer.numberOfTapsRequired = 2; // 双击
        //关键语句，给self.view添加一个手势监测；
        [hView addGestureRecognizer:doubleRecognizer];
        // 关键在这一行，双击手势确定监测失败才会触发单击手势的相应操作
        [singleRecognizer requireGestureRecognizerToFail:doubleRecognizer];
    }
}

-(void)singleTap:(UITapGestureRecognizer*)recognizer
{
    //处理单击操作
//    NSLog(@"%@", recognizer.view);
    
    UIView *view = recognizer.view;
    CGFloat x = view.frame.origin.x - 1.5;
    CGFloat y = view.frame.origin.y;
    CGFloat x1 = view.frame.origin.x;
    CGFloat y1 = view.frame.origin.y;
    
    UILabel *popLabel = [[UILabel alloc] init];
    
    NSString *valueStr = [NSString stringWithFormat:@"%.2f", view.frame.size.height / self.than];
    [UIView animateWithDuration:0.3 animations:^{
        view.alpha = 1;
        view.frame = CGRectMake(x, y, view.frame.size.width + 3, view.frame.size.height);
        if (self.popViewStartBlock) {
            self.popViewStartBlock(valueStr);
        }
        
        popLabel.frame = CGRectMake(x - 10, y - 20, 30, 20);
        popLabel.textAlignment = NSTextAlignmentCenter;
        popLabel.text = valueStr;
        popLabel.font = [UIFont systemFontOfSize:7];
        popLabel.textColor = [UIColor redColor];
        [self addSubview:popLabel];
        [view updateConstraints];
    } completion:^(BOOL finished) {
        double delayInSeconds = 2.0;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [UIView animateWithDuration:0.3 animations:^{
                view.alpha = 0.7;
                view.frame = CGRectMake(x1, y1, view.frame.size.width - 3, view.frame.size.height);
                if (self.popViewCloseBlock) {
                    self.popViewCloseBlock();
                }
                [popLabel removeFromSuperview];
                [view updateConstraints];
            }];
        });
    }];
}

-(void)doubleTap:(UITapGestureRecognizer*)recognizer
{
    NSLog(@"双击");
}

#pragma mark ------ ______ -------
- (NSArray *)weeks {
    if (!_weeks) {
        _weeks = [NSArray arrayWithObjects:@"日", @"一", @"二", @"三", @"四", @"五", @"六", nil];
    }
    return _weeks;
}

- (NSArray *)months {
    if (!_months) {
        _months = [DayBarChartMessage accordingToTheDataGetInDays_Data:_dataSourceArr];
    }
    return _months;
}

@end
