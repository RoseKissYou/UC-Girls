//
//  XABeautyBaseListController.m
//  UC美女
//
//  Created by 小笨熊 on 16/2/20.
//  Copyright © 2016年 Jake_Smith. All rights reserved.
//  这里用来显示美女的名字列表

#import "XABeautyBaseListController.h"
//cell
#import "XABeautyFirstListCell.h"
//model
#import "XAFirstList.h"
//打开网页
#import "XAModelDetailController.h"
@interface XABeautyBaseListController ()
@property (nonatomic,assign) CGFloat num;
//image list
@property (strong, nonatomic) NSArray *firstListArray;
//
@property (strong, nonatomic) NSString *plistName;
@property (strong, nonatomic) NSArray *plistList;
@end

@implementation XABeautyBaseListController
static NSString *ID = @"firstcell";
-(instancetype)init{
    // 流水布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    // 设置cell的尺寸
    CGFloat screecW = [UIScreen mainScreen].bounds.size.width;
    //    layout.itemSize = CGSizeMake(50, 50);
    
    //每个cell的间距
    CGFloat minimum = 2;
    //一行cell 的个数
    CGFloat count = 3;
    //每一行的上下距离
    CGFloat minimum2 = 2;
    //每个cell的宽
    CGFloat cellW = (screecW  - minimum *count - minimum)/count ;
    //每个cell的高
    CGFloat cellH = cellW * 3 / 2;
    layout.itemSize = CGSizeMake(cellW, cellH);
    
    // 设置每一行的间距
    layout.minimumLineSpacing = minimum2;
    
    // 设置每个cell的间距
    layout.minimumInteritemSpacing = minimum;
    
    // 设置每组的内边距
    layout.sectionInset = UIEdgeInsetsMake(20, minimum, 0, minimum);
    //    UIEdgeInsetsMake(<#CGFloat top#>, <#CGFloat left#>, <#CGFloat bottom#>, <#CGFloat right#>)
    // 设置滚动方向横向显示
    //    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    return [self initWithCollectionViewLayout:layout];
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    backItem.title = @"返回";
    self.navigationItem.backBarButtonItem = backItem;
   
    self.navigationItem.title = @"美图录";
    NSString *firstPath = [[NSBundle mainBundle] pathForResource:@"firstList" ofType:@"plist"];
    NSDictionary *firstDict = [NSDictionary dictionaryWithContentsOfFile:firstPath];
    NSArray *firstArray = firstDict[@"firstList"];
    
    NSMutableArray *headerTemp = [NSMutableArray arrayWithCapacity:firstArray.count];
    for (NSDictionary *dict  in firstArray) {
        XAFirstList *first = [XAFirstList firstImageListWithDict:dict];
        [headerTemp addObject:first ];
    }
    self.firstListArray = headerTemp;
    
    // 注册cell
   // [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ID];
    [self.collectionView registerNib:[UINib nibWithNibName:@"XABeautyFirstListCell" bundle:nil] forCellWithReuseIdentifier:ID];
    //    // 取消弹簧效果
    //    self.collectionView.bounces = NO;
    //
    //    // 取消显示指示器
    //    self.collectionView.showsHorizontalScrollIndicator = NO;
    //
    //    // 开启分页模式
    //    self.collectionView.pagingEnabled = YES;
    // Do any additional setup after loading the view.
}

#pragma mark - UICollectionView数据源
// 返回有多少个cell
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.firstListArray.count;
}

// 返回每个cell长什么样子
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
   
    XABeautyFirstListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    XAFirstList *first = self.firstListArray[indexPath.row];
    [cell.xaListImageView setImage:first.imageName];
    [cell.xaListImageNameLabel setText:first.modelName];
    [cell.plistName setText:first.plistName];
   
    return cell;
}
//点击cell相应
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点击了%@",indexPath);
    NSLog(@"%ld",(long)indexPath.item); // 0 , 1 ...
    //点击了<NSIndexPath: 0xc000000000600016> {length = 2, path = 0 - 3}
    XAFirstList *first = self.firstListArray[indexPath.row];
    XAModelDetailController *modelController  = [[XAModelDetailController alloc] init];
    modelController.plistName = first.plistName;
    
    NSLog( @"传递plist name : %@ ",modelController.plistName);
    [self.navigationController pushViewController:modelController animated:YES];
    
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
