//
//  ViewController.m
//  GVObuSDKTestApp
//
//  Created by 曾晓江 on 2016/12/7.
//  Copyright © 2016年 GENVICT. All rights reserved.
//

#import "ViewController.h"
#import "GVObuSDK.h"

@interface ViewController ()

@property (nonatomic, strong) GVObuSDK * gvObuSDK;
- (IBAction)onTestBtnClick:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.gvObuSDK = [GVObuSDK sharedObuSDK];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onTestBtnClick:(id)sender {

    NSLog(@"SDK Version: %@", [self.gvObuSDK getSDKVersion]);
}

@end
