//
//  ViewController.m
//  我要考驾照
//
//  Created by 谢谦 on 16/2/7.
//  Copyright © 2016年 杜苏南. All rights reserved.
//

#import "ViewController.h"
#import "FirstView.h"
#import "FirstViewController.h"


@interface ViewController ()
{
    IBOutlet UIButton *_catogoryButton;
    FirstView *_firstView;
    FirstViewController *_firstViewController;

}
@end

@implementation ViewController
- (IBAction)FirstButtons:(UIButton *)sender {
    switch (sender.tag) {
        case 100:
        {
            [UIView animateWithDuration:0.3 animations:^{
                _firstView.alpha = 1;
            }];
        }
            break;
            
            
            
        case 101:
        {
            _firstViewController = [[FirstViewController alloc]init];
            [self.navigationController pushViewController:_firstViewController animated:YES];
            
        }
            break;
            
            
            
        default:
            break;
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _firstView = [[FirstView alloc]initWithFrame:self.view.frame withButton:_catogoryButton];
    _firstView.alpha = 0;
    
    [self.view addSubview:_firstView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
