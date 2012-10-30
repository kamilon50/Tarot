//
//  TarotMainViewController.m
//  Tarot
//
//  Created by Shijia Qian on 26/09/12.
//  Copyright (c) 2012 Shijia Qian. All rights reserved.
//

#import "TarotMainViewController.h"
#import "TarotGameViewController.h"
#import "UIViewController+UIViewController_CurtainViewController.h"

@interface TarotMainViewController ()
{
    NSTimer *_timer;
    TarotArticleView *_articleView;
    TarotHelpView *_helpView;
}

@end

@implementation TarotMainViewController
@synthesize starView = _starView;
@synthesize moonView = _moonView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    //self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"main_bg.png"]];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    _timer = [NSTimer  scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(twinkleStar) userInfo:nil repeats:YES];
    [super viewWillAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    _helpView = nil;
    _articleView = nil;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [_timer invalidate];
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)twinkleStar
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelay:0.2];
    [UIView setAnimationDuration:0.2];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(starStopAnim)];
    _starView.frame = CGRectInset(_starView.frame, 3, 3);
    [UIView commitAnimations];
}

- (void)starStopAnim
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.2];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    _starView.frame = CGRectInset(_starView.frame, -3, -3);
    [UIView commitAnimations];
}

- (IBAction)showInfo
{
    if(_articleView == nil)
    {
        _articleView = [[TarotArticleView alloc] initWithFrame:CGRectInset(self.view.bounds, 15.0, 15.0)];  
    }
    _articleView.delegate = self;
    _articleView.alpha = 0.0;
    [self.view addSubview:_articleView];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.7];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    _articleView.alpha = 1.0;
    [UIView commitAnimations];
}

- (IBAction)showHelp
{
    if(_helpView == nil)
    {
        _helpView = [[TarotHelpView alloc] initWithFrame:CGRectInset(self.view.bounds, 15.0, 15.0)];
    }
    _helpView.delegate = self;
    _helpView.alpha = 0.0;
    [self.view addSubview:_helpView];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.7];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    _helpView.alpha = 1.0;
    [UIView commitAnimations];
}

- (void)closeArticleView
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.7];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(closeHelpViewAnimationStop)];
    _articleView.alpha = 0.0;
    [UIView commitAnimations];
}

- (void)closeArticleViewAnimationStop
{
    [_articleView removeFromSuperview];
}

- (void)closeHelpView
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.7];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(closeArticleViewAnimationStop)];
    _helpView.alpha = 0.0;
    [UIView commitAnimations];
}

- (void)closeHelpViewAnimationStop
{
    [_helpView removeFromSuperview];
}

@end
