//
//  WCViewController.m
//  WorldCup
//
//  Created by eason on 5/29/14.
//  Copyright (c) 2014 eason. All rights reserved.
//

#import "WCViewController.h"
#import "MMProgressHUD.h"
#import "NSString+Java.h"
#import "CustomNavigationBar/CustomNaviBarView.h"
#import "RPUmengConfig.h"
@interface WCViewController () <UIWebViewDelegate>
{
}
@end

@implementation WCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *language = [[NSLocale preferredLanguages] objectAtIndex:0];
    if ([language isEqualToString:@"zh-Hant"] || [language isEqualToString:@"zh-Hans"])
    {
        [self setNaviBarTitle:@"2014巴西世界杯"];
    }else
    {
        [self setNaviBarTitle:@"2014 Brazil WorldCup"];
    }
    
    
    if ([[self.navigationController viewControllers] count] == 1)
    {
        [self setNaviBarLeftBtn:nil];
    }
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, [CustomNaviBarView barSize].height, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) -  [CustomNaviBarView barSize].height)];
    webView.delegate = self;
    webView.suppressesIncrementalRendering = YES;
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
    [self.view addSubview:webView];
	// Do any additional setup after loading the view, typically from a nib.
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *language = [[NSLocale preferredLanguages] objectAtIndex:0];
    if ([language isEqualToString:@"zh-Hant"] || [language isEqualToString:@"zh-Hans"])
    {
        [MMProgressHUD showProgressWithStyle:MMProgressHUDProgressStyleIndeterminate title:nil status:@"努力加载中..."];
    }else
    {
        [MMProgressHUD showProgressWithStyle:MMProgressHUDProgressStyleIndeterminate title:nil status:@"Loading..."];
        return YES;
    }
    
    if ([[request.URL absoluteString] isEqualToString:self.url])
    {
        return YES;
    }
    WCViewController *viewController = [[WCViewController alloc] init];
    viewController.url = [request.URL absoluteString];
    [self.navigationController pushViewController:viewController animated:YES];
    
    return NO;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
   [MMProgressHUD dismiss];
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"%d",error.code);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
