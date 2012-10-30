//
//  TarotArticleView.m
//  Tarot
//
//  Created by Shijia Qian on 26/10/12.
//  Copyright (c) 2012 Shijia Qian. All rights reserved.
//

#import "TarotArticleView.h"

@interface TarotArticleView()
{
    UITextView *articleText;
    UILabel *articleTitle;
    UIImageView *backImg;
    UIButton *closeBtn;
}
@end

@implementation TarotArticleView

@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        backImg = [[UIImageView alloc] initWithFrame:self.bounds];
        backImg.image = [UIImage imageNamed:@"yellow_paper.png"];
        [self addSubview:backImg];
        
        articleTitle = [[UILabel alloc] initWithFrame:CGRectMake(15.0, 15.0, frame.size.width - 15.0, 40.0)];
        articleTitle.textAlignment = NSTextAlignmentCenter;
        articleTitle.font = [UIFont fontWithName:NSLocalizedString(@"font_family", nil) size:30];
        articleTitle.text = NSLocalizedString(@"app_name", nil);
        articleTitle.backgroundColor = [UIColor clearColor];
        [self addSubview:articleTitle];
        
        articleText = [[UITextView alloc] initWithFrame:CGRectMake(15.0, 10.0 + articleTitle.frame.size.height + 10.0, articleTitle.frame.size.width, 300.0)];
        articleText.backgroundColor = [UIColor clearColor];
        articleText.font = [UIFont fontWithName:NSLocalizedString(@"font_family", nil) size:18];
        articleText.text = NSLocalizedString(@"article", nil);
        articleText.editable = NO;
        [self addSubview:articleText];
        
        closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        closeBtn.frame = CGRectMake(10.0, 10.0, 25.0, 25.0);
        [closeBtn setBackgroundImage:[UIImage imageNamed:@"closebtn.png"] forState:UIControlStateNormal];
        [closeBtn addTarget:self action:@selector(closeArticle) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:closeBtn];
        
    }
    return self;
}

- (void)closeArticle
{
    [delegate closeArticleView];
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
