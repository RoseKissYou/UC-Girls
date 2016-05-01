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
#import <SDWebImage/UIImageView+WebCache.h>
static NSInteger _locationStatue;
static NSInteger _insertt = 30;
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
   // CGFloat count = 1;
    //每一行的上下距离
    CGFloat minimum2 = 2;
    //每个cell的宽
    CGFloat cellW = screecW ;
    //每个cell的高
    CGFloat cellH = cellW  / 2;
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
// logo图片  http://pic.yiipic.com/css/logo.jpg
- (void)viewDidLoad {
    [super viewDidLoad];
    //self.collectionView.contentOffset.y = 0;
    
    //设置 navigation bar
    [self setNavigationBar];
    //从plist获取文件信息
    [self requetPICFromPlist];
   
}
- (void) viewWillAppear:(BOOL)animated
{
    [self.collectionView setContentOffset:CGPointMake(0, 0) animated:YES];
}
#pragma mark - 设置 navigation bar
- (void) setNavigationBar
{
    self.collectionView.backgroundColor = [UIColor whiteColor];
    //设置全局返回汉化
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    backItem.title = @"返回";
    self.navigationItem.backBarButtonItem = backItem;
    
    //初始化透明 navigation bar
    UIImage *backNavi = [UIImage imageNamed:@"naviImage.png"];
    [self.navigationController.navigationBar setBackgroundImage:backNavi
                                                  forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:backNavi];
    
    UIImageView *logoView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MutuluLogo.jpg"]];
    [logoView setFrame:CGRectMake(0, 0, 100, 30)];
    self.navigationItem.titleView = logoView;
    
}

#pragma mark - 从plist获取文件信息
- (void) requetPICFromPlist
{
    //图片信息取自于plist
    NSString *firstPath = [[NSBundle mainBundle] pathForResource:@"firstList" ofType:@"plist"];
    NSDictionary *firstDict = [NSDictionary dictionaryWithContentsOfFile:firstPath];
    NSArray *firstArray = firstDict[@"firstList"];
    
    //这里需要图片在后台加载,但是先显示占位图片 并且加载一张就显示一张
    
    NSMutableArray *headerTemp = [NSMutableArray arrayWithCapacity:firstArray.count];
    for (NSDictionary *dict  in firstArray) {
        XAFirstList *first = [XAFirstList firstImageListWithDict:dict];
        [headerTemp addObject:first ];
        // [self.collectionView registerNib:[UINib nibWithNibName:@"XABeautyFirstListCell" bundle:nil] forCellWithReuseIdentifier:ID];
    }
    self.firstListArray = headerTemp;
    
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"XABeautyFirstListCell" bundle:nil] forCellWithReuseIdentifier:ID];
    // 取消弹簧效果
    self.collectionView.bounces = NO;
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
   // [cell.xaListImageView setImage:first.imageName];
    [cell.xaListImageView sd_setImageWithURL:first.imageName placeholderImage:[UIImage imageNamed:@"RoseAebell"]];
    [cell.xaListImageNameLabel setText:first.modelName];
    [cell.plistName setText:first.plistName];
    [cell.modelBirthdayLabel setText:first.modelBirthday];
    [cell.modelHighLabel setText:first.modelHigh];
    [cell.modelBWHLabel setText:first.modelBWH];
    [cell.modelOtherLabel setText:first.modelOther];
   
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
    modelController.modelName = first.modelName;
    
    NSLog( @"传递plist name : %@ ",modelController.plistName);
    [self.navigationController pushViewController:modelController animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//UIScrollView滚动时隐藏底部导航栏问题
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //NSLog(@"开始滚动");
    int currentPostion = scrollView.contentOffset.y;
    if (currentPostion - _locationStatue > _insertt && currentPostion > 0) {
        _locationStatue = currentPostion;
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }else if ((_locationStatue - currentPostion > _insertt) && (currentPostion <= scrollView.contentSize.height - scrollView.bounds.size.height - _insertt)){
        _locationStatue = currentPostion    ;
        [self.navigationController setNavigationBarHidden:NO animated:YES];
    }
    
//    if (currentPostion - _lastPosition > 0  && currentPostion >0) {
//        
//        _lastPosition = currentPostion;
//        
//        NSLog(@"ScrollUp now");
//        
//        self.tabBarController.tabBar.hidden =YES;
//        
//      //  [self.navigationControllersetNavigationBarHidden:YESanimated:YES];
//        
//    }
//    else if ((_lastPosition - currentPostion >20) && (currentPostion  <= scrollView.contentSize.height-scrollView.bounds.size.height-20) )
//    {
//        
//        _lastPosition = currentPostion;
//        NSLog(@"ScrollDown now");
//        
//        self.tabBarController.tabBar.hidden =NO;//隐藏时，没有动画效果
//        [self.navigationControllersetNavigationBarHidden:NOanimated:YES];
        
  //  }
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
