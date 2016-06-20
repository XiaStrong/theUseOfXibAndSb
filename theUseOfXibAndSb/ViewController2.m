//
//  ViewController2.m
//  SDLearning
//
//  Created by Xia_Q on 16/6/17.
//  Copyright © 2016年 X. All rights reserved.
//

#import "ViewController2.h"
#import "XCell.h"
#import "PicCell.h"

#define xqwidth [UIScreen mainScreen].bounds.size.width
//static const CGFloat xqwidth = [UIScreen mainScreen].bounds.size.width;

//static const CGFloat xqwidth = 20;


@interface ViewController2 ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _downTab.delegate=self;
    _downTab.dataSource=self;
    
    [self.view addSubview:_downTab];
    
    // Do any additional setup after loading the view.
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    if(indexPath.row%5 == 0){
        
//        xib cell 调用
        static NSString *str=@"cell";
        XCell *cell=[tableView dequeueReusableCellWithIdentifier:str];
        if (cell==nil) {
            cell =[[[NSBundle mainBundle]loadNibNamed:@"XCell" owner:nil options:nil]lastObject];
        }
        return cell;

    
    }
    else if(indexPath.row%3 ==0 &&indexPath.row%5 !=0){
        
        PicCell *cell = (PicCell *)[tableView dequeueReusableCellWithIdentifier:@"PicCell"];
        return cell;

    }
    else{

//        //sb cell 调用
        NewCell *cell = (NewCell *)[tableView dequeueReusableCellWithIdentifier:@"NewCell"];
        return cell;
        
        
    }
    
}


- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row%5==0) {
        return xqwidth*0.6;
    }
    else if(indexPath.row%3==0&&indexPath.row%5 !=0){
        return 90;
    }
    else{
        return 130;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
