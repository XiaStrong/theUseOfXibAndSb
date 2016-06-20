//
//  PrizeTableViewCell.h
//  Book
//
//  Created by Xia_Q on 15/7/23.
//  Copyright (c) 2015年 XiaQiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PrizeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *logo;
@property (weak, nonatomic) IBOutlet UILabel *prize;
@property (weak, nonatomic) IBOutlet UILabel *market;
@end
