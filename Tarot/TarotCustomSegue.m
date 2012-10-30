//
//  TarotCustomSegue.m
//  Tarot
//
//  Created by Shijia Qian on 28/09/12.
//  Copyright (c) 2012 Shijia Qian. All rights reserved.
//

#import "TarotCustomSegue.h"
#import "UIViewController+UIViewController_CurtainViewController.h"
#import "TarotMainViewController.h"

@implementation TarotCustomSegue

- (void)perform
{
    UIViewController *sourceViewController = self.sourceViewController;
    UIViewController *destViewController = self.destinationViewController;
    [sourceViewController curtainRevealViewController:destViewController transitionStyle:CurtainTransitionHorizontal];
}

@end
