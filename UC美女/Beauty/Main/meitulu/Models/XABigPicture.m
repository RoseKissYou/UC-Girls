//
//  XABigPicture.m
//  UC美女
//
//  Created by 小笨熊 on 16/2/20.
//  Copyright © 2016年 Jake_Smith. All rights reserved.
//

#import "XABigPicture.h"


@implementation XABigPicture
+ (id)bigPictureWithDict:(NSDictionary *)dict
{
    XABigPicture *big = [[XABigPicture alloc] init];
    [big setBigPictName:dict[@"imageurl"]];

    return big;
}
@end
