//
//  RootViewController.m
//  
//
//  Created by 王新国 on 15/10/18.
//
//

#import "RootViewController.h"
#import "DiscoverController.h"
#import "DelicacyController.h"
#import "MovieViewController.h"
#import "TravelViewController.h"
#import "UserViewController.h"
#import "PublishController.h"
#import "VWWWaterView.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor =[UIColor whiteColor];
    
    
//    DiscoverController  *discover=[[DiscoverController alloc]init];
//    UINavigationController *firstNaVc =[[UINavigationController alloc]initWithRootViewController:discover];
//    discover.title =@"主页";
    
    PublishController  *discover=[[PublishController alloc]init];
    UINavigationController *firstNaVc =[[UINavigationController alloc]initWithRootViewController:discover];
    discover.title =@"发布";

    
    DelicacyController  *delicacy=[[DelicacyController alloc]init];
    UINavigationController *delicacynv =[[UINavigationController alloc]initWithRootViewController:delicacy];
    delicacy.title =@"美食";
    
    MovieViewController  *movie=[[MovieViewController alloc]init];
    UINavigationController *moviena =[[UINavigationController alloc]initWithRootViewController:movie];
    movie.title =@"电影";
    
    TravelViewController  *travelVc=[[TravelViewController alloc]init];
    UINavigationController *travelnc =[[UINavigationController alloc]initWithRootViewController:travelVc];
    travelVc.title =@"旅行";
    
    UserViewController  *userVc=[[UserViewController alloc]init];
    UINavigationController *userVcna =[[UINavigationController alloc]initWithRootViewController:userVc];
    userVc.title =@"个人";
    
    self.viewControllers =@[firstNaVc,delicacynv,moviena,travelnc,userVcna];
    self.tabBar.alpha =0.5;
    
    VWWWaterView *waterView = [[VWWWaterView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - NavigationBar_HEIGHT-5, SCREEN_WIDTH, NavigationBar_HEIGHT+5)];
    [self.view addSubview:waterView];
    
    [self.view bringSubviewToFront:self.tabBar];
    

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
