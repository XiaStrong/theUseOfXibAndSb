//
//  CommentCell.h
//  Book
//
//  Created by Xia_Q on 15/7/24.
//  Copyright (c) 2015年 XiaQiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentCell : UITableViewCell

@property (strong, nonatomic) UIImageView *headImage;
@property (strong, nonatomic) UILabel *anthorLable;
@property (strong, nonatomic) UILabel *contentLable;
@property (strong, nonatomic) UILabel *time_from_Lable;

-(void)updataWithDict:(NSDictionary *)dict;

@end
