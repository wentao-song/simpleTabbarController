//
//  MyTabBar.h
//  SimpleTabbarController
//
//  Created by 宋文涛 on 2019/9/2.
//  Copyright © 2019 songwentao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class MyTabBar;
@protocol MyTabBarDelegate <NSObject>

-(void)addButtonClick:(MyTabBar*)tabBar;

@end

@interface MyTabBar : UITabBar


@property (nonatomic,weak)id<MyTabBarDelegate>myTabBarDelegate;


@end

NS_ASSUME_NONNULL_END
