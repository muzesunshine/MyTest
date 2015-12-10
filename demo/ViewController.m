//
//  ViewController.m
//  demo
//
//  Created by 姚家褀 on 15/10/16.
//  Copyright (c) 2015年 姚家褀. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSString *num;
}
@property (nonatomic , retain) NSDictionary *change;
@property (nonatomic , retain) NSTimer *timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    num = @"11";
    _change = @{@"new" : num , @"old" : num};


}
- (void)viewDidAppear:(BOOL)animated{
[self addObserver:self forKeyPath:@"num" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
   _timer =  [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(action) userInfo:nil repeats:NO];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    _change = change;
    NSLog(@"chang = %@",change);
    
}
- (IBAction)buttonAction:(id)sender {
    [self setValue:@"22" forKey:@"num"];
}

- (void)action{
    [self removeObserver:self forKeyPath:@"num"];
    [_timer invalidate];
    NSString *num2 = [_change valueForKey:@"new"];
    NSString *num3 = [_change valueForKey:@"old"];
    if(![num2 isEqualToString:num3]){
        NSLog(@"num3 = %@  , num2 = %@ , change = %@ , 想干啥干啥",num3 , num2 , _change);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
