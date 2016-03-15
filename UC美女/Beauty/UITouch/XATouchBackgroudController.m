//
//  XATouchBackgroudController.m
//  UC美女
//
//  Created by 小笨熊 on 16/3/14.
//  Copyright © 2016年 Jake_Smith. All rights reserved.
//

#import "XATouchBackgroudController.h"

@interface XATouchBackgroudController ()

@end

@implementation XATouchBackgroudController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    //In this you can set yourself image.
    UIImage *image = [UIImage imageNamed:@"touchImage.jpg"];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    imageView.image = image;
    [self.view addSubview:imageView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
