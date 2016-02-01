//
//  ViewController.m
//  MagicAnimationDemo
//
//  Created by 吴玉铁 on 16/2/1.
//  Copyright © 2016年 铁哥. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    UILabel *_threeDCopy;
}

@property (weak, nonatomic) IBOutlet UILabel *threeDLabel;
@property (weak, nonatomic) IBOutlet UIImageView *bgView;
@property (weak, nonatomic) IBOutlet UIImageView *airView;
@property (weak, nonatomic) IBOutlet UIImageView *backAir;
@property (weak, nonatomic) IBOutlet UIImageView *lastAir;




@end

@implementation ViewController

- (IBAction)swipeAction:(id)sender {
    //label伪3D
    [UIView animateWithDuration:1.0 animations:^{
        _threeDLabel.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1.0, 0.5), CGAffineTransformMakeTranslation(1.0, -_threeDLabel.frame.size.height / 2));
        _threeDLabel.alpha = 0;
        _threeDCopy.alpha = 1;
        _threeDCopy.transform = CGAffineTransformIdentity;
    }];
    
    
    [UIView transitionWithView:_bgView duration:1.0 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        _bgView.image = [UIImage imageNamed:@"2.jpg"];
    } completion:^(BOOL finished) {
        
    }];
    
    CGAffineTransform zoomInScaleTransform = CGAffineTransformMakeScale(0.2, 0.2);
    [UIView animateKeyframesWithDuration:3.0 delay:0 options:UIViewKeyframeAnimationOptionLayoutSubviews animations:^{
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.2 animations:^{
            _airView.center = CGPointMake(_airView.center.x + self.view.frame.size.width, _airView.center.y - 180);
            _airView.transform = zoomInScaleTransform;
        }];
        [UIView addKeyframeWithRelativeStartTime:0.3 relativeDuration:0.01 animations:^{
            _backAir.alpha = 1;
            _backAir.transform = zoomInScaleTransform;
        }];
        [UIView addKeyframeWithRelativeStartTime:0.3 relativeDuration:0.5 animations:^{
            
            _backAir.center = CGPointMake(_backAir.center.x - 320, _backAir.center.y + 90);
            _backAir.transform = CGAffineTransformIdentity;
        }];
        [UIView addKeyframeWithRelativeStartTime:0.9 relativeDuration:0.01 animations:^{
            _lastAir.alpha = 1.0;
        }];
        [UIView addKeyframeWithRelativeStartTime:0.9 relativeDuration:0.2 animations:^{
            _lastAir.center = CGPointMake(_lastAir.center.x + 48, _lastAir.center.y);
        }];
        
    } completion:^(BOOL finished) {
        _airView.hidden = YES;
        _backAir.hidden = YES;
        _lastAir.hidden = YES;
    }];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _threeDCopy = [[UILabel alloc]init];
    _threeDCopy.frame = _threeDLabel.frame;
    _threeDCopy.alpha = 0;
    _threeDCopy.text = _threeDLabel.text;
    _threeDCopy.font = _threeDLabel.font;
    _threeDCopy.textAlignment = _threeDLabel.textAlignment;
    _threeDCopy.textColor = _threeDLabel.textColor;
    _threeDCopy.backgroundColor = [UIColor clearColor];
    _threeDCopy.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1.0, 0.1), CGAffineTransformMakeTranslation(1.0, _threeDCopy.frame.size.height / 2));
    [self.view addSubview:_threeDCopy];
    
    _airView.transform = CGAffineTransformRotate(_airView.transform, -M_PI_4);
   // _backAir.transform = CGAffineTransformRotate(_backAir.transform, 3 * M_PI_4);
   // _backAir.transform = CGAffineTransformScale(_backAir.transform, 0.2, 0.2);
    _backAir.alpha = 0;
   
    _lastAir.alpha = 0;
   // _lastAir.frame = CGRectMake(- 100, 200, 50, 50);
    
    
}




@end
