//
//  DayBarChartMessage.m
//  BarChart
//
//  Created by 丰雨 on 16/3/18.
//  Copyright © 2016年 Feng. All rights reserved.
//

#import "DayBarChartMessage.h"
#import <UIKit/UIKit.h>

@implementation DayBarChartMessage

//+ (DayBarChartView *)setupDayBarChartView:(UIView *)view {
//    
//}


+ (CGFloat)theTotalBaseData:(CGFloat)basedata onedayBase:(CGFloat)adata {
    CGFloat pro = adata / basedata;
    return pro;
}

+ (CGFloat)getTheMostValueFromTheArray:(NSArray *)array {
    CGFloat value = 0;
    for (NSString *str in array) {
        CGFloat fl = [str floatValue];
        if (value <= fl) {
            value = fl;
        }
    }
    return value;
}

+ (NSArray *)showTheYcoordinates:(CGFloat)value {
    int k = value / 50 + 1;
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i <= k; i++) {
        NSString *valueStr = [NSString stringWithFormat:@"%d", i * 50];
        [arr addObject:valueStr];
    }
    return [arr mutableCopy];
}

+ (CGFloat)valueOfHeightRatiovalue:(CGFloat)value thanValue:(CGFloat)value2 {
    return value / value2;
}

+ (NSArray *)accordingToTheDataGetInDays_Data:(NSArray *)days {
    int i = 1;
    NSMutableArray *muDays = [NSMutableArray array];
    for (NSString *str in days) {
        [muDays addObject:[NSString stringWithFormat:@"%d", i]];
        i++;
    }
    return [muDays mutableCopy];
}

@end
