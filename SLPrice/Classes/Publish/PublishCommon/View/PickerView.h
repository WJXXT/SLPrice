//
//  PickerView.h
//  SLPrice
//
//  Created by XXT on 15/10/20.
//  Copyright (c) 2015年 XXT. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol PickerViewDelegate <NSObject>
-(void)presentModalViewControllers: (UIImagePickerController *)picker;
@end
@interface PickerView : UIImageView
-(id)initWithFrame:(CGRect)frame;
@property (nonatomic,strong)UIButton *bt;
//@property (nonatomic,strong)UIImageView *imageview;
@property (nonatomic,weak)id<PickerViewDelegate>delegate;
@end
