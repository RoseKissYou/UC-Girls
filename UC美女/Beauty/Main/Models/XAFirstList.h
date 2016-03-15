//
//  XAFirstList.h
//  UC美女
//
//  Created by 小笨熊 on 16/2/20.
//  Copyright © 2016年 Jake_Smith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface XAFirstList : NSObject

//image name
//@property (strong, nonatomic) UIImage *imageName;
@property (strong, nonatomic) NSURL *imageName;

//model name
@property (strong, nonatomic) NSString *modelName;
//
@property (strong, nonatomic) NSString *plistName;

@property (strong, nonatomic) NSString *modelBirthday;
@property (strong, nonatomic) NSString *modelHigh;
@property (strong, nonatomic) NSString *modelBWH;
@property (strong, nonatomic) NSString *modelOther;


//go to web
@property (strong, nonatomic) NSString *imageStr;
//从plist获取文件

+ (id) firstImageListWithDict:(NSDictionary *)dict;
@end
