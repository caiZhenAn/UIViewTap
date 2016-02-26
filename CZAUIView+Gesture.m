//
//  CZAUIView+Gesture.m
//  scale
//
//  Created by cza on 16/1/6.
//  Copyright © 2016年 cza. All rights reserved.
//

#import "CZAUIView+Gesture.h"
#import <objc/runtime.h>

@interface UIView ()
@property (nonatomic,copy) TapClick click;
@end

@implementation UIView (Gesture)

static char const * const ObjectTagKey;

-(void)addTapGesture:(TapClick)click{
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick)];
    [self addGestureRecognizer:tap];
    self.click = click;
}

-(void)tapClick{
    if (self.click) {
        self.click();
    }
}


-(TapClick)click{
    return objc_getAssociatedObject(self, ObjectTagKey);
}

-(void)setClick:(TapClick)click{
    objc_setAssociatedObject(self, ObjectTagKey, click, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


@end
