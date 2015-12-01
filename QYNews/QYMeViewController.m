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

@interface QYMeViewController ()

@property (nonatomic, strong) UIView *topView;
@property (nonatomic,strong) NSString *username;
@property (nonatomic,strong) NSString *userhonorary;
@property (nonatomic,strong) NSString *dynamicnews;


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
    [userImage setImage:[UIImage imageNamed:@"icon"] forState:UIControlStateNormal];
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
    
    
    // Do any additional setup after loading the view.
}

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
