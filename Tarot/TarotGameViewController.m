//
//  TarotGameViewController.m
//  Tarot
//
//  Created by Shijia Qian on 27/09/12.
//  Copyright (c) 2012 Shijia Qian. All rights reserved.
//

#import "TarotGameViewController.h"
#import "TarotCardView.h"
#import <QuartzCore/QuartzCore.h>
#import "TarotMainViewController.h"
#import "UIViewController+UIViewController_CurtainViewController.h"

@interface TarotGameViewController ()
{
    TarotCardView *_cardView;
    CALayer *_backViewLayer;
    BOOL _showingWords;
    UIButton *_backBtn;
}

@end

@implementation TarotGameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    self.view.backgroundColor = [UIColor colorWithRed:3.0 / 255.0 green:79.0 / 255.0 blue:130.0 / 255.0 alpha:1.0];
    _cardView = [[TarotCardView alloc] initWithFrame:CGRectInset(self.view.bounds, 10.0, 10.0)];
    _cardView.backgroundColor = [UIColor clearColor];
    
    _backViewLayer = [CALayer layer];
    _backViewLayer.backgroundColor = [UIColor clearColor].CGColor;
    _backViewLayer.frame = CGRectInset(_cardView.bounds, 22.0, 22.0);
    _backViewLayer.contents = (id)[UIImage imageNamed:@"card_back.png"].CGImage;
    [_cardView.layer addSublayer:_backViewLayer];
    
    [self.view addSubview:_cardView];
    _showingWords = NO;
    
    _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _backBtn.frame = CGRectMake(3.0, 3.0, 22.0, 22.0);
    [_backBtn setBackgroundImage:[UIImage imageNamed:@"backbtn.png"] forState:UIControlStateNormal];
    [_backBtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_backBtn];
    [super viewDidLoad];
    
    [_cardView becomeFirstResponder];
	// Do any additional setup after loading the view.
}

- (void)viewDidDisappear:(BOOL)animated
{
    [_cardView resignFirstResponder];
    [super viewDidDisappear:animated];
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

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGContextRef context = UIGraphicsGetCurrentContext();  
    [UIView beginAnimations:nil context:context];  
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationTransition: UIViewAnimationTransitionFlipFromRight forView:_cardView cache:YES];
    [UIView setAnimationDelegate:self];
    if(!_cardView.showingWords)
    {
        [_backViewLayer removeFromSuperlayer];
        [_cardView showWords];
        _cardView.showingWords = YES;
    }
    else
    {
        [_cardView hideWords];
        [_cardView.layer addSublayer:_backViewLayer];
        _cardView.showingWords = NO;
    }
    [_cardView setNeedsDisplay];
    [UIView commitAnimations];
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if(motion == UIEventSubtypeMotionShake)
    {
        if(_cardView.showingWords)
        {
            [NSThread sleepForTimeInterval:0.2];
            CGContextRef context = UIGraphicsGetCurrentContext();
            [UIView beginAnimations:nil context:context];  
            [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
            [UIView setAnimationDuration:0.5];
            [UIView setAnimationTransition: UIViewAnimationTransitionFlipFromRight forView:_cardView cache:YES];
            [UIView setAnimationDelegate:self];
            [_cardView hideWords];
            [_cardView.layer addSublayer:_backViewLayer];
            _cardView.showingWords = NO;
            [_cardView setNeedsDisplay];
            [UIView commitAnimations];
        }
    }
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    
    if(motion == UIEventSubtypeMotionShake)
    {
        [NSThread sleepForTimeInterval:0.5];
        CGContextRef context = UIGraphicsGetCurrentContext();
        [UIView beginAnimations:nil context:context];  
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationTransition: UIViewAnimationTransitionFlipFromRight forView:_cardView cache:YES];
        [UIView setAnimationDelegate:self];
        if(!_cardView.showingWords)
        {
            [_backViewLayer removeFromSuperlayer];
            [_cardView showWords];
            _cardView.showingWords = YES;
        }
        [_cardView setNeedsDisplay];
        [UIView commitAnimations];
    }
}

- (void)goBack
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:[NSBundle mainBundle]];
    TarotMainViewController *mainView = [storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
    //mainView.view.frame = self.view.frame;
    [self.view.window insertSubview:mainView.view belowSubview:self.view];
    [self curtainRevealViewControllerReverse:mainView transitionStyle:CurtainTransitionHorizontal];
    //[self performSegueWithIdentifier:@"custom_segue" sender:nil];
}

@end
