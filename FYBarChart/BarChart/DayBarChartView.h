//
//  DayBarChartView.h
//  BarChart
//
//  Created by 丰雨 on 16/3/18.
//  Copyright © 2016年 Feng. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    Weeks = 0,       //柱状图格式  --- 周
    MonthS,          //  月
    Years,           //  年   ---- 暂不考虑
} BarCharType;

@interface DayBarChartView : UIView

//数据源
@property (nonatomic, strong) NSArray *dataSourceArr;

// 柱状图格式
@property (nonatomic, assign) BarCharType type;
//柱状图高度比重
@property (nonatomic, assign) CGFloat than;

- (instancetype)initWithFrame:(CGRect)frame
                         item:(BarCharType)barcharType
                   dateSource:(NSArray *)dataArray;
@end
