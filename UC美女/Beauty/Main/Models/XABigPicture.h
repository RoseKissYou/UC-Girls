//
//  XABigPicture.h
//  UC美女
//
//  Created by 小笨熊 on 16/2/20.
//  Copyright © 2016年 Jake_Smith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XABigPicture : NSObject
//@property (strong, nonatomic ) UIImage *bigPictureName;
+ (id) bigPictureWithDict:(NSDictionary *)dict;

@property (strong, nonatomic) NSString *bigPictName;

@end
