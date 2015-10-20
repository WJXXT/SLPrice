//
//  PublishTravelData.h
//  
//
//  Created by 王新国 on 15/10/19.
//
//

#import <Foundation/Foundation.h>

@interface PublishTravelData : NSObject
@property (nonatomic,copy)NSString *range;//区域
@property (nonatomic,copy)NSString *simplecontent;//描述
@property (nonatomic,copy)NSString *traveladdress;//活动目的地
@property (nonatomic,copy)NSString *style;//类型
@property (nonatomic,copy)NSString *content;//活动详情
@property (nonatomic,copy)NSString *price;//活动旅行价格
@property (nonatomic,copy)NSString *begintime;//旅行活动开始时间
@property (nonatomic,copy)NSString *finishtime;//旅行活动结束时间
@property (nonatomic,copy)NSString *title;//旅行活动标题
@property (nonatomic,copy)NSMutableArray *travelImage;//旅行活动图片
@property (nonatomic,copy)NSString *travelObject;//旅行活动来源
@end
