//
//  XADetail.h
//  UC美女
//
//  Created by 小笨熊 on 16/2/20.
//  Copyright © 2016年 Jake_Smith. All rights reserved.
//// 这里用来显示选择的美女的相册列表

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XADetail : NSObject
@property (strong, nonatomic) NSURL *imageView;
@property (strong, nonatomic) NSString *imageCount;
@property (strong, nonatomic) NSString *imageName;
//跳转网址
@property (strong, nonatomic) NSString *imageUrl;
+ (id) detailImageListWithDict:(NSDictionary *)dict;
//plistName
@property (strong, nonatomic) NSString *plistName;
@end
