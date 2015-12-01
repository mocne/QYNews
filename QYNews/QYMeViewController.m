//
//  QYMeViewController.m
//  QYNews
//
//  Created by qingyun on 15/11/27.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "QYMeViewController.h"
#define kScreenW    [UIScreen mainScreen].bounds.size.width
#define kScreenH    [UIScreen mainScreen].bounds.size.height

@interface QYMeViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UIView *topView;
@property (nonatomic,strong) NSString *username;
@property (nonatomic,strong) NSString *userhonorary;
@property (nonatomic,strong) NSString *dynamicnews;

@property (nonatomic,strong) NSArray *datas;


@end

@implementation QYMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置用户名（临时）
    NSString *username = @"kaifeng";
    NSString *userhonorary = @"跟帖局科员";
    NSString *dynamicnews = @"今日降落砖石雨";
    
    UIView *topView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, kScreenW, kScreenH)];
    topView.backgroundColor = [UIColor lightTextColor];
    [self.view addSubview:topView];
    
    
    //创建红色头部背景
    UIView *userView = [[UIView alloc] initWithFrame: CGRectMake(0, 20, kScreenW, (kScreenH * 0.3) - 20)];
    userView.backgroundColor = [UIColor redColor];
    [self.view addSubview:userView];
    
    
    //创建用户头像button
    UIButton *userImage = [[UIButton alloc] initWithFrame:CGRectMake(kScreenW / 2 - 30, userView.frame.size.height / 5, 60, 60)];
    userImage.backgroundColor = [UIColor whiteColor];
    [userImage setImage:[UIImage imageNamed:@"kaifeng"] forState:UIControlStateNormal];
    //设置圆角button
    userImage.layer.cornerRadius = 30;
    userImage.layer.masksToBounds = YES;
    [self.view addSubview:userImage];
    
    //创建显示用户名button
    UIButton *userName = [[UIButton alloc] initWithFrame:CGRectMake(0, userView.frame.size.height / 5 + 65, username.length * 10, 20)];//每个字符占10个像素，button宽度为:字符数＊10
    userName.center = CGPointMake(kScreenW / 2, userView.frame.size.height / 5 + 60 + 20);
    _username = username;
    userName.titleLabel.font = [UIFont systemFontOfSize: 20.0];
    [userName setTitle:[NSString stringWithFormat:@"%@",_username] forState:UIControlStateNormal];
    [userName setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:userName];
    
    //创建显示称号button
    UIButton *userHonorary = [[UIButton alloc] initWithFrame:CGRectMake(0, (kScreenH * 0.3 - 20), 5 * 15, 20)];
    userHonorary.center = CGPointMake(kScreenW / 2, (kScreenH * 0.3) - 55);
    _userhonorary = userhonorary;
    userHonorary.backgroundColor = [UIColor lightTextColor];
    userHonorary.layer.cornerRadius = 10;
    [userHonorary setTitle:[NSString stringWithFormat:@"%@",_userhonorary] forState:UIControlStateNormal];
    userHonorary.titleLabel.font = [UIFont systemFontOfSize: 12.0];
    [userHonorary setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    [self.view addSubview:userHonorary];
    
    
    
    //创建显示动态新闻
    UIButton *dynamicNews = [[UIButton alloc] initWithFrame:CGRectMake(0, (kScreenH * 0.3 - 20), dynamicnews.length * 20, 20)];
    dynamicNews.center = CGPointMake(kScreenW / 2, (kScreenH * 0.3) - 20);
    _dynamicnews = dynamicnews;
    [dynamicNews setTitle:[NSString stringWithFormat:@"%@",_dynamicnews] forState:UIControlStateNormal];
    dynamicNews.titleLabel.font = [UIFont systemFontOfSize: 14.0];
    [dynamicNews setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:dynamicNews];
    
    
    
    //创建设置button
    UIButton *setBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, kScreenW - 60, 2 * 20, 20)];
    setBtn.center = CGPointMake(kScreenW - 40, 50);
    [setBtn setTitle:[NSString stringWithFormat:@"设置"] forState:UIControlStateNormal];
    setBtn.titleLabel.font = [UIFont systemFontOfSize: 17.0];
    [setBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:setBtn];
    
 /******************************************************************************************************/
    
    //创建TableView
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kScreenH * 0.3, kScreenW, kScreenH * 0.6) style:UITableViewStyleGrouped];
    
