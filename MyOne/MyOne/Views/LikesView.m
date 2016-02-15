//
//  LikesView.m
//  MyOne
//
//  Created by HelloWorld on 8/2/15.
//  Copyright (c) 2015 melody. All rights reserved.
//

#import "LikesView.h"

@interface LikesView ()

@property (strong, nonatomic) UIButton *likeNumberBtn;

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
	self.likeNumberBtn = [UIButton buttonWithType:UIButtonTypeCustom];
	self.likeNumberBtn.titleLabel.font = systemFont(12);
	[self.likeNumberBtn setTitleColor:PraiseBtnTextColor forState:UIControlStateNormal];
	self.likeNumberBtn.nightTitleColor = PraiseBtnTextColor;
	UIImage *btnImage = [[UIImage imageNamed:@"home_likeBg"] stretchableImageWithLeftCapWidth:20 topCapHeight:2];
	[self.likeNumberBtn setBackgroundImage:btnImage forState:UIControlStateNormal];
	[self.likeNumberBtn setImage:[UIImage imageNamed:@"home_like"] forState:UIControlStateNormal];
	[self.likeNumberBtn setImage:[UIImage imageNamed:@"home_like_hl"] forState:UIControlStateSelected];
	self.likeNumberBtn.imageEdgeInsets = UIEdgeInsetsMake(2, 0, 0, 0);
	self.likeNumberBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [self.likeNumberBtn addTarget:self action:@selector(like) forControlEvents:UIControlEventTouchUpInside];
	[self addSubview:self.likeNumberBtn];
}

- (void)configureViewWithLikesNumber:(NSString *)likesNumber {
	[self.likeNumberBtn setTitle:likesNumber forState:UIControlStateNormal];
	[self.likeNumberBtn sizeToFit];
//	NSLog(@"self.praiseNumberBtn.frame = %@", NSStringFromCGRect(self.praiseNumberBtn.frame));
	CGFloat btnWidth = CGRectGetWidth(self.likeNumberBtn.frame) + 22;
	CGRect btnFrame = CGRectMake(SCREEN_WIDTH - btnWidth, 30, btnWidth, CGRectGetHeight(self.likeNumberBtn.frame));
	self.likeNumberBtn.frame = btnFrame;
}

- (void)like {
    self.likeNumberBtn.selected = !self.likeNumberBtn.isSelected;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
