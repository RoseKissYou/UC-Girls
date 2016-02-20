//
//  XABeautyFirstListCell.h
//  UC美女
//
//  Created by 小笨熊 on 16/2/20.
//  Copyright © 2016年 Jake_Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XABeautyFirstListCell : UICollectionViewCell
//image list name
@property (weak, nonatomic) IBOutlet UIImageView *xaListImageView;
//image name
@property (weak, nonatomic) IBOutlet UILabel *xaListImageNameLabel;
//plist

@property (weak, nonatomic) IBOutlet UILabel *plistName;

@end
