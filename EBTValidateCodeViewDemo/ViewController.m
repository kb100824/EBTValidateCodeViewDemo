//
//  ViewController.m
//  EBTValidateCodeViewDemo
//
//  Created by ebaotong on 2016/11/3.
//  Copyright © 2016年 com.csst. All rights reserved.
//

#import "ViewController.h"
#import "EBTValidateCodeView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet EBTValidateCodeView *viewValidate;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    NSMutableArray *codeArray = [NSMutableArray array];
    [codeArray removeAllObjects];
    for (int i = 97; i<101; i++) {
        [ codeArray addObject:[NSString stringWithFormat:@"%c", i]];
    }
    self.viewValidate.arrayValidateCode = [codeArray copy];}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnClick:(UIButton *)sender {
    
    NSMutableArray *codeArray = [NSMutableArray array];
    [codeArray removeAllObjects];
    for (int i = 101; i<105; i++) {
        
    [ codeArray addObject:[NSString stringWithFormat:@"%c", i]];
    }
    
    self.viewValidate.arrayValidateCode = [codeArray copy];
     NSLog(@"输入验证码=%@",self.viewValidate.stringValidateCode);
}


@end
