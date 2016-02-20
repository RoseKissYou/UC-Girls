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
    /* NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:fileURL]];
     
     result = [UIImage imageWithData:data]; */
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:dict[@"iconWeb"]]];
    [x setImageName:[UIImage imageWithData:data]];
    [x setPlistName:dict[@"plistName"]];
  
    return x;
}
@end
