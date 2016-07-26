//
//  ViewController.m
//  seePlist
//
//  Created by Lucian on 16/7/25.
//  Copyright © 2016年 Lucian. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"
#import "LoginViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//属性和成员变量同步
@synthesize timer = _timer;

- (void) addButton{
    //here to test button
    //    UIButton *btn = [[UIButton alloc] init];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(100, 100, 100, 40);
    btn.backgroundColor = [UIColor yellowColor];
    [btn setTitle:@"Button1" forState:UIControlStateNormal];
    [btn setTitle:@"touched" forState:UIControlStateHighlighted];
    btn.tag = 1;
    [btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void) addButtonImage{
    //create image button
    UIButton *btnImage = [UIButton buttonWithType:UIButtonTypeCustom];
    btnImage.frame = CGRectMake(100, 200, 100, 100);
    UIImage *img1 = [UIImage imageNamed:@"img1"];
    UIImage *img2 = [UIImage imageNamed:@"img2"];
    [btnImage setImage:img1 forState:UIControlStateNormal];
    [btnImage setImage:img2 forState:UIControlStateHighlighted];
    [self.view addSubview:btnImage];
}

- (void) addButtonActionManagement{
    UIButton *btnWithAction = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnWithAction.frame = CGRectMake(100, 300, 80, 40);
    btnWithAction.backgroundColor = [UIColor yellowColor];
    [btnWithAction setTitle:@"Button" forState:UIControlStateNormal];
    [btnWithAction addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
    btnWithAction.tag = 2;
    [self.view addSubview:btnWithAction];
}

-(void) pressBtn: (UIButton*) btn{
    
    NSLog(@"Button touched,the tag is%d",btn.tag);
    if(btn.backgroundColor == [UIColor greenColor]){
        btn.backgroundColor = [UIColor yellowColor];
    }else{
        btn.backgroundColor = [UIColor greenColor];
    }

    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addButton];
    [self addButtonImage];
    [self addButtonActionManagement];
    //创建一个button，与定时器timer有关
    UIButton *timerBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    timerBtn.frame = CGRectMake(100, 350, 100, 100);
    timerBtn.backgroundColor = [UIColor greenColor];
    [timerBtn setTitle:@"启动定时器" forState:UIControlStateNormal];
    [timerBtn addTarget:self action:@selector(timerStart) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:timerBtn];
    
    //add stop button
    UIButton *timerBtnStop = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    timerBtnStop.frame = CGRectMake(100, 455, 100, 100);
    timerBtnStop.backgroundColor = [UIColor greenColor];
    [timerBtnStop setTitle:@"结束定时器" forState:UIControlStateNormal];
    [timerBtnStop addTarget:self action:@selector(timerStop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:timerBtnStop];
    
    //add a view to move with the timer control
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake([UIScreen mainScreen].bounds.size.width-100, [UIScreen mainScreen].bounds.size.height-100, 100, 100);
    view.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:view];
    //给view设置一个tag以便可以通过父视图来获取它
    view.tag = 101;
    
    //UISwitch
    UISwitch *sw = [[UISwitch alloc] init];
    sw.frame = CGRectMake(220, 100, 1000, 1000);
    [sw addTarget:self action:@selector(switchTouched:) forControlEvents:UIControlEventValueChanged];
    //set status like this
//    sw.on = YES;
    //or like this by using [ setOn:] method
//    [sw setOn:YES];
    //test to close the animation, but it seems that there's no difference between animated YES and NO
    [sw setOn:YES animated:YES];
    //change the colors:
    [sw setOnTintColor:[UIColor blueColor]];
    [sw setThumbTintColor:[UIColor redColor]];
    [sw setTintColor:[UIColor yellowColor]];
    [self.view addSubview:sw];
    
    //UIProgressView进度条
    UIProgressView *progress = [[UIProgressView alloc]init];
    //进度条的高度无发变化
//    progress.frame = CGRectMake(20, [UIScreen mainScreen].bounds.size.height-50, 200, 40);
    progress.frame = CGRectMake(20, 80, 200, 40);
    progress.progressTintColor = [UIColor redColor];
    //设置进度条的进度值
    progress.progress = 0.8;
    //设置进度条的风格特征
    progress.progressViewStyle = UIProgressViewStyleDefault;
    
    [self.view addSubview:progress];
    
    //UISlider滑动条
    UISlider *slider = [[UISlider alloc]init];
    //高度是不可改变的
    slider.frame = CGRectMake(20, [UIScreen mainScreen].bounds.size.height-50, 200, 40);
    slider.maximumValue = 100;
    slider.minimumValue = -100;
    //滑块的位置
    slider.value = 50;
    //
    slider.minimumTrackTintColor = [UIColor orangeColor];
    slider.maximumTrackTintColor = [UIColor greenColor];
    //设置滑块颜色
    slider.thumbTintColor = [UIColor redColor];
    [slider addTarget:self action:@selector(pressSlider:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
    
    //add a button to jump to loginPage
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    loginBtn.frame = CGRectMake(200, 200, 80, 40);
//    loginBtn.backgroundColor = [UIColor redColor];
    [loginBtn setTitle:@"Login" forState:UIControlStateNormal];
//    loginBtn.titleLabel.text = @"Login";
//    loginBtn.titleLabel.textColor = [UIColor blackColor];
    [loginBtn addTarget:self action:@selector(loginPress) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    
    
}

- (void)timerStart{
    //NSTimer的类方法创建并启动一个定时器
    //参数分别是：
    //P1:每隔多长时间调用定时器函数，以秒为单位的整数
    //P2:表示实现定时器函数的对象
    //P3:表示定时器函数
    //P4:可以传入一个定时器函数一个参数，无参数可以传空nil
    //P5:表示定时器是否重复操作
    //返回值是一个新建好的定时器对象
    _timer =  [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateTimer:) userInfo:@"小明" repeats:YES];
}


//将定时器本身作为参数传入
- (void)updateTimer: (NSTimer *)timer{
    NSLog(@"Test! name = %@",timer.userInfo);
    UIView *view = [self.view viewWithTag:101];
    view.frame = CGRectMake(view.frame.origin.x-1, view.frame.origin.y-1, 100, 100);
}

- (void)timerStop{
    if(_timer != nil){
        //停止定时器
        [_timer invalidate];
    }
}

//screen is touched
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //create a UIViewController
    ViewController2 *vc2 = [[ViewController2 alloc] init];
    //显示一个视图控制器到当前屏幕
    //三个参数分别表示：
    //P1 新的视图控制器对象
    //P2 使用动画切换效果
    //P3 切换结束后功能
    [self presentViewController:vc2 animated:YES completion:nil];
}

- (void)switchTouched:(UISwitch *)sw{
    if (sw.on == YES) {
        NSLog(@"switch is on");
    }else{
        NSLog(@"switch is off");
    }
}

- (void)pressSlider:(UISlider *)slider{
    NSLog(@"slider.value=%f",slider.value);
    
}

- (void)loginPress{
    LoginViewController *login = [[LoginViewController alloc]init];
    [self presentViewController:login animated:YES completion:nil];
}

- (void)viewWillAppear:(BOOL)animated{
    
}

- (void)viewWillDisappear:(BOOL)animated{
    
}

- (void)viewDidAppear:(BOOL)animated{
    
}

- (void)viewDidDisappear:(BOOL)animated{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
