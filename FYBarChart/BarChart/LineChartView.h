//
//  LineChartView.h
//  BarChart
//
//  Created by 丰雨 on 16/5/20.
//  Copyright © 2016年 Feng. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    WeeksType = 1,       //柱状图格式  --- 周
    MonthsType,          //  月
    YearsType,           //  年   ---- 暂不考虑
} LineCharType;

@interface LineChartView : UIView
- (instancetype)initWithFrame:(CGRect)frame
                         item:(LineCharType)lineCharType
                   dateSource:(NSArray *)dataArray;

@property (nonatomic,strong) NSMutableArray      *dateArray;
@property (nonatomic,strong) NSMutableArray      *dateDetailArray;
@property (nonatomic,strong) NSMutableDictionary *dataDictionary;
@property (nonatomic,strong) NSMutableDictionary *data1Dictionary;

@end
