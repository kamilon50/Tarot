//
//  TarotCardView.h
//  Tarot
//
//  Created by Shijia Qian on 28/09/12.
//  Copyright (c) 2012 Shijia Qian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TarotCardView : UIView
{
    BOOL showingWords;
}

@property (assign) BOOL showingWords;

-(void)showWords;
-(void)hideWords;

@end
