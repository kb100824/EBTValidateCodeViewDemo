#本地生成图形验证码(支持xib、sb、纯代码)

1:把 文件夹名称"EBTValidateCodeView"里面的两个文件添加到项目中并引用一下。

2:使用xib或者sb的需要在控制器上面放一个view 并设置其class为"EBTValidateCodeView"。

3:拖线条并设置其属性

//保存字符或者数字验证码数组
@property(nonatomic,copy) NSArray *arrayValidateCode;

4:获取最终生成的验证码通过该其属性

//最后生成输出的验证码
@property(nonatomic,readonly,copy) NSString *stringValidateCode;

5:测试案例:

    NSMutableArray *codeArray = [NSMutableArray array];
    
    [codeArray removeAllObjects];
    
    for (int i = 101; i<105; i++) {
        
    [ codeArray addObject:[NSString stringWithFormat:@"%c", i]];
    }
    
    self.viewValidate.arrayValidateCode = [codeArray copy];
    
     NSLog(@"输入验证码=%@",self.viewValidate.stringValidateCode);





![Image](https://github.com/KBvsMJ/EBTValidateCodeViewDemo/blob/master/demogif/3.gif)

