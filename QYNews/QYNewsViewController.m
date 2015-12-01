//
//  QYNewsViewController.m
//  QYNews
//
//  Created by qingyun on 15/11/27.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "QYNewsViewController.h"

@interface QYNewsViewController ()

@end

@implementation QYNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [NSThread sleepForTimeInterval:2.0];
    [self setNavigationBar];
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:@"新闻" image:[UIImage imageNamed:@"tabbar_icon_news_normal"] selectedImage:[UIImage imageNamed:@"tabbar_icon_news_highlight"]];
        self.tabBarItem = tabBarItem;
    }
    return self;
}

- (void)setNavigationBar
{
    //    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    //设置左边的barBtnItem
    UIBarButtonItem *leftBarBtnItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"todaynews_footer_icon"] style:UIBarButtonItemStylePlain target:self action:nil];
    leftBarBtnItem.tintColor = [UIColor grayColor];
    self.navigationItem.leftBarButtonItem = leftBarBtnItem;
    
    //设置titleView
    UIImageView *titleImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"contentview_loading_background_blue"]];
    self.navigationItem.titleView = titleImage;
    
    //设置右边的barBtnItem
    UIBarButtonItem *rightBarBtnItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"night_top_navigation_square"] style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.rightBarButtonItem = rightBarBtnItem;
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
