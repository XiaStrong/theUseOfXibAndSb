//
//  ViewController.m
//  SDLearning
//
//  Created by Xia_Q on 16/6/17.
//  Copyright © 2016年 X. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "ViewController2.h"
#import "CellHeightSuitViewController.h"
#import "BookViewController.h"
#import "MViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UIViewControllerTransitioningDelegate>
{
    NSArray *dataArr;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"布局";

    dataArr=@[@"sb的横竖屏基本使用pad和iPhone",@"动态跳转页面",@"xib与sb的cell使用",@"cell高度自适应",@"图书界面",@"某些应用首页布局"];
    
    _myTab.delegate=self;
    _myTab.dataSource=self;
    self.automaticallyAdjustsScrollViewInsets=NO;

    
    self.navigationController.navigationBar.translucent = NO;
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    // Do any additional setup after loading the view, typically from a nib.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *str=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    cell.textLabel.text=[NSString stringWithFormat:@"%@",dataArr[indexPath.row]];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    switch (indexPath.row) {
        case 0:
        {
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Second" bundle:nil];
            SecondViewController *svc =[storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
            [self.navigationController pushViewController:svc animated:YES];

        }
            break;
        case 1:{
            
            
            ThirdViewController *tvc=[[ThirdViewController alloc]init];
            tvc.transitioningDelegate=self;

            tvc.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
//            tvc.modalPresentationStyle=UIModalPresentationOverCurrentContext;

//            [self.navigationController pushViewController:tvc animated:YES];
            [self presentViewController:tvc animated:YES completion:^{
                
            }];
        }
            break;
        case 2:{
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Second" bundle:nil];
            ViewController2 *svc =[storyboard instantiateViewControllerWithIdentifier:@"ViewController2"];
            [self.navigationController pushViewController:svc animated:YES];

        }
            break;
            
        case 3:{
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Second" bundle:nil];
            CellHeightSuitViewController *cvc =[storyboard instantiateViewControllerWithIdentifier:@"CellHeightSuitViewController"];
            [self.navigationController pushViewController:cvc animated:YES];

        
        }
            break;
            
        case 4:{
            //图书界面的比价在真机上不会出现问题，在模拟器上回出现问题
            BookViewController *bvc =[[BookViewController alloc]init];
            [self.navigationController pushViewController:bvc animated:YES];

        }
            break;
            
        case 5:{
            
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Second" bundle:nil];
            MViewController *mvc =[storyboard instantiateViewControllerWithIdentifier:@"MViewController"];
            [self.navigationController pushViewController:mvc animated:YES];

        }
            break;
            
        default:
            break;
    }
    
    }





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
