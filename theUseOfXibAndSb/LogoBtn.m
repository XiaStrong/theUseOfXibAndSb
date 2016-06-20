//
//  LogoBtn.m
//  theUseOfXibAndSb
//
//  Created by Xia_Q on 16/6/20.
//  Copyright © 2016年 X. All rights reserved.
//

#import "LogoBtn.h"

@implementation LogoBtn


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization cod重写Button
        
    }
    return self;
}

-(void)awakeFromNib{
    self.titleLabel.textAlignment=NSTextAlignmentCenter;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    NSLog(@"%f,%f,%f,%f",contentRect.size.width,contentRect.size.height,contentRect.origin.x,contentRect.origin.y);
    float x =contentRect.size.width;
//    float y =contentRect.size.height;
    
    float mid_y =contentRect.size.height/2.0;
//    float mid_x =contentRect.size.width/2.0;
    

    return CGRectMake(0, mid_y, x, 21);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    
//    float x =contentRect.size.width;
//    float y =contentRect.size.height;
    
    float mid_y =contentRect.size.height/2.0;
    float mid_x =contentRect.size.width/2.0;

    return CGRectMake(mid_x-22, mid_y-34, 44, 34);
    //(44,34)
//    return CGRectMake(0, 0, 55, 56);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
