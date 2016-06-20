//
//  CellHeightSuitViewController.m
//  SDLearning
//
//  Created by Xia_Q on 16/6/20.
//  Copyright © 2016年 X. All rights reserved.
//

#import "CellHeightSuitViewController.h"
#import "CellA.h"
#define xqwidth [UIScreen mainScreen].bounds.size.width

@interface CellHeightSuitViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *dataArr;
}
@end

@implementation CellHeightSuitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dataArr=@[@"呼拉拉拉拉阿拉啦啦啦啦啦啦呼拉拉拉拉阿拉啦啦啦啦啦啦呼拉拉拉拉阿拉啦啦啦啦啦啦呼拉拉拉拉阿拉啦啦啦啦啦啦呼拉拉拉拉阿拉啦啦啦啦啦啦呼拉拉拉拉阿拉啦啦啦啦啦啦呼拉拉拉拉阿拉啦啦啦啦啦啦呼拉拉拉拉阿拉啦啦啦啦啦啦",@"呼拉拉拉拉阿拉啦啦啦啦啦啦呼拉拉拉拉阿拉啦啦啦啦啦啦",@"呼拉拉拉拉阿拉啦啦啦啦啦啦呼拉拉拉拉阿拉啦啦啦啦啦啦呼拉拉拉拉阿拉啦啦啦啦啦啦呼拉拉拉拉阿拉啦啦啦啦啦啦呼拉拉拉拉阿拉啦啦啦啦啦啦呼拉拉拉拉阿拉啦啦啦啦啦啦呼拉拉拉拉阿拉啦啦啦啦啦啦呼拉拉拉拉阿拉啦啦啦啦啦啦呼拉拉拉拉阿拉啦啦啦啦啦啦呼拉拉拉拉阿拉啦啦啦啦啦啦呼拉拉拉拉阿拉啦啦啦啦啦啦呼拉拉拉拉阿拉啦啦啦啦啦啦呼拉拉拉拉阿拉啦啦啦啦啦啦呼拉拉拉拉阿拉啦啦啦啦啦啦呼拉拉拉拉阿拉啦啦啦啦啦啦呼拉拉拉拉阿拉啦啦啦啦啦啦呼拉拉拉拉阿拉啦啦啦啦啦啦呼拉拉拉拉阿拉啦啦啦啦啦啦",@"呼拉拉拉拉阿拉啦啦啦啦啦啦呼拉拉拉拉阿拉啦啦啦啦啦啦呼拉拉拉拉阿拉啦啦啦啦啦啦"];
    
    _downTab.delegate=self;
    _downTab.dataSource=self;
    // Do any additional setup after loading the view.
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.row == 0){
        static NSString *str=@"cell";
        //直接计算获取高度
        CellA *cell=[tableView dequeueReusableCellWithIdentifier:str];
        if (cell==nil) {
            cell =[[[NSBundle mainBundle]loadNibNamed:@"CellA" owner:nil options:nil]lastObject];
        }
        cell.myLable.text=[NSString stringWithFormat:@"%@",dataArr[indexPath.row]];
        cell.myLable.font=[UIFont systemFontOfSize:17];
        return cell;

    }
//    else if(indexPath.row == 1){
//
//        
//        
//
//    }
    else{
        static NSString *str=@"cell";
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:str];
        if (cell==nil) {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        }
        cell.textLabel.text=[NSString stringWithFormat:@"%@",dataArr[indexPath.row]];
        cell.textLabel.font=[UIFont systemFontOfSize:15];
        return cell;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataArr.count;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        //直接计算获取高度
        UIFont *font = [UIFont systemFontOfSize:17.0];
        CGSize size = CGSizeMake(xqwidth-20, CGFLOAT_MAX);
        NSDictionary *dic = [NSDictionary
                             dictionaryWithObjectsAndKeys:font,
                             NSFontAttributeName,nil];
        NSString *str =[NSString stringWithString:dataArr[indexPath.row]];
        size = [str  boundingRectWithSize:size
                                  options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                               attributes:dic context:nil].size;
        
        return size.height+10;

    }else{
        return 40;
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
