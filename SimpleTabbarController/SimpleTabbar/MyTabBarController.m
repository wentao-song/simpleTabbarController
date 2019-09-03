//
//  MyTabBarController.m
//  SimpleTabbarController
//
//  Created by 宋文涛 on 2019/9/2.
//  Copyright © 2019 songwentao. All rights reserved.
//

#import "MyTabBarController.h"
#import "MyTabBar.h"
@interface MyTabBarController ()<MyTabBarDelegate>

@end

@implementation MyTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    UIImage *listActive = [UIImage imageNamed:@""];
    UITabBarItem *listItem = self.tabBar.items[0];
    
    listItem.selectedImage = [listActive imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIImage *chartActive = [UIImage imageNamed:@""];
    UITabBarItem *chartItem = self.tabBar.items[1];
    
    chartItem.selectedImage = [chartActive imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    MyTabBar *myTabBar = [[MyTabBar alloc]init];
    myTabBar.myTabBarDelegate = self;
    //利用kvo替换默认的TabBar
    [self setValue:myTabBar forKey:@"tabBar"];
    
}


-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.tabBar.tintColor = [UIColor colorWithRed:89/255 green:215/255 blue:247/255 alpha:1];
}


#pragma mark - MyTabBarDelegate
-(void)addButtonClick:(MyTabBar *)tabBar{
    UIAlertController *alterController = [UIAlertController alertControllerWithTitle:@"test" message:@"tabBar测试" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alterController addAction:action];
    [self presentViewController:alterController animated:YES completion:^{
        
    }];
}



@end
