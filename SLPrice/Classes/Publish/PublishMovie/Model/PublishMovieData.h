//
//  PublishMovieData.h
//  
//
//  Created by 王新国 on 15/10/19.
//
//

#import <Foundation/Foundation.h>

@interface PublishMovieData : NSObject
@property (nonatomic,copy)NSString *range;//区域
@property (nonatomic,copy)NSString *simplecontent;//描述
@property (nonatomic,copy)NSString *style;//类型
@property (nonatomic,copy)NSString *activityaddress;//活动具体地址
@property (nonatomic,copy)NSString *cinemaname;//影院名称
@property (nonatomic,copy)NSString *content;//活动详情
@property (nonatomic,copy)NSString *price;//活动电影价格
@property (nonatomic,copy)NSString *begintime;//电影活动开始时间
@property (nonatomic,copy)NSString *finishtime;//电影活动结束时间
@property (nonatomic,copy)NSString *title;//电影活动标题
@property (nonatomic,copy)NSMutableArray *activityImage;//电影活动图片
@property (nonatomic,copy)NSString *activityObject;//电影活动来源
@end
