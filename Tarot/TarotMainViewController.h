//
//  TarotMainViewController.h
//  Tarot
//
//  Created by Shijia Qian on 26/09/12.
//  Copyright (c) 2012 Shijia Qian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TarotArticleView.h"
#import "TarotHelpView.h"

@interface TarotMainViewController : UIViewController<ArticleViewDelegate, HelpViewDelegate>
{
    UIImageView *_starView;
    UIImageView *_moonView;
}

@property (nonatomic, strong) IBOutlet UIImageView *starView;
@property (nonatomic, strong) IBOutlet UIImageView *moonView;

-(IBAction)showInfo;

@end
