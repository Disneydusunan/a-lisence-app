//
//  FirstViewController.m
//  我要考驾照
//
//  Created by 谢谦 on 16/2/8.
//  Copyright © 2016年 杜苏南. All rights reserved.
//

#import "FirstViewController.h"
#import "FirstTableViewCell.h"
#import "TestViewController.h"
#import "DataManager.h"

@interface FirstViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    NSArray *_dataSourceArray;
}
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.edgesForExtendedLayout = UIRectEdgeTop;
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 5, self.view.frame.size.width, self.view.frame.size.height - 200) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    _dataSourceArray = @[@"章节练习",@"顺序练习",@"随机练习",@"专项练习",@"仿真模拟考试"];

    [self.view addSubview:_tableView];
    
    [self createView];
    // Do any additional setup after loading the view.
}


-(void)createView
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2 -150, self.view.frame.size.height - 150, 300, 30)];
    label.text = @"··········我的考试分析··········";
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor grayColor];
    [self.view addSubview:label];
    
    
    for (int i =0 ; i<4; i++) {
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/4*i + self.view.frame.size.width/4/2 - 30 , self.view.frame.size.height -100, 60, 60)];
        [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%i.png",i+12]] forState:UIControlStateNormal];
        [self.view addSubview:button];
    }
    

}

#pragma mark --tableview datasource delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataSourceArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"FirstTableViewCell";
    FirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:cellID owner:self options:nil]lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.image.image = [UIImage imageNamed:[NSString stringWithFormat:@"%i.png",indexPath.row+7]];
    cell.label.text = _dataSourceArray[indexPath.row];
    
    return cell;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            TestViewController *fViewController = [[TestViewController alloc]init];
            fViewController.dataArray = [DataManager getData:chapter];
            [self.navigationController pushViewController:fViewController animated:YES];
        
        }
            break;
            
        default:
            break;
    }


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
