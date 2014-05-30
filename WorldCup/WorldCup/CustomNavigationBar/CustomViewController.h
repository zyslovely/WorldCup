//
//  CustomViewController.h
//  CustomNavigationBarDemo
//
//  Created by jimple on 14-1-6.
//  Copyright (c) 2014年 Jimple Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CustomNaviBarView;
@interface CustomViewController : UIViewController


@property (nonatomic, retain) CustomNaviBarView *m_viewNaviBar;
- (void)bringNaviBarToTopmost;


- (void)hideNaviBar:(BOOL)bIsHide;
- (void)setNaviBarTitle:(NSString *)strTitle;
- (void)setNaviBarLeftBtn:(UIButton *)btn;
- (void)setNaviBarRightBtn:(UIButton *)btn;

- (void)naviBarAddCoverView:(UIView *)view;
- (void)naviBarAddCoverViewOnTitleView:(UIView *)view;
- (void)naviBarRemoveCoverView:(UIView *)view;

// 是否可右滑返回
- (void)navigationCanDragBack:(BOOL)bCanDragBack;


@end
