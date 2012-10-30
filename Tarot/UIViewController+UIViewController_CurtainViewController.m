//
//  UIViewController+UIViewController_CurtainViewController.m
//  Tarot
//
//  Created by Shijia Qian on 27/09/12.
//  Copyright (c) 2012 Shijia Qian. All rights reserved.
//

#import "UIViewController+UIViewController_CurtainViewController.h"
#import "TarotAppDelegate.h"

@implementation UIViewController (UIViewController_CurtainViewController)

- (UIImage *)imageWithView:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.frame.size, view.opaque, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

- (void)curtainRevealViewController:(UIViewController *)viewControllerToReveal transitionStyle:(CurtainTransitionStyle)transitionStyle
{
    TarotAppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    
    UIImage *selfPortrait = [self imageWithView:appDelegate.window];
    UIImage *controllerScreenshot = [self imageWithView:viewControllerToReveal.view];
    
    UIView *coverView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, selfPortrait.size.width, selfPortrait.size.height)];
    coverView.backgroundColor = [UIColor blackColor];
    [appDelegate.window addSubview:coverView];
    
    int offset = 20;
    if (controllerScreenshot.size.height == [UIScreen mainScreen].bounds.size.height) {
        offset = 0;
    }
    
    float padding = appDelegate.window.bounds.size.width * 0.1;
    
    UIImageView *fadedView = [[UIImageView alloc] initWithFrame:CGRectMake(padding, padding + offset, controllerScreenshot.size.width - padding * 2, controllerScreenshot.size.height - padding * 2 - 20)];
    fadedView.image = controllerScreenshot;
    fadedView.alpha = 0.4;
    [coverView addSubview:fadedView];
    
    UIImageView *leftCurtain = [[UIImageView alloc] initWithFrame:CGRectNull];
    leftCurtain.image = selfPortrait;
    leftCurtain.clipsToBounds = YES;
    
    UIImageView *rightCurtain = [[UIImageView alloc] initWithFrame:CGRectNull];
    rightCurtain.image = selfPortrait;
    rightCurtain.clipsToBounds = YES;
    
    if (transitionStyle == CurtainTransitionHorizontal) {
        leftCurtain.contentMode = UIViewContentModeLeft;
        leftCurtain.frame = CGRectMake(0, 0, selfPortrait.size.width / 2, selfPortrait.size.height);
        rightCurtain.contentMode = UIViewContentModeRight;
        rightCurtain.frame = CGRectMake(selfPortrait.size.width / 2, 0, selfPortrait.size.width / 2, selfPortrait.size.height);
    } else {
        leftCurtain.contentMode = UIViewContentModeTop;
        leftCurtain.frame = CGRectMake(0, 0, selfPortrait.size.width, selfPortrait.size.height / 2);
        rightCurtain.contentMode = UIViewContentModeBottom;
        rightCurtain.frame = CGRectMake(0, selfPortrait.size.height / 2, selfPortrait.size.width, selfPortrait.size.height / 2);
    }
    
    [coverView addSubview:leftCurtain];
    [coverView addSubview:rightCurtain];
    
    [UIView animateWithDuration:0.7 delay:0 options:UIViewAnimationCurveEaseIn animations:^{
        if (transitionStyle == CurtainTransitionHorizontal) {
            leftCurtain.frame = CGRectMake(- selfPortrait.size.width / 2, 0, selfPortrait.size.width / 2, selfPortrait.size.height);
            rightCurtain.frame = CGRectMake(selfPortrait.size.width, 0, selfPortrait.size.width / 2, selfPortrait.size.height);
        } else {
            leftCurtain.frame = CGRectMake(0, - selfPortrait.size.height / 2, selfPortrait.size.width, selfPortrait.size.height / 2);
            rightCurtain.frame = CGRectMake(0, selfPortrait.size.height, selfPortrait.size.width, selfPortrait.size.height / 2);
        }
    } completion:nil];
    
    [UIView animateWithDuration:0.3 delay:0.5 options:UIViewAnimationCurveEaseIn animations:^{
        fadedView.frame = CGRectMake(0, offset, controllerScreenshot.size.width, controllerScreenshot.size.height);
        fadedView.alpha = 1;
    } completion:^(BOOL finished){
        TarotAppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
        appDelegate.window.rootViewController = viewControllerToReveal;
        [leftCurtain removeFromSuperview];
        [rightCurtain removeFromSuperview];
        [fadedView removeFromSuperview];
        [coverView removeFromSuperview];
    }];
}

