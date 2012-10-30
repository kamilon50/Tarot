//
//  TarotHelpView.h
//  Tarot
//
//  Created by Shijia Qian on 26/10/12.
//  Copyright (c) 2012 Shijia Qian. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HelpViewDelegate <NSObject>

-(void)closeHelpView;

@end

@interface TarotHelpView : UIView

@property (nonatomic, strong) id<HelpViewDelegate> delegate;

@end
