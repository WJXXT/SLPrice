//
//  UserViewController.m
//  
//
//  Created by 王新国 on 15/10/18.
//
//

#import "UserViewController.h"
#import "RegisterController.h"
@interface UserViewController ()
@property (nonatomic,strong)BmobFile *file1;
@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *bt =[UIButton buttonWithType:UIButtonTypeContactAdd];
    bt.frame =CGRectMake(50, 50, 50, 50);
    [bt addTarget:self action:@selector(reg) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bt];


}
-(void)reg{
    [BmobUser loginWithUsernameInBackground:@"xxt"
                                   password:@"222616"];
    
    NSLog(@"登陆成功");
}

//注册
//BmobUser *bUser = [[BmobUser alloc] init];
//[bUser setUsername:@"xxt"];
//[bUser setPassword:@"222616"];
//NSArray *array =[NSArray arrayWithObjects:@"12345",@"12345", nil];
//[bUser setObject:array forKey:@"movieArr"];
//[bUser signUpInBackgroundWithBlock:^ (BOOL isSuccessful, NSError *error){
//    if (isSuccessful){
//        NSLog(@"Sign up successfully");
//    } else {
//        NSLog(@"%@",error);
//    }
//}];
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
