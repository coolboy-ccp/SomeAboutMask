//
//  MaskImageViewController.m
//  SomeAboutMask
//
//  Created by liqunfei on 16/8/15.
//  Copyright © 2016年 chuchengpeng. All rights reserved.
//

#import "MaskImageViewController.h"

@interface MaskImageViewController ()

@property (nonatomic,strong) UIImageView *grayImgView;
@property (nonatomic,strong) UIImageView *colorImgView;
@property (nonatomic,strong) UIImage *maskImg;
@property (nonatomic,strong) CALayer *maskLayer;

@end

@implementation MaskImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addImgView];
    [self addMaskLayer];
}

- (void)addImgView {
    self.grayImgView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    self.colorImgView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    self.grayImgView.image = [UIImage imageNamed:@"jobs_gray"];
    self.colorImgView.image = [UIImage imageNamed:@"jobs_color"];
    [self.view addSubview:self.grayImgView];
    [self.view addSubview:self.colorImgView];
}

- (void)addMaskLayer {
    self.maskImg = [UIImage imageNamed:@"mask_image"];
    self.maskLayer = [CALayer layer];
    self.maskLayer.frame = CGRectMake(0, 0, self.maskImg.size.width, self.maskImg.size.height);
    self.maskLayer.contents = (__bridge id _Nullable)(self.maskImg.CGImage);
    self.maskLayer.position = self.view.center;
    self.colorImgView.layer.mask = self.maskLayer;
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    [CATransaction setDisableActions:YES];
    self.maskLayer.position = [touch locationInView:self.view];
}

@end
