//
//  MyTabBar.m
//  SimpleTabbarController
//
//  Created by 宋文涛 on 2019/9/2.
//  Copyright © 2019 songwentao. All rights reserved.
//

#import "MyTabBar.h"
#import "UIView+Frame.h"

#define AddButtonMargin 15

@interface MyTabBar ()

@property (nonatomic, weak) UIButton *addButton;

@property (nonatomic, weak) UILabel *addLabel;
@end

@implementation MyTabBar

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        UIButton *addBtn = [[UIButton alloc]init];
        [addBtn setBackgroundColor:[UIColor orangeColor]];
        [addBtn addTarget:self action:@selector(addBtnDidClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:addBtn];
        self.addButton = addBtn;
    }
    return self;
}

//中间按钮的点击事件
- (void)addBtnDidClick:(MyTabBar *)tabBar {
    [self.myTabBarDelegate addButtonClick:self];
}

- (void)layoutSubviews {
    [super layoutSubviews];

    //去掉上部的横线
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[UIImageView class]] && view.bounds.size.height <= 1) {
            UIImageView *line = (UIImageView *)view;
            line.hidden = YES;
        }
    }

    self.addButton.centerX = self.centerX;
    self.addButton.centerY = self.height / 2 - 1.5 * AddButtonMargin;
    self.addButton.size = CGSizeMake(60, 60); //CGSizeMake(self.addButton.currentBackgroundImage.size.width, self.addButton.currentBackgroundImage.size.height);

    UILabel *addlbl = [[UILabel alloc]init];
    addlbl.text = @"添加";
    addlbl.font = [UIFont systemFontOfSize:15];
    addlbl.textColor = [UIColor grayColor];
    [addlbl sizeToFit];

    addlbl.centerX = self.addButton.centerX;
    addlbl.centerY = CGRectGetMaxY(self.addButton.frame) + 0.5 * AddButtonMargin + 0.5;
    [self addSubview:addlbl];
    self.addLabel = addlbl;

    int btnIndex = 0;

    Class class = NSClassFromString(@"UITabBarButton");
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:class]) {
            view.width = self.width / 3;
            view.x = view.width * btnIndex;
            btnIndex++;
            if (btnIndex == 1) {
                btnIndex++;
            }
        }
    }
    [self bringSubviewToFront:self.addButton];
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (self.hidden == NO) {
        CGPoint newPoint = [self convertPoint:point toView:self.addButton];
        CGPoint pointL = [self convertPoint:point toView:self.addLabel];
        if ([self.addButton pointInside:newPoint withEvent:event]) {
            return self.addButton;
        } else if ([self.addLabel pointInside:pointL withEvent:event]) {
            return self.addButton;
        } else {
            return [super hitTest:point withEvent:event];
        }
    } else {
        return [super hitTest:point withEvent:event];
    }
}

@end
