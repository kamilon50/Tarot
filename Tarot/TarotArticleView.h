//
//  TarotArticleView.h
//  Tarot
//
//  Created by Shijia Qian on 26/10/12.
//  Copyright (c) 2012 Shijia Qian. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ArticleViewDelegate <NSObject>

-(void)closeArticleView;

@end

@interface TarotArticleView : UIView
{
    id<ArticleViewDelegate> delegate;
}

@property (nonatomic, strong) id<ArticleViewDelegate> delegate;

@end
