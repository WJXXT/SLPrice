//
//  VWWWaterView.m
//  Water Waves
//
//  Created by Veari_mac02 on 14-5-23.
//  Copyright (c) 2014年 Veari. All rights reserved.
//

#import "VWWWaterView.h"

@interface VWWWaterView ()
{
    UIColor *_currentWaterColor;
    
    
    float a;
    float b;
    BOOL stop;
    BOOL jia;
}
@property (nonatomic,strong)NSTimer *timer;
@end


@implementation VWWWaterView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setBackgroundColor:[UIColor clearColor]];
        
        a = 0.01;
        b = 0;
        jia = NO;
        stop =YES;
        _currentWaterColor = [UIColor colorWithRed:86/255.0f green:202/255.0f blue:139/255.0f alpha:1];
        _currentLinePointY = 49;
        
        self.timer =[NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(animateWave) userInfo:nil repeats:YES];
        
    }
    return self;
}

-(void)animateWave
{
    if (stop) {
        if (jia) {
            a += 0.01;
        }else{
            a -= 0.01;
        }
        
        
        if (a<=0.0) {
            jia = YES;
        }
        
        if (a>=2.0) {
            jia = NO;
        }
        b+=0.1;
        if (a < -0.001) {
            [self.timer invalidate];
            self.timer = nil;
        }
    }
    _currentLinePointY -= 0.14;
    [self setNeedsDisplay];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
     //获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //创建一条路径
    CGMutablePathRef path = CGPathCreateMutable();
    
    //画水
    //线宽
    CGContextSetLineWidth(context, 1);
    //线颜色
    CGContextSetFillColorWithColor(context, [_currentWaterColor CGColor]);
    
    float y=_currentLinePointY;
    CGPathMoveToPoint(path, NULL, 0, y);
    for(float x=0;x<=SCREEN_WIDTH;x++){
        y= a * sin( x/180*M_PI + 4*b/M_PI ) * 5 + _currentLinePointY;
        CGPathAddLineToPoint(path, nil, x, y);
    }
    
    CGPathAddLineToPoint(path, nil, SCREEN_WIDTH, rect.size.height);
    CGPathAddLineToPoint(path, nil, 0, rect.size.height);
    CGPathAddLineToPoint(path, nil, 0, _currentLinePointY);
    
    CGContextAddPath(context, path);
    CGContextFillPath(context);
    CGContextDrawPath(context, kCGPathStroke);
    CGPathRelease(path);

    
}


@end
