//
//  BookViewController.m
//  Book
//
//  Created by Xia_Q on 15/7/21.
//  Copyright (c) 2015年 XiaQiang. All rights reserved.
//

#import "BookViewController.h"
#import "PrizeTableViewCell.h"
#import "CommentTableViewCell.h"
#import "CommentCell.h"

@interface BookViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
{
    NSArray *_newsItemdata;
    NSArray *_commentData;
}
@end

@implementation BookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _newsItemdata=[[NSMutableArray alloc]init];
    _commentData=[[NSMutableArray alloc]init];

    self.view.backgroundColor=[UIColor colorWithRed:243/255.0 green:243/255.0 blue:243/255.0 alpha:1];
    
    [self creatUI];
}

-(void)creatUI
{
    _downScr.pagingEnabled=YES;
    
    
    [_menuSeg addTarget:self action:@selector(segValueChange:) forControlEvents:UIControlEventValueChanged];

    NSString *path=[[NSBundle mainBundle] pathForResource:@"Book"ofType:@"plist"];
    NSArray *myarr =[NSMutableArray arrayWithContentsOfFile:path];
    NSDictionary *dict=myarr[0];
    NSString *menu=[dict objectForKey:@"menu"];
    NSString *synopsis=[dict objectForKey:@"synopsis"];
    _newsItemdata=[dict objectForKey:@"newsItem"];
    _commentData=[dict objectForKey:@"comment"];
    
    
    _menuTextView.text=menu;
    _menuTextView.editable=NO;
    _menuTextView.backgroundColor=[UIColor colorWithRed:243/255.0 green:243/255.0 blue:243/255.0 alpha:1];
    _synTextView.text=synopsis;
    _synTextView.editable=NO;
    _synTextView.backgroundColor=[UIColor colorWithRed:243/255.0 green:243/255.0 blue:243/255.0 alpha:1];
    
    
    _comTabView.delegate=self;
    _comTabView.dataSource=self;
    _comTabView.backgroundColor=[UIColor colorWithRed:243/255.0 green:243/255.0 blue:243/255.0 alpha:1];

    
    _priTabView.delegate=self;
    _priTabView.dataSource=self;
    _priTabView.tag=11;
    _priTabView.scrollEnabled=NO;
    _priTabView.backgroundColor=[UIColor colorWithRed:243/255.0 green:243/255.0 blue:243/255.0 alpha:1];
    
    
    
}

- (void)segValueChange:(UISegmentedControl *)seg
{
    //通过被选择的下标获取title
    NSString *title = [seg titleForSegmentAtIndex:seg.selectedSegmentIndex];
    //selectedSegmentIndex 被选择的下标
    NSLog(@" title %@ %d",title,seg.selectedSegmentIndex);
    
    CGRect rect=[UIScreen mainScreen].bounds;
    
    [_downScr setContentOffset:CGPointMake((rect.size.width-30)*seg.selectedSegmentIndex, 0) animated:YES];

}


-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.5;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView.tag==11){
        return 60;
    }else
    {
        CGRect rect=[UIScreen mainScreen].bounds;
        UIFont *font = [UIFont systemFontOfSize:14.0];
        CGSize size = CGSizeMake(rect.size.width-80-30, CGFLOAT_MAX);
        NSDictionary *dic = [NSDictionary
                             dictionaryWithObjectsAndKeys:font,
                             NSFontAttributeName,nil];
        NSDictionary *dict=_commentData[indexPath.row];
        size = [[dict objectForKey:@"comment"]
                boundingRectWithSize:size
                options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                attributes:dic context:nil].size;
        return 10+size.height+5+20+5;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag==11) {
        return 3;
    }
    else
    {
        return _commentData.count;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag==11) {
        static NSString *s11=@"cell11";
        PrizeTableViewCell *cell11=[tableView dequeueReusableCellWithIdentifier:s11];
        if (cell11==nil) {
            cell11=[[[NSBundle mainBundle] loadNibNamed:@"PrizeTableViewCell" owner:self options:nil] lastObject];
        }
        NSDictionary *dict=_newsItemdata[indexPath.row];
        
        cell11.logo.image=[UIImage imageNamed:[NSString stringWithFormat:@"%@",[dict objectForKey:@"logo"]]];
        cell11.prize.text=[NSString stringWithFormat:@"%@",[dict objectForKey:@"prize"]];
        cell11.market.text=[NSString stringWithFormat:@"%@",[dict objectForKey:@"market"]];
        return cell11;
    }
    else
    {
    
        static NSString *str=@"cell";
        CommentCell *cell=[tableView dequeueReusableCellWithIdentifier:str];
        if (cell==nil) {
            cell=[[CommentCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        }
        NSDictionary *dict=_commentData[indexPath.row];
        
        [cell updataWithDict:dict];
        
        return cell;
    }
}

- (void)updateViewConstraints
{
    [super updateViewConstraints];
    self.downView.constant=320*4-120;
//    self.downView.constant=CGRectGetWidth([UIScreen mainScreen].bounds)*4-30*4;
    self.synopsisTextView.constant=CGRectGetWidth([UIScreen mainScreen].bounds)-30;
    self.commentTabView.constant=CGRectGetWidth([UIScreen mainScreen].bounds)*2-60;
    self.prizeTabView.constant=CGRectGetWidth([UIScreen mainScreen].bounds)*3-90;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
