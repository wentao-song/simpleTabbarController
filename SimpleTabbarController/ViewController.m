//
//  ViewController.m
//  SimpleTabbarController
//
//  Created by 宋文涛 on 2019/9/2.
//  Copyright © 2019 songwentao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    for (int i = 0; i<10; i++) {
     NSString *nun = [self generateTradeNO];
        NSLog(@"%@", nun);
    }
    // Do any additional setup after loading the view.
}


- (NSString *)generateTradeNO{
    static int kNumber = 15;
    NSString *sourceStr = @"01234567890001110001";
    NSMutableString *resultStr = [[NSMutableString alloc] init];
    srand((unsigned)time(0));
    for (int i = 0; i < kNumber; i++)
    {
        unsigned index = rand() % [sourceStr length];
        NSString *oneStr = [sourceStr substringWithRange:NSMakeRange(index, 1)];
        [resultStr appendString:oneStr];
    }
    return resultStr;
    
}


@end
