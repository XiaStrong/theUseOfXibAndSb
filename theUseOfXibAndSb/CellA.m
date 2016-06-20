//
//  CellA.m
//  SDLearning
//
//  Created by Xia_Q on 16/6/20.
//  Copyright © 2016年 X. All rights reserved.
//

#import "CellA.h"

@implementation CellA

- (void)awakeFromNib {
    // Initialization code
    
    _myLable.numberOfLines= 0;
    _myLable.lineBreakMode=NSLineBreakByWordWrapping;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
