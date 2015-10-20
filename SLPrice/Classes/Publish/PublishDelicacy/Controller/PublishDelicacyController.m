//
//  PublishDelicacyController.m
//  SLPrice
//
//  Created by XXT on 15/10/20.
//  Copyright (c) 2015年 XXT. All rights reserved.
//

#import "PublishDelicacyController.h"
#import "PickerView.h"
@interface PublishDelicacyController () <PickerViewDelegate>
@property (nonatomic,strong)PickerView *topView;
@end

@implementation PublishDelicacyController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.contentInset = UIEdgeInsetsMake(350 * 0.5, 0, 0, 0);
    [self downImageView];
    self.navigationItem.title =@"发布-美食";
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}
-(void)downImageView{
    
    self.topView = [[PickerView alloc] initWithFrame:CGRectMake(0, -150, SCREEN_WIDTH, 150)];
    self.topView.delegate =self;
    self.topView.contentMode = UIViewContentModeScaleAspectFill;
    [self.tableView insertSubview:self.topView atIndex:0];
    [self.topView bringSubviewToFront:self.topView.bt];
    self.topView.bt.userInteractionEnabled =YES;
    [self.tableView reloadData];
}
#pragma mark - ScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGRect frame = self.topView.frame;
    // 向下拽了多少距离
    CGFloat down = -(350 * 0.5) - scrollView.contentOffset.y;
    if (down < 0) {
        frame.origin.y =-150 -down *0.5;
    };
    if (down >0) {
        frame.size.height = 150 + down *2;
        frame.origin.y =-150 -down *1;
    }
    //    if (down>=265&&down<=275) {
    //        self.navigationController.navigationBar.alpha
    //    }
    //    NSLog(@"%f",down);
    self.topView.frame = frame;
    //    NSLog(@"%f",self.topView.frame .origin.y);
    // 5决定图片变大的速度,值越大,速度越快
    //    [[UINavigationBar appearance] setTintColor:[UIColor colorWithWhite:0.0 alpha:0.0]];
    
    
}

-(void)presentModalViewControllers:(UIImagePickerController *)picker{
    [self presentViewController:picker animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    // Configure the cell...
    cell.textLabel.text =@"暂无数据";
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
