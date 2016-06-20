//
//  NewCell.m
//  SDLearning
//
//  Created by Xia_Q on 16/6/17.
//  Copyright © 2016年 X. All rights reserved.
//

#import "NewCell.h"
#import "UIColor+RandomColor.h"

@implementation NewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    }
    return self;
}

//用xib或sb时会走
- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor randomColor];

    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
