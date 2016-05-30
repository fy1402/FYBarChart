//
//  LineChartView.m
//  BarChart
//
//  Created by 丰雨 on 16/5/20.
//  Copyright © 2016年 Feng. All rights reserved.
//

#import "LineChartView.h"
#define LineCount   6
#define height self.frame.size.height
#define width self.frame.size.width
@interface LineChartView ()
@property (nonatomic,strong) NSMutableArray         *lineArray;
@property (nonatomic,strong) NSMutableArray         *line1Array;
@property (nonatomic,strong) UITapGestureRecognizer *tapGesture;
@end

@implementation LineChartView

- (instancetype)initWithFrame:(CGRect)frame
                         item:(LineCharType)lineCharType
                   dateSource:(NSArray *)dataArray {
    self = [super initWithFrame:frame];
    if (self) {
        _tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGestureMethod:)];
        _tapGesture.numberOfTapsRequired = 1;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [self insertColorGradient];
    [self createLineView];
}

- (void)createLineView {
    CGContextRef context = UIGraphicsGetCurrentContext();
    //    画横线
    for (int i = 0; i < LineCount; i ++ ) {
        CGContextMoveToPoint(context, 5, i*height/LineCount+10);
        CGContextAddLineToPoint(context, width-30, i*height/LineCount+10);
        NSString *prcent = [NSString stringWithFormat:@"%d%%",100-i *20];
        [prcent drawAtPoint:CGPointMake(width-30, i*height/LineCount+5) withAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]}];
    }
    [[UIColor redColor] setStroke];
    CGContextDrawPath(context, kCGPathFillStroke);
    //    下面的日期
    for (int i = 0; i < _dateArray.count; i ++ ) {
        NSString *dateString = [_dateArray objectAtIndex:i];
        [dateString drawAtPoint:CGPointMake(5+(i * width/_dateArray.count), 5*height/LineCount+20) withAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]}];
    }
    for (int i = 0; i < _dateDetailArray.count ; i ++) {
        NSString *dateString = [_dateDetailArray objectAtIndex:i];
        int ratio = [_dataDictionary[dateString] floatValue]*100;
        int ratio1 = [_data1Dictionary[dateString] floatValue]*100;
        NSString *datStr = NSStringFromCGPoint(CGPointMake(5+(i * width/_dateDetailArray.count), 5*height/LineCount-((5*height/LineCount/100)*ratio)+10));
        NSString *datStr1 = NSStringFromCGPoint(CGPointMake(5+(i * width/_dateDetailArray.count), 5*height/LineCount-((5*height/LineCount/100)*ratio1)+10));
        [_lineArray addObject:datStr];
        [_line1Array addObject:datStr1];
    }
    [[UIColor greenColor] setStroke];
    CGContextDrawPath(context, kCGPathFillStroke);
    //    划线
    CGPoint point1 = CGPointFromString(_lineArray[0]);
    CGContextMoveToPoint(context, point1.x,point1.y);
    for (int i = 1; i < _lineArray.count ; i ++) {
        CGPoint point = CGPointFromString(_lineArray[i]);
        CGContextAddLineToPoint(context, point.x,point.y);
        
    }
    [[UIColor greenColor] setStroke];
    CGContextDrawPath(context, kCGPathStroke);
    
    CGPoint point2 = CGPointFromString(_line1Array[0]);
    CGContextMoveToPoint(context, point2.x,point2.y);
    for (int i = 1; i < _line1Array.count ; i ++) {
        CGPoint point = CGPointFromString(_line1Array[i]);
        CGContextAddLineToPoint(context, point.x,point.y);
    }
    [[UIColor blackColor] setStroke];
    CGContextDrawPath(context, kCGPathStroke);
}

//color gradient layer 不透明
- (void)insertColorGradient {
    
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

#pragma mark ---- TapGesture
-(void)tapGestureMethod:(UITapGestureRecognizer *)gesture{
    CGPoint point = [gesture locationInView:self];
    for (NSString *string in _lineArray) {
        CGPoint point1 = CGPointFromString(string);
        BOOL isCon =  CGPointEqualToPoint(point1, point);
        if (isCon) {
            NSLog(@"www");
        }
    }
}

#pragma mark ---- Lazy loading
- (NSMutableArray *)lineArray {
    if (!_lineArray) {
        _lineArray = [NSMutableArray array];
    }
    return _lineArray;
}

- (NSMutableArray *)line1Array {
    if (!_line1Array) {
        _line1Array = [NSMutableArray array];
    }
    return _line1Array;
}

#pragma mark ---- Touch-Began
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    //    for (NSString *string in _lineArray) {
    //        CGPoint point1 = CGPointFromString(string);
    //        BOOL isCon =  CGPointEqualToPoint(point1, point);
    //        if (isCon) {
    //            NSLog(@"www");
    //        }
    //    }
    NSLog(@"%f   %f",point.x,point.y);
}

@end
