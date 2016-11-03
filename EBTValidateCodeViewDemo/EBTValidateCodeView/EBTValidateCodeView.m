//
//  EBTValidateCodeView.m
//  EBTValidateCodeViewDemo
//
//  Created by ebaotong on 2016/11/3.
//  Copyright © 2016年 com.csst. All rights reserved.
//

#import "EBTValidateCodeView.h"

#define kEBTRandomBackGroundColor [[UIColor colorWithRed:arc4random() % 256 / 256.0 green:arc4random() % 256 / 256.0 blue:arc4random() % 256 / 256.0 alpha:1.0] colorWithAlphaComponent:0.5] //背景颜色
#define kEBTLineCount 4  //干扰线条个数
#define kEBTLineWidth 1.0 //线宽
#define kEBTCharCount 4 //每次显示字符个数
#define kEBTFontSize [UIFont systemFontOfSize:arc4random() % 5 + 12] //字体大小
@interface EBTValidateCodeView ()
{
  NSMutableString *charCodeString; //保存数组中验证码拼接的字符串
}
//获取数组中对应的字符验证码
@property(nonatomic,strong)NSMutableString *mutableArrayString;

@end
@implementation EBTValidateCodeView
- (void)awakeFromNib{
    
    [super awakeFromNib];
    self.layer.cornerRadius = 3.0; //设置layer圆角半径
    self.layer.masksToBounds = YES; //隐藏边界
    self.backgroundColor = kEBTRandomBackGroundColor;
    
   
    
    
}
- (instancetype)initWithFrame:(CGRect)frame{

    if (self=[super initWithFrame:frame]) {
        self.layer.cornerRadius = 3.0; //设置layer圆角半径
        self.layer.masksToBounds = YES; //隐藏边界
        self.backgroundColor = kEBTRandomBackGroundColor;
    }
    return self;
    

}
- (NSMutableString *)mutableArrayString{
    
    if (!_mutableArrayString) {
        _mutableArrayString =  [[NSMutableString alloc]initWithCapacity:kEBTCharCount];
    }
    return _mutableArrayString;
    
}

- (void)setArrayValidateCode:(NSArray *)arrayValidateCode{

    _arrayValidateCode = arrayValidateCode;
    charCodeString = [[NSMutableString alloc]initWithCapacity:kEBTCharCount];
    for (NSInteger i = 0; i<kEBTCharCount; i++) {
        //获取数组中每个字符
        self.mutableArrayString = _arrayValidateCode[i];
        //把每个字符拼接为字符串
        charCodeString = (NSMutableString *) [charCodeString stringByAppendingString: self.mutableArrayString];
    }
    //不断重绘
    [self setNeedsDisplay];



}

- (void)drawRect:(CGRect)rect{
   
    [super drawRect:rect];
    
    self.backgroundColor = kEBTRandomBackGroundColor;
    
    //获得要显示验证码字符串，根据长度，计算每个字符显示的大概位置
    NSString *textString = [NSString stringWithFormat:@"%@",charCodeString];
    //先预设一个大写字符的宽度高度
    CGSize size = [@"W" sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}];
    int charWidth = rect.size.width / textString.length - size.width;
    int charHeight = rect.size.height - size.height;
    CGPoint point;
    float charX, charY;
    for (NSInteger i = 0; i < textString.length; i++)
    {
        charX = arc4random() % charWidth + rect.size.width / textString.length * i;
        charY = arc4random() % charHeight;
        point = CGPointMake(charX, charY);
        unichar charC = [textString characterAtIndex:i];
        NSString *textCharC = [NSString stringWithFormat:@"%C", charC];
        //绘制文字
        [textCharC drawAtPoint:point withAttributes:@{NSFontAttributeName:kEBTFontSize}];
    }
    

    CGContextRef context = UIGraphicsGetCurrentContext();
    //设置画线宽度
    CGContextSetLineWidth(context, kEBTLineWidth);
    //绘制干扰的彩色直线
    for(int i = 0; i < kEBTLineCount; i++)
    {
        //设置线的随机颜色
        UIColor *color = kEBTRandomBackGroundColor;
        CGContextSetStrokeColorWithColor(context, [color CGColor]);
        //设置线的起点
        charX = arc4random() % (int)rect.size.width;
        charY = arc4random() % (int)rect.size.height;
        CGContextMoveToPoint(context, charX, charY);
        //设置线终点
        charX = arc4random() % (int)rect.size.width;
        charY = arc4random() % (int)rect.size.height;
        CGContextAddLineToPoint(context, charX, charY);
        //画线
        CGContextStrokePath(context);
    }

   
    

}
- (NSString *)stringValidateCode{

    return charCodeString;
}

@end
