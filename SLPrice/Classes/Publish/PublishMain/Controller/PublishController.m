//
//  PublishController.m
//  
//
//  Created by 王新国 on 15/10/19.
//
//

#import "PublishController.h"
#import "PublishDelicacyController.h"
#import "PublishMovieController.h"
#import "PublishTravelController.h"
@interface PublishController ()

@end

@implementation PublishController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *bt1 =[UIButton buttonWithType:UIButtonTypeSystem];
    [bt1 setTitle:@"发布美食" forState:UIControlStateNormal];
    bt1.frame =CGRectMake(30, 100, 100, 50);
    [bt1 addTarget:self action:@selector(reg1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bt1];
    
    UIButton *bt2 =[UIButton buttonWithType:UIButtonTypeSystem];
    [bt2 setTitle:@"发布电影" forState:UIControlStateNormal];
    bt2.frame =CGRectMake(150, 100, 100, 50);
    [bt2 addTarget:self action:@selector(reg2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bt2];
    
    UIButton *bt3 =[UIButton buttonWithType:UIButtonTypeSystem];
    [bt3 setTitle:@"发布旅行" forState:UIControlStateNormal];
    bt3.frame =CGRectMake(250, 100, 100, 50);
    [bt3 addTarget:self action:@selector(reg3) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bt3];
}
-(void)reg1{

    PublishDelicacyController *del =[[PublishDelicacyController alloc]init];
    UINavigationController *vc=[[UINavigationController alloc]initWithRootViewController:del];
    [self presentViewController:vc animated:YES completion:nil];
}
-(void)reg2{
    
    PublishMovieController *del =[[PublishMovieController alloc]init];
    UINavigationController *vc=[[UINavigationController alloc]initWithRootViewController:del];
    [self presentViewController:vc animated:YES completion:nil];
}
-(void)reg3{
    
    PublishTravelController *del =[[PublishTravelController alloc]init];
    UINavigationController *vc=[[UINavigationController alloc]initWithRootViewController:del];
    [self presentViewController:vc animated:YES completion:nil];
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
