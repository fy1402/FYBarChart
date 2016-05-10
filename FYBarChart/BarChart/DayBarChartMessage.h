//
//  DayBarChartMessage.h
//  BarChart
//
//  Created by 丰雨 on 16/3/18.
//  Copyright © 2016年 Feng. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;
#import "DayBarChartMessage.h"
#import "DayBarChartView.h"

@interface DayBarChartMessage : NSObject

//占比
+ (CGFloat)theTotalBaseData:(CGFloat)basedata onedayBase:(CGFloat)adata;

//cell 高度
//+ (CGFloat)cellHeight

//获取数组中最大值
+ (CGFloat)getTheMostValueFromTheArray:(NSArray *)array;

// 根据一个最大值 创建左侧刻度数组
+ (NSArray *)showTheYcoordinates:(CGFloat)value;

// 数值在屏幕中的高度比重
+ (CGFloat)valueOfHeightRatiovalue:(CGFloat)value thanValue:(CGFloat)value2;

//根据数据得到月份天数
+ (NSArray *)accordingToTheDataGetInDays_Data:(NSArray *)days;
@end
