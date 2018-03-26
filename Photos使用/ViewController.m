//
//  ViewController.m
//  Photos使用
//
//  Created by 软件开发部2 on 2018/3/22.
//  Copyright © 2018年 软件开发部2. All rights reserved.
//

#import "ViewController.h"
#import "AlbumsVC.h"
@interface ViewController ()
- (IBAction)callPhotos:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)callPhotos:(id)sender {
    AlbumsVC *vc = [[AlbumsVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
