//
//  XAFirstList.m
//  UC美女
//
//  Created by 小笨熊 on 16/2/20.
//  Copyright © 2016年 Jake_Smith. All rights reserved.
//

#import "XAFirstList.h"


@implementation XAFirstList

+ (id) firstImageListWithDict:(NSDictionary *)dict
{
    XAFirstList *x = [[XAFirstList alloc] init   ];
    [x setModelName:dict[@"modelName"]];
    
//    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:dict[@"iconWeb"]]];
//    [x setImageName:[UIImage imageWithData:data]];
    [x setImageName:dict[@"iconWeb"]];
    [x setPlistName:dict[@"plistName"]];
    
    [x setModelBirthday:dict[@"modelBirthday"]];
    [x setModelHigh:dict[@"modelHigh"]];
    
    [x setModelBWH:dict[@"modelBWH"]];
    [x setModelOther:dict[@"modelOther"]];
  
    return x;
}
@end
