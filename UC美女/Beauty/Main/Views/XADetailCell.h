//
//  XADetailCell.h
//  UC美女
//
//  Created by 小笨熊 on 16/2/20.
//  Copyright © 2016年 Jake_Smith. All rights reserved.
//// 这里用来显示选择的美女的相册列表

#import <UIKit/UIKit.h>

@interface XADetailCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *modelImageView;
@property (weak, nonatomic) IBOutlet UILabel *imageCountLabel;

@property (weak, nonatomic) IBOutlet UILabel *imagesNameLabel;
@end
