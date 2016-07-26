//
//  ViewController2.m
//  seePlist
//
//  Created by Lucian on 16/7/26.
//  Copyright © 2016年 Lucian. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2

//同步成员变量和属性
@synthesize stepper = _stepper;
@synthesize segControl = _segControl;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    NSLog(@"enter the ViewController2->viewDidLoad method");
    
    //UIStepper
    _stepper = [[UIStepper alloc] init];
    _stepper.frame = CGRectMake(100, 100, 80, 40);
//    _stepper.backgroundColor = [UIColor yellowColor];
    _stepper.minimumValue = 0;
    _stepper.maximumValue = 100;
    _stepper.value = 50;
    _stepper.stepValue = 10;
    //是否可以重复响应事件
    _stepper.autorepeat = YES;
    //是否将步进结果通过步进函数响应
    _stepper.continuous = YES;
    
    [_stepper addTarget:self action:@selector(stepperTouched) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_stepper];
    
    //UISegmentedControl
    _segControl = [[UISegmentedControl alloc] init];
    _segControl.frame = CGRectMake(100, 200, 200, 40);
    [_segControl insertSegmentWithTitle:@"0元" atIndex:0 animated:YES];
    [_segControl insertSegmentWithTitle:@"5元" atIndex:1 animated:YES];
    [_segControl insertSegmentWithTitle:@"10元" atIndex:2 animated:YES];
    _segControl.selectedSegmentIndex = 0;
    [self.view addSubview:_segControl];
    
    //UISegmentedControl
    UISegmentedControl *segControlWithImage = [[UISegmentedControl alloc] init];
    segControlWithImage.frame = CGRectMake(20, 300, 300, 150);
//    [UIImage ]
    [segControlWithImage insertSegmentWithImage:[UIImage imageNamed:@"img1"] atIndex:0 animated:YES];
    [segControlWithImage insertSegmentWithImage:[UIImage imageNamed:@"img2"] atIndex:1 animated:YES];
    segControlWithImage.selectedSegmentIndex = 0;
    [self.view addSubview: segControlWithImage];
    
    //UIAlertView
    
    
}

- (void)stepperTouched{
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
