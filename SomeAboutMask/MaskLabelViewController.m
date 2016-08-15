//
//  MaskLabelViewController.m
//  SomeAboutMask
//
//  Created by liqunfei on 16/8/15.
//  Copyright © 2016年 chuchengpeng. All rights reserved.
//

#import "MaskLabelViewController.h"

@interface MaskLabelViewController ()

@property (nonatomic,strong) UILabel *bgLabel;
@property (nonatomic,strong) UILabel *bfLabel;
@property (nonatomic,strong) CALayer *maskLayer;
@property (nonatomic,strong) UIImage *maskImg;

@end

@implementation MaskLabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildUI];
    [self addMask];
}

- (void)buildUI {
    self.bgLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 50)];
    [self addLabel:self.bgLabel textColor:[UIColor redColor]];
    self.bfLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 50)];
    [self addLabel:self.bfLabel textColor:[UIColor greenColor]];
}

- (void)addLabel:(UILabel *)label textColor:(UIColor *)color {
    label.font = [UIFont boldSystemFontOfSize:50];
    label.textColor = color;
    label.text = @"Just for you";
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
}

- (void)addMask {
    self.maskLayer = [CALayer layer];
    self.maskLayer.frame = CGRectMake(0, 0, 100, 50);
    self.maskLayer.cornerRadius = 25.0;
    self.maskLayer.backgroundColor = [UIColor blackColor].CGColor;
    self.bfLabel.layer.mask = self.maskLayer;
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.bfLabel];
    CGRect rect = self.maskLayer.frame;
    rect.origin.x = point.x - rect.size.width / 2;
    self.maskLayer.frame = rect;
    [CATransaction setDisableActions:YES];
    
    
}
@end
