//
//  UIViewController+UIViewController_CurtainViewController.h
//  Tarot
//
//  Created by Shijia Qian on 27/09/12.
//  Copyright (c) 2012 Shijia Qian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

typedef enum _CurtainTransitionStyle {
	CurtainTransitionHorizontal = 0,
    CurtainTransitionVertical = 1
} CurtainTransitionStyle;

@interface UIViewController (UIViewController_CurtainViewController)

- (void)curtainRevealViewController:(UIViewController *)viewControllerToReveal transitionStyle:(CurtainTransitionStyle)transitionStyle;

- (void)curtainRevealViewControllerReverse:(UIViewController *)viewControllerToReveal transitionStyle:(CurtainTransitionStyle)transitionStyle;

@end