- (void)curtainRevealViewControllerReverse:(UIViewController *)viewControllerToReveal transitionStyle:(CurtainTransitionStyle)transitionStyle
{
    TarotAppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    
    UIImage *selfPortrait = [self imageWithView:appDelegate.window];
    UIImage *controllerScreenshot = [self imageWithView:viewControllerToReveal.view];
    
    UIView *coverView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, selfPortrait.size.width, selfPortrait.size.height)];
    coverView.backgroundColor = [UIColor blackColor];
    [appDelegate.window addSubview:coverView];
    
    float padding = appDelegate.window.bounds.size.width * 0.1;
    
    UIImageView *fadedView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, selfPortrait.size.width, selfPortrait.size.height)];
    fadedView.image = selfPortrait;
    [coverView addSubview:fadedView];
    
    UIImageView *leftCurtain = [[UIImageView alloc] initWithFrame:CGRectNull];
    leftCurtain.image = controllerScreenshot;
    leftCurtain.clipsToBounds = YES;
    
    UIImageView *rightCurtain = [[UIImageView alloc] initWithFrame:CGRectNull];
    rightCurtain.image = controllerScreenshot;
    rightCurtain.clipsToBounds = YES;
    
    if (transitionStyle == CurtainTransitionHorizontal) {
        leftCurtain.contentMode = UIViewContentModeLeft;
        leftCurtain.frame = CGRectMake(- selfPortrait.size.width / 2, 10, selfPortrait.size.width / 2, selfPortrait.size.height);
        rightCurtain.contentMode = UIViewContentModeRight;
        rightCurtain.frame = CGRectMake(selfPortrait.size.width, 10, selfPortrait.size.width / 2, selfPortrait.size.height);
    } else {
        leftCurtain.contentMode = UIViewContentModeTop;
        leftCurtain.frame = CGRectMake(0, 0, selfPortrait.size.width, selfPortrait.size.height / 2);
        rightCurtain.contentMode = UIViewContentModeBottom;
        rightCurtain.frame = CGRectMake(0, selfPortrait.size.height / 2, selfPortrait.size.width, selfPortrait.size.height / 2);
    }
    
    [coverView addSubview:leftCurtain];
    [coverView addSubview:rightCurtain];
    
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationCurveEaseIn animations:^{
        fadedView.frame = CGRectMake(padding, padding, selfPortrait.size.width - padding * 2, selfPortrait.size.height - padding * 2);
        fadedView.alpha = 0.4;
    } completion:nil];
    
    [UIView animateWithDuration:0.7 delay:0.5 options:UIViewAnimationCurveEaseIn animations:^{
        if (transitionStyle == CurtainTransitionHorizontal) {
            leftCurtain.frame = CGRectMake(0, 10, selfPortrait.size.width / 2, selfPortrait.size.height);
            rightCurtain.frame = CGRectMake(selfPortrait.size.width / 2, 10, selfPortrait.size.width / 2, selfPortrait.size.height);
        } else {
            leftCurtain.frame = CGRectMake(0, - selfPortrait.size.height / 2, selfPortrait.size.width, selfPortrait.size.height / 2);
            rightCurtain.frame = CGRectMake(0, selfPortrait.size.height, selfPortrait.size.width, selfPortrait.size.height / 2);
        }
    } completion:^(BOOL finished){
        TarotAppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
        appDelegate.window.rootViewController = viewControllerToReveal;
        [leftCurtain removeFromSuperview];
        [rightCurtain removeFromSuperview];
        [fadedView removeFromSuperview];
        [coverView removeFromSuperview];
    }];
    
    
}

@end
