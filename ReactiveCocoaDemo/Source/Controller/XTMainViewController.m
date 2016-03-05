//
//  XTMainViewController.m
//  ReactiveCocoaDemo
//
//  Created by imchenglibin on 16/3/4.
//  Copyright © 2016年 imchenglibin. All rights reserved.
//

#import "XTMainViewController.h"
#import "XTUser.h"
#import "XTUserViewModel.h"
#import <ReactiveCocoa.h>

@interface XTMainViewController ()
@property (strong, nonatomic) XTUserViewModel *userViewModel;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (strong, nonatomic) UIActivityIndicatorView *indicatorView;
@end

@implementation XTMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"ReactiveCoco Demo";
    
    self.indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self.view addSubview:self.indicatorView];
    
    _userViewModel = [[XTUserViewModel alloc] init];
    RAC(_userViewModel.user, username) = self.usernameTextField.rac_textSignal;
    RAC(_userViewModel.user, password) = self.passwordTextField.rac_textSignal;
    self.loginButton.rac_command = _userViewModel.loginCommand;
    @weakify(self)
    [self.loginButton.rac_command.executionSignals subscribeNext:^(RACSignal* signal) {
        @strongify(self)
        [self.usernameTextField resignFirstResponder];
        [self.passwordTextField resignFirstResponder];
        [self.indicatorView startAnimating];
        [signal subscribeNext:^(id x) {
            [self.indicatorView stopAnimating];
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示框" message:@"登录成功" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [alertView show];
        }];
    }];
    
    [self.loginButton.rac_command.errors subscribeNext:^(id x) {
        @strongify(self)
        [self.indicatorView stopAnimating];
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示框" message:@"登录失败" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alertView show];
    }];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.indicatorView.center = self.view.center;
}

@end
