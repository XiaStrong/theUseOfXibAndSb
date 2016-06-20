//
//  BookViewController.h
//  Book
//
//  Created by Xia_Q on 15/7/21.
//  Copyright (c) 2015年 XiaQiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *bookPic;
@property (weak, nonatomic) IBOutlet UILabel *bookName;
@property (weak, nonatomic) IBOutlet UILabel *writer;
@property (weak, nonatomic) IBOutlet UILabel *shortComment;
@property (weak, nonatomic) IBOutlet UILabel *suit;
@property (weak, nonatomic) IBOutlet UISegmentedControl *menuSeg;
@property (weak, nonatomic) IBOutlet UIScrollView *downScr;


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *downView;
@property (weak, nonatomic) IBOutlet UITextView *menuTextView;

@property (weak, nonatomic) IBOutlet UITextView *synTextView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *synopsisTextView;

@property (weak, nonatomic) IBOutlet UITableView *comTabView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *commentTabView;

@property (weak, nonatomic) IBOutlet UITableView *priTabView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *prizeTabView;


@end
