//
//  FirstView.m
//  我要考驾照
//
//  Created by 谢谦 on 16/2/8.
//  Copyright © 2016年 杜苏南. All rights reserved.
//

#import "FirstView.h"

@implementation FirstView
{

    UIButton *_btn;

}
-(FirstView *)initWithFrame:(CGRect)frame withButton:(UIButton *)btn
{
    if (self = [super initWithFrame:frame]) {
        _btn = btn;
        
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
        [self createBtn];
        
    }
    return self;
}

-(void)createBtn
{
    
    for (int i=0 ; i<4; i++) {
        UIButton *b = [UIButton buttonWithType:UIButtonTypeSystem];
        b.frame = CGRectMake(self.frame.size.width/4*i + self.frame.size.width/4/2-30,self.frame.size.height - 80, 70,70 );
        [b setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%i.png",i+2]] forState:UIControlStateNormal];
        [b addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:b];
    }

}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0;
    }];


}

-(void)click:(UIButton *)button
{
    [_btn setBackgroundImage:[button backgroundImageForState:UIControlStateNormal] forState:UIControlStateNormal];
    self.alpha = 0;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
