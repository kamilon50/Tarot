//
//  TarotHelpView.m
//  Tarot
//
//  Created by Shijia Qian on 26/10/12.
//  Copyright (c) 2012 Shijia Qian. All rights reserved.
//

#import "TarotHelpView.h"

@interface TarotHelpView()
{
    UIImageView *backView;
    UILabel *title;
    UITextView *howToUseView;
    UIButton *closeBtn;
}

@end

@implementation TarotHelpView

@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        backView = [[UIImageView alloc] initWithFrame:self.bounds];
        backView.image = [UIImage imageNamed:@"yellow_paper.png"];
        [self addSubview:backView];
        
        title = [[UILabel alloc] initWithFrame:CGRectMake(15.0, 15.0, frame.size.width - 15.0, 40.0)];
        title.textAlignment = NSTextAlignmentCenter;
        title.font = [UIFont fontWithName:NSLocalizedString(@"font_family", nil) size:30];
        title.text = NSLocalizedString(@"help_view_title", nil);
        title.backgroundColor = [UIColor clearColor];
        [self addSubview:title];
        
        howToUseView = [[UITextView alloc] initWithFrame:CGRectMake(15.0, 10.0 + title.frame.size.height + 10.0, title.frame.size.width, 300.0)];
        howToUseView.backgroundColor = [UIColor clearColor];
        howToUseView.font = [UIFont fontWithName:NSLocalizedString(@"font_family", nil) size:18];
        howToUseView.text = NSLocalizedString(@"how_to_use", nil);
        howToUseView.editable = NO;
        [self addSubview:howToUseView];
        
        closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        closeBtn.frame = CGRectMake(10.0, 10.0, 25.0, 25.0);
        [closeBtn setBackgroundImage:[UIImage imageNamed:@"closebtn.png"] forState:UIControlStateNormal];
        [closeBtn addTarget:self action:@selector(closeHelpView) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:closeBtn];

    }
    return self;
}

- (void)closeHelpView
{
    [delegate closeHelpView];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
