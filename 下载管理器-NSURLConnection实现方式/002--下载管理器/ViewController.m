//
//  ViewController.m
//  002--下载管理器
//
//  Created by H on 2017/2/22.
//  Copyright © 2017年 TZ. All rights reserved.
//


#import "ViewController.h"
#import "HKDownloaderManager.h"


@interface ViewController ()
/** url  */
@property(nonatomic,strong)NSURL * url;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}
- (IBAction)pause:(id)sender {
    
    [[HKDownloaderManager shareDownloaderManager] pauserWithURL:self.url];
}


- (IBAction)start{
    NSURL * url = [NSURL URLWithString:@"http://sw.bos.baidu.com/sw-search-sp/software/50045684f7da6/QQ_mac_5.4.1.dmg"];
    self.url = url;
    [[HKDownloaderManager shareDownloaderManager] downloadWithURL:url Progress:^(float progress) {
        NSLog(@"--->%f  %@",progress,[NSThread currentThread]);
    } completion:^(NSString *filePath) {
        //下载成功了
        NSLog(@"下载完成了 %@ %@",filePath,[NSThread currentThread]);
        
    } failed:^(NSString *errorMsg) {
        NSLog(@"======>  %@",errorMsg);
    }];
}


@end
