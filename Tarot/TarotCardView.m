//
//  TarotCardView.m
//  Tarot
//
//  Created by Shijia Qian on 28/09/12.
//  Copyright (c) 2012 Shijia Qian. All rights reserved.
//

#import "TarotCardView.h"
#import <QuartzCore/QuartzCore.h>

@interface TarotCardView()
{
    UILabel *_title;
    UITextView *_guidanceWords;
}
@end

@implementation TarotCardView

@synthesize showingWords;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        showingWords = NO;
        [self initTitleAndContent];
    }
    return self;
}

- (void)initTitleAndContent
{
    _title = [[UILabel alloc] initWithFrame:CGRectMake(15.0, 40.0, self.bounds.size.width - 30.0, 35.0)];
    _title.textAlignment = UITextAlignmentCenter;
    _title.backgroundColor = [UIColor clearColor];
    
    _guidanceWords = [[UITextView alloc] initWithFrame:CGRectMake(15.0, 40.0 + _title.bounds.size.height, self.bounds.size.width - 30.0, CGRectGetMaxY(self.bounds) - 60.0)];
    _guidanceWords.textAlignment = UITextAlignmentCenter;
    _guidanceWords.backgroundColor = [UIColor clearColor];
    _guidanceWords.userInteractionEnabled = NO;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGRect drawRect = CGRectInset(rect, 10.0, 10.0);
    UIColor *shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.4];
    UIColor *borderColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.25];
    
    UIColor *fillColor = nil;
    if(showingWords)
    {
        fillColor = [UIColor colorWithRed:116.0/255.0 green:186.0/255.0 blue:175.0/255.0 alpha:1.0];
    }
    else
    {
        fillColor = [UIColor whiteColor];
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, CGRectGetMidX(drawRect), CGRectGetMinY(drawRect));
    CGPathAddArcToPoint(path, NULL, CGRectGetMaxX(drawRect), CGRectGetMinY(drawRect), CGRectGetMaxX(drawRect), CGRectGetMaxY(drawRect), 20.0);
    CGPathAddArcToPoint(path, NULL, CGRectGetMaxX(drawRect), CGRectGetMaxY(drawRect), CGRectGetMinX(drawRect), CGRectGetMaxY(drawRect), 20.0);
    CGPathAddArcToPoint(path, NULL, CGRectGetMinX(drawRect), CGRectGetMaxY(drawRect), CGRectGetMinX(drawRect), CGRectGetMinY(drawRect), 20.0);
    CGPathAddArcToPoint(path, NULL, CGRectGetMinX(drawRect), CGRectGetMinY(drawRect), CGRectGetMidX(drawRect), CGRectGetMinY(drawRect), 20.0);
    CGContextAddPath(context, path);
    CGContextSetShadowWithColor(context, CGSizeMake(5, 5), 3.0, [shadowColor CGColor]);
    CGContextSetFillColorWithColor(context, [fillColor CGColor]);
    CGContextFillPath(context);
    CGPathRelease(path);
    CGContextRestoreGState(context);
    
    if(showingWords)
    {
        CGContextSaveGState(context);
        
        //Draw a line at the bottom of the title
        CGContextSetStrokeColorWithColor(context, borderColor.CGColor);
        CGContextSetLineWidth(context, 1.0);
        CGContextSetLineCap(context, kCGLineCapRound);
        CGContextMoveToPoint(context, 67.0, 80.0);
        CGContextAddLineToPoint(context, 235.0, 80.0);
        CGContextStrokePath(context);
        
        CGContextSetStrokeColorWithColor(context, borderColor.CGColor);
        CGContextSetLineWidth(context, 1.0);
        CGContextSetLineCap(context, kCGLineCapRound);
        CGContextMoveToPoint(context, 67.0, rect.size.height - 25.0);
        CGContextAddLineToPoint(context, 235.0, rect.size.height - 25.0);
        CGContextStrokePath(context);
        
        CGContextRestoreGState(context);
    }
}

- (int)getRandomNumber
{
    return arc4random() % 56 + 1;
}

- (void)showWords
{
    showingWords = YES;
    int randNum = [self getRandomNumber];
    NSString *titleId = [NSString stringWithFormat:@"title_%d", randNum];
    NSString *contentId = [NSString stringWithFormat:@"content_%d", randNum];
    if(NSLocalizedString(titleId, nil).length <=11)
    {
        [_title setFont:[UIFont fontWithName:NSLocalizedString(@"font_family", nil) size:30]];
    }
    else if(NSLocalizedString(titleId, nil).length > 11 && NSLocalizedString(@"title_11", nil).length <= 16)
    {
        [_title setFont:[UIFont fontWithName:NSLocalizedString(@"font_family", nil) size:24]];
    }
    else
    {
        _title.frame = CGRectMake(18.0, 25.0, self.frame.size.width - 35.0, 60.0);
        _title.numberOfLines = 2;
        [_title setFont:[UIFont fontWithName:NSLocalizedString(@"font_family", nil) size:19]];
    }
    _title.text = NSLocalizedString(titleId, nil);
    
    if(NSLocalizedString(contentId, nil).length <= 100)
    {
        [_guidanceWords setFont:[UIFont fontWithName:NSLocalizedString(@"font_family", nil) size:22]];
    }
    else if(NSLocalizedString(contentId, nil).length <= 185)
    {
        [_guidanceWords setFont:[UIFont fontWithName:NSLocalizedString(@"font_family", nil) size:20]];
    }
    else if(NSLocalizedString(contentId, nil).length <= 245)
    {
        [_guidanceWords setFont:[UIFont fontWithName:NSLocalizedString(@"font_family", nil) size:18]];
    }
    else
    {
        [_guidanceWords setFont:[UIFont fontWithName:NSLocalizedString(@"font_family", nil) size:16]];
    }
    _guidanceWords.text = NSLocalizedString(contentId, nil);
    
    if(_title.superview == nil)
    {
        [self addSubview:_title];
        [self addSubview:_guidanceWords];
    }
}

- (void)hideWords
{
    showingWords = NO;
    [_title removeFromSuperview];
    [_guidanceWords removeFromSuperview];
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

@end
