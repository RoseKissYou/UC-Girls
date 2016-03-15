//
//  XAModelPhotoController.m
//  UC美女
//
//  Created by 小笨熊 on 16/2/20.
//  Copyright © 2016年 Jake_Smith. All rights reserved.
//

#import "XAModelPhotoController.h"
//cell
#import "XABigPictureCell.h"
//model
#import "XABigPicture.h"

#import <SDWebImage/UIImageView+WebCache.h>

@interface XAModelPhotoController ()
@property (strong, nonatomic) NSArray *bigPicturesListArray;
@property (strong, nonatomic) UIView *lookView;
//picture
@property (strong, nonatomic) XABigPicture *bigPic;
@end

@implementation XAModelPhotoController
static NSString *detailID = @"bigpicture";
static NSInteger _locationStatue;
static NSInteger _insertt = 30;

-(instancetype)init{
    // 流水布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    // 设置cell的尺寸
    CGFloat screecW = [UIScreen mainScreen].bounds.size.width;
    //    layout.itemSize = CGSizeMake(50, 50);
    
    //每个cell的间距
    CGFloat minimum = 2;
    //一行cell 的个数
   // CGFloat count = 1;
    //每一行的上下距离
    CGFloat minimum2 = 2;
    //每个cell的宽
    CGFloat cellW = screecW   ;
//    //每个cell的高
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
    
    self.navigationItem.title = self.photoName;
   
    NSString *bigPath = [[NSBundle mainBundle] pathForResource:@"bigPicture" ofType:@"plist"];
    NSDictionary *bigDict = [NSDictionary dictionaryWithContentsOfFile:bigPath];
    
    NSArray *bigArray = bigDict[self.plistName];
    NSLog(@"接收到的plist name: %@",self.plistName);
    NSMutableArray *bigTemp = [NSMutableArray arrayWithCapacity:bigArray.count];
    for (NSDictionary *dict in bigArray) {
        XABigPicture *big = [XABigPicture bigPictureWithDict:dict];
        [bigTemp addObject:big ];

    }
   self.bigPicturesListArray = [bigTemp copy];
    
    
    // 注册cell
   //  [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:detailID];
    [self.collectionView registerNib:[UINib nibWithNibName:@"XABigPictureCell" bundle:nil] forCellWithReuseIdentifier:detailID];
    // Do any additional setup after loading the view.
}
#pragma mark - UICollectionView数据源
// 返回有多少个cell
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return  self.bigPicturesListArray.count;
}

// 返回每个cell长什么样子
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
   
    XABigPictureCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:detailID forIndexPath:indexPath];
    self.bigPic = self.bigPicturesListArray[indexPath.row];
   // XABigPicture *big = self.bigPicturesListArray[indexPath.row];
    [cell.bigPictureImageView sd_setImageWithURL:[NSURL URLWithString:self.bigPic.bigPictName] placeholderImage:[UIImage imageNamed:@"RoseAebell"]];
    return cell;
}
//点击cell相应
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点击了%@",indexPath);
    NSLog(@"%ld",(long)indexPath.item); // 0 , 1 ...
    //点击了<NSIndexPath: 0xc000000000600016> {NSInteger *imageCount = [indexPath.row]
   
}
//
//- (void) lookBigPhotoOneByOne:(UIView *) collectionView
//{
//    self.lookView.hidden = NO;
//    UIView *lookView = [[UIView alloc] initWithFrame:self.view.bounds];
//    [lookView setBackgroundColor:[UIColor blackColor]];
//    self.lookView = lookView;
//    [self.view addSubview:lookView];
//    
//    UIImageView *lookImageView = [[UIImageView alloc] initWithFrame:lookView.frame];
//    [lookImageView setImage:[UIImage imageNamed:@"RoseAebell"]];
//    [lookView addSubview:lookImageView];
//    //点击隐藏查看图片视图
//    UIButton *clickButton = [UIButton buttonWithType:UIButtonTypeSystem];
//    [clickButton setFrame:lookView.frame];
//    [clickButton addTarget:self action:@selector(clickButtonHiddenView) forControlEvents:UIControlEventTouchUpInside];
//    [lookView addSubview:clickButton];
//}
//- (void) clickButtonHiddenView
//{
//    self.lookView.hidden = YES;
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//UIScrollView滚动时隐藏底部导航栏问题
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"开始滚动");
    int currentPostion = scrollView.contentOffset.y;
    if (currentPostion - _locationStatue > _insertt && currentPostion > 0) {
        _locationStatue = currentPostion;
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }else if ((_locationStatue - currentPostion > _insertt) && (currentPostion <= scrollView.contentSize.height - scrollView.bounds.size.height - _insertt)){
        _locationStatue = currentPostion    ;
        [self.navigationController setNavigationBarHidden:NO animated:YES];
    }
    
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
