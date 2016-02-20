//
//  XADetail.m
//  UC美女
//
//  Created by 小笨熊 on 16/2/20.
//  Copyright © 2016年 Jake_Smith. All rights reserved.
//

#import "XADetail.h"

@implementation XADetail
+ (id)detailImageListWithDict:(NSDictionary *)dict
{
    XADetail *x = [[XADetail alloc ] init];
    [x setImageName:dict[@"photoName"]];
    [x setImageCount:dict[@"photoNumber"]];
    //imageView
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:dict[@"iconWeb"]]];
    [x setImageView:[UIImage imageWithData:data]];
    [x setImageUrl:dict[@"photoWeb"]];
    return x;
}
@end
