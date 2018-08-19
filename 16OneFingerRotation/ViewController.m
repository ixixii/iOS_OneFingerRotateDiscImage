//
//  ViewController.m
//  16OneFingerRotation
//
//  Created by beyond on 2018/1/2.
//  Copyright © 2018年 beyond. All rights reserved.
//

#import "ViewController.h"
#import "KTOneFingerRotationGestureRecognizer.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self addOneTapGuesture];
}
- (void)addOneTapGuesture
{
    self.postImgView.userInteractionEnabled = YES;
    
    
    // 海报
    [self addRotationGestureToView:self.postImgView];
    [self addTapGestureToView:self.postImgView numberOfTaps:1];
    
    
    
}


- (void)addRotationGestureToView:(UIView *)view
{
    KTOneFingerRotationGestureRecognizer *rotation = [[KTOneFingerRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotatingGuestureReco:)];
    [view addGestureRecognizer:rotation];
    
}

- (void)addTapGestureToView:(UIView *)view numberOfTaps:(NSInteger)numberOfTaps
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedGuestureReco:)];
    [tap setNumberOfTapsRequired:numberOfTaps];
    [view addGestureRecognizer:tap];
    
}

- (void)rotatingGuestureReco:(KTOneFingerRotationGestureRecognizer *)recognizer
{
    UIView *view = [recognizer view];
    [view setTransform:CGAffineTransformRotate([view transform], [recognizer rotation])];
    
    
    // 唱片
     [self.cycleImgView setTransform:CGAffineTransformRotate([view transform], [recognizer rotation])];
}

- (void)tappedGuestureReco:(UITapGestureRecognizer *)recognizer
{
    UIView *view = [recognizer view];
    [view setTransform:CGAffineTransformMakeRotation(0)];
    
    // 唱片
    [self.cycleImgView setTransform:CGAffineTransformMakeRotation(0)];
}


@end
