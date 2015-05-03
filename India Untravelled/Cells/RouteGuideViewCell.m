//
//  RouteGuideViewCell.m
//  India Untravelled
//
//  Created by Ranjeet on 5/1/15.
//  Copyright (c) 2015 GAURAV SRIVASTAVA. All rights reserved.
//

#import "RouteGuideViewCell.h"

@implementation RouteGuideViewCell

- (void)makeCircular:(UIView*)view withRadius:(CGFloat)radius {
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = radius;
    /*view.layer.borderColor = [UIColor whiteColor].CGColor;
    view.layer.borderWidth = 1.0f;*/
    view.layer.rasterizationScale = [UIScreen mainScreen].scale;
    view.layer.shouldRasterize = YES;
    view.clipsToBounds = YES;
}

- (void)configureCell {
    [self makeCircular:self.markerView withRadius:CGRectGetWidth(self.markerView.frame)/2.0f];
    [self makeCircular:self.markerInnerView withRadius:CGRectGetWidth(self.markerInnerView.frame)/2.0f]
    ;
    
    [self makeCircular:self.textView withRadius:8.0f];
    
}

@end
