//
//  CommentCell.m
//  Book
//
//  Created by Xia_Q on 15/7/24.
//  Copyright (c) 2015年 XiaQiang. All rights reserved.
//

#import "CommentCell.h"

@implementation CommentCell

- (void)awakeFromNib {
    
    
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGRect rect=[UIScreen mainScreen].bounds;
        
        _headImage=[[UIImageView alloc]initWithFrame:CGRectMake(10 ,10, 50, 50)];
        [self.contentView addSubview:_headImage];
        
        
        _anthorLable=[[UILabel alloc]initWithFrame:CGRectMake(10, 60, 50, 20)];
        _anthorLable.font=[UIFont systemFontOfSize:13];
        [self.contentView addSubview:_anthorLable];
        
        
        _contentLable=[[UILabel alloc]initWithFrame:CGRectMake(70, 10, rect.size.width-80, 30)];
        _contentLable.numberOfLines=0;
        [self.contentView addSubview:_contentLable];
        
        
        _time_from_Lable=[[UILabel alloc]init];
        [self.contentView addSubview:_time_from_Lable];

    }
    return self;
}

-(void)updataWithDict:(NSDictionary *)dict
{
    CGRect rect=[UIScreen mainScreen].bounds;
    self.backgroundColor=[UIColor colorWithRed:243/255.0 green:243/255.0 blue:243/255.0 alpha:1];
    //动态测试高度
    UIFont *font = [UIFont systemFontOfSize:14.0];
    CGSize size = CGSizeMake(rect.size.width-80-30, CGFLOAT_MAX);
    NSDictionary *dic = [NSDictionary
                         dictionaryWithObjectsAndKeys:font,
                         NSFontAttributeName,nil];
    size = [[dict objectForKey:@"comment"]
            boundingRectWithSize:size
            options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
            attributes:dic context:nil].size;
    
    
    _contentLable.frame=CGRectMake(70, 10, rect.size.width-80-30, size.height);
    _contentLable.lineBreakMode=NSLineBreakByCharWrapping;
    _contentLable.font=[UIFont systemFontOfSize:14];
    _time_from_Lable.frame=CGRectMake(70, 10+size.height+5, rect.size.width-80-30, 20);
    NSString *str=[NSString stringWithFormat:@"%d",arc4random()%10];
    NSLog(@"%@",str);
    _headImage.image=[UIImage imageNamed:[NSString stringWithFormat:@"%d",arc4random()%10]];
    _anthorLable.text=[dict objectForKey:@"name"];
    _contentLable.text=[dict objectForKey:@"comment"];
    NSLog(@"%@",[dict objectForKey:@"comment"]);
    _time_from_Lable.text=[NSString stringWithFormat:@"%@  %@",@"2015-05-05",@"来源：豆瓣"];
    _time_from_Lable.font=[UIFont systemFontOfSize:12];
    _time_from_Lable.textAlignment=NSTextAlignmentRight;
    _time_from_Lable.textColor=[UIColor grayColor];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