//    tableView.userInteractionEnabled = NO;
    tableView.scrollEnabled = NO;
    
    [self.view addSubview:tableView];
    
    //设置数据源
    tableView.dataSource = self;
    
    //设置代理
    tableView.delegate = self;
    
    
    //设置头视图
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenH * 0.3, kScreenW, 50)];
//    headerView.backgroundColor = [UIColor lightGrayColor];
    
    //头视图增加4个button
    //阅读
    UIButton *read = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 93, 50)];
    read.backgroundColor = [UIColor whiteColor];
    [read setTitle:@"阅读" forState:UIControlStateNormal];
    [read setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [read setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    read.titleLabel.font = [UIFont systemFontOfSize:12];
    //更改字体位置
    [read setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, -25, 0)];
    UILabel *readLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 15)];
    readLable.center = CGPointMake(46, 15);
    readLable.backgroundColor = [UIColor grayColor];
    [read addSubview:readLable];
    
    //收藏
    UIButton *collect = [[UIButton alloc] initWithFrame:CGRectMake(94, 0, 93, 50)];
    collect.backgroundColor = [UIColor whiteColor];
    [collect setTitle:@"收藏" forState:UIControlStateNormal];
    [collect setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [collect setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    collect.titleLabel.font = [UIFont systemFontOfSize:12];
    //更改字体位置
    [collect setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, -25, 0)];
    UILabel *collectLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 15)];
    collectLable.center = CGPointMake(46, 15);
    collectLable.backgroundColor = [UIColor grayColor];
    [collect addSubview:collectLable];

    //跟帖
    UIButton *flow = [[UIButton alloc] initWithFrame:CGRectMake(188, 0, 93, 50)];
    flow.backgroundColor = [UIColor whiteColor];
    [flow setTitle:@"跟帖" forState:UIControlStateNormal];
    [flow setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [flow setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    flow.titleLabel.font = [UIFont systemFontOfSize:12];
    //更改字体位置
    [flow setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, -25, 0)];
    UILabel *flowLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 15)];
    flowLable.center = CGPointMake(46, 15);
    flowLable.backgroundColor = [UIColor grayColor];
    [flow addSubview:flowLable];

    //金币
    UIButton *coin = [[UIButton alloc] initWithFrame:CGRectMake(kScreenW - 93, 0, 93, 50)];
    coin.backgroundColor = [UIColor whiteColor];
    [coin setTitle:@"金币" forState:UIControlStateNormal];
    [coin setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [coin setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    coin.titleLabel.font = [UIFont systemFontOfSize:12];
    //更改字体位置
    [coin setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, -25, 0)];
    UILabel *coinLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 15)];
    coinLable.center = CGPointMake(45, 15);
    coinLable.backgroundColor = [UIColor grayColor];
    [coin addSubview:coinLable];

    
    [headerView addSubview:read];
    [headerView addSubview:coin];
    [headerView addSubview:collect];
    [headerView addSubview:flow];
    
    tableView.tableHeaderView = headerView;

    tableView.sectionHeaderHeight = 5;
    tableView.sectionFooterHeight = 0;
    
    // Do any additional setup after loading the view.
}

//设置datas
- (NSArray*)datas{

    if(_datas == nil){
        _datas = @[@"📢我的消息",@"🛍️金币商城",@"📝我的任务",@"💰我的钱包",@"📩我的邮箱"];
    }
    return _datas;
}

//table组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


//行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return 2;
    return self.datas.count;
}

//section头标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@""];
}

//
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"aaa"];
    
#if 0
    cell.textLabel.text = [NSString stringWithFormat:@"我是第%ld行，第%ld列",indexPath.section,indexPath.row];
#else
    cell.textLabel.text = self.datas[indexPath.row];
#endif
    return cell;
}


//设置section的头高
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 5;
}

//设置section的尾高
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{

    return 0;
}


//将要选中
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath;
}
//将要取消选中
- (NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath;
}

//已经选中
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s , (%ld:%ld)", __func__, indexPath.section,indexPath.row);
    //获取点击的单元格
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.textColor = [UIColor redColor];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}
//已经取消选中
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s , (%ld:%ld)", __func__, indexPath.section,indexPath.row);
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.textColor = [UIColor blackColor];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}

//设置辅助视图的样式
- (UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellAccessoryDisclosureIndicator;
}

//点击辅助视图
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s , (%ld:%ld)", __func__, indexPath.section,indexPath.row);
}



/*******************************************************************************************************/

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我" image:[UIImage imageNamed:@"tabbar_icon_me_normal"] selectedImage:[UIImage imageNamed:@"tabbar_icon_me_highlight"]];
        self.tabBarItem = tabBarItem;
        //        self.navigationController.navigationBarHidden = YES;
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }
    return self;
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
