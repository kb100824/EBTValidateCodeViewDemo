//
//  EBTValidateCodeView.h
//  EBTValidateCodeViewDemo
//
//  Created by ebaotong on 2016/11/3.
//  Copyright © 2016年 com.csst. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EBTValidateCodeView : UIView

//保存字符或者数字验证码数组
@property(nonatomic,copy) NSArray *arrayValidateCode;

//最后生成输出的验证码
@property(nonatomic,readonly,copy) NSString *stringValidateCode;



@end
