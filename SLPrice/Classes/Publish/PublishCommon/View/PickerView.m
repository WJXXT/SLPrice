//
//  PickerView.m
//  SLPrice
//
//  Created by XXT on 15/10/20.
//  Copyright (c) 2015年 XXT. All rights reserved.
//

#import "PickerView.h"
#import <AVFoundation/AVCaptureDevice.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <AVFoundation/AVMediaFormat.h>
@interface PickerView ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIActionSheetDelegate>


@property (nonatomic,strong) NSString* filePath;
@end

@implementation PickerView

-(id)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    
    if (self) {
//        self.imageview =[[UIImageView alloc]initWithFrame:frame];
        self.image =[UIImage imageNamed:@"4-introBackground"];
        
        self.bt =[UIButton buttonWithType:UIButtonTypeCustom];
        self.bt.bounds =CGRectMake(0, 0, 88, 88);
        [self.bt setImage:[UIImage imageNamed:@"imagepub_add_big"] forState:UIControlStateNormal];

        self.bt.center = CGPointMake(SCREEN_WIDTH/2, 100);
//        [self addSubview:];
//        [self.imageview addSubview:self.bt];
        [self addSubview:self.bt];
        [self.bt addTarget:self action:@selector(btact) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

-(void)btact{
    UIActionSheet *actionSheetTest = [[UIActionSheet alloc]initWithTitle:nil
                                                                delegate:self
                                                       cancelButtonTitle:@"取消"
                                                  destructiveButtonTitle:@"拍照"
                                                       otherButtonTitles:@"从相机选择",nil];
    actionSheetTest.bounds =CGRectMake(0, 0, 300, 200);
    [actionSheetTest showInView:self];
}

-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==0)
    {
        [self shootPiicturePrVideo];
    }else if(buttonIndex==1){
    [self selectExistingPictureOrVideo];
    }
}

#pragma  mark- 拍照模块
//从相机上选择
-(void)shootPiicturePrVideo{
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (authStatus == AVAuthorizationStatusRestricted || authStatus ==AVAuthorizationStatusDenied)
    {
        UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"无法获得相机权限" message:@"请在设置->隐私->相机设置权限" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];
    }else if (authStatus ==AVAuthorizationStatusNotDetermined){ //第一次使用，则会弹出是否打开权限
        UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
        if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
        {
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            picker.delegate = self;
            //设置拍照后的图片可被编辑
            picker.allowsEditing = YES;
            picker.sourceType = sourceType;
            [self.delegate presentModalViewControllers:picker];
//            [self presentModalViewController:picker animated:YES];
        }else
        {
            NSLog(@"模拟其中无法打开照相机,请在真机中使用");
        }
    }
}
//从相册中选择
-(void)selectExistingPictureOrVideo{
    ALAuthorizationStatus author = [ALAssetsLibrary authorizationStatus];
    if (author == ALAuthorizationStatusRestricted || author ==ALAuthorizationStatusDenied){
        //无权限
        UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"无法访问照片权限" message:@"请在设置->隐私->照片设置权限" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];
    }else{
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        picker.delegate = self;
        //设置选择后的图片可被编辑
        picker.allowsEditing = YES;
        [self.delegate presentModalViewControllers:picker];
//        [self presentModalViewController:picker animated:YES];
        NSLog(@"eq");
    }
}
//当选择一张图片后进入这里
-(void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info

{
    
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    
    //当选择的类型是图片
    if ([type isEqualToString:@"public.image"])
    {
        //先把图片转成NSData
        UIImage* image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        NSData *data;
        if (UIImagePNGRepresentation(image) == nil)
        {
            data = UIImageJPEGRepresentation(image, 1.0);
        }
        else
        {
            data = UIImagePNGRepresentation(image);
        }
        
        //图片保存的路径
        //这里将图片放在沙盒的documents文件夹中
        NSString * DocumentsPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
        
        //文件管理器
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        //把刚刚图片转换的data对象拷贝至沙盒中 并保存为image.png
        [fileManager createDirectoryAtPath:DocumentsPath withIntermediateDirectories:YES attributes:nil error:nil];
        [fileManager createFileAtPath:[DocumentsPath stringByAppendingString:@"/image.png"] contents:data attributes:nil];
        
        //得到选择后沙盒中图片的完整路径
        self.filePath = [[NSString alloc]initWithFormat:@"%@%@",DocumentsPath,  @"/image.png"];
        
        //关闭相册界面
        [picker dismissViewControllerAnimated:YES completion:nil];
        
        //创建一个选择后图片的小图标放在下方
        //类似微薄选择图后的效果
        //加在视图中
//        [self addSubview:smallimage];
        self.image =image;
        
    }
    
}



@end
