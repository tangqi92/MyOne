//
//  LikesView.m
//  MyOne
//
//  Created by HelloWorld on 8/2/15.
//  Copyright (c) 2015 melody. All rights reserved.
//

#import "LikesView.h"

@interface LikesView ()

@property (strong, nonatomic) UIButton *likesNumberBtn;

@end

@implementation LikesView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    if (self) {
        [self setUpViews];
    }

    return self;
}

- (void)setUpViews {
    [DKNightVersionManager addClassToSet:self.class];
    self.backgroundColor = [UIColor clearColor];
    self.nightBackgroundColor = [UIColor clearColor];
    // 初始化点赞 Button
    self.likesNumberBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.likesNumberBtn.titleLabel.font = systemFont(12);
    [self.likesNumberBtn setTitleColor:LikesBtnTextColor forState:UIControlStateNormal];
    self.likesNumberBtn.nightTitleColor = LikesBtnTextColor;
    UIImage *btnImage = [[UIImage imageNamed:@"home_likeBg"] stretchableImageWithLeftCapWidth:20 topCapHeight:2];
    [self.likesNumberBtn setBackgroundImage:btnImage forState:UIControlStateNormal];
    [self.likesNumberBtn setImage:[UIImage imageNamed:@"home_like"] forState:UIControlStateNormal];
    [self.likesNumberBtn setImage:[UIImage imageNamed:@"home_like_hl"] forState:UIControlStateSelected];
    self.likesNumberBtn.imageEdgeInsets = UIEdgeInsetsMake(2, 0, 0, 0);
    self.likesNumberBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [self.likesNumberBtn addTarget:self action:@selector(like) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.likesNumberBtn];
}

- (void)configureViewWithLikesNumber:(NSString *)likesNumber {
    [self.likesNumberBtn setTitle:likesNumber forState:UIControlStateNormal];
    [self.likesNumberBtn sizeToFit];
    //	NSLog(@"self.praiseNumberBtn.frame = %@", NSStringFromCGRect(self.praiseNumberBtn.frame));
    CGFloat btnWidth = CGRectGetWidth(self.likesNumberBtn.frame) + 22;
    CGRect btnFrame = CGRectMake(SCREEN_WIDTH - btnWidth, 30, btnWidth, CGRectGetHeight(self.likesNumberBtn.frame));
    self.likesNumberBtn.frame = btnFrame;
}

- (void)like {
    self.likesNumberBtn.selected = !self.likesNumberBtn.isSelected;
}

@end
