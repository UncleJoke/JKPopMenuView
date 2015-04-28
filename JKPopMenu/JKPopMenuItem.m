//
//  JKPopMenuItem.m
//  
//
//  Created by Bingjie on 14/12/15.
//  Copyright (c) 2015年 Bingjie. All rights reserved.
//

#import "JKPopMenuItem.h"

@interface JKPopMenuItem ()

@property (nonatomic, strong) UIImageView  *imageView;
@property (nonatomic, strong) UILabel      *titleLabel;
@end

@implementation JKPopMenuItem

+ (instancetype)item
{
    JKPopMenuItem *item = [[JKPopMenuItem alloc]init];
    return item;
}

+ (instancetype)itemWithTitle:(NSString*)title image:(UIImage*)image
{
    JKPopMenuItem *item = [[JKPopMenuItem alloc]init];
    item.title = title;
    item.icon = image;
    return item;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (void)setIcon:(UIImage *)icon
{
    _icon = icon;
    self.imageView.image = _icon;
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    self.titleLabel.text = _title;
}

- (void)setTextColor:(UIColor *)textColor
{
    _textColor = textColor;
    self.titleLabel.textColor = _textColor;
}

- (void)setupSubviews
{
    _imageView = [[UIImageView alloc]init];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:_imageView];
    _imageView.image = self.icon;
    
    _titleLabel = [[UILabel alloc]init];
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.font  = [UIFont boldSystemFontOfSize:14];
    _titleLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:_titleLabel];
    _titleLabel.text = self.title;
    
    [_imageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_titleLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    NSDictionary *dict1 = NSDictionaryOfVariableBindings(_imageView,_titleLabel);
    
    
    NSArray *vfls = @[
                      @"H:|-0-[_imageView]-0-|",
                      @"H:|-0-[_titleLabel]-0-|",
                      @"V:|-0-[_imageView]-5-[_titleLabel(20)]-0-|"
                      ];
    
    for (NSString *vlf in vfls) {
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vlf
                                                                                 options:0
                                                                                 metrics:nil
                                                                                   views:dict1]];
    }
}

@end
