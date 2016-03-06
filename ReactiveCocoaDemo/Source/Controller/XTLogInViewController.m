//
//  XTMainViewController.m
//  ReactiveCocoaDemo
//
//  Created by imchenglibin on 16/3/4.
//  Copyright © 2016年 imchenglibin. All rights reserved.
//

#import "XTLogInViewController.h"
#import "XTLogInModel.h"
#import "XTLogInViewModel.h"
#import <ReactiveCocoa.h>

@interface XTLogInViewController ()
@property (strong, nonatomic) XTLogInViewModel *viewModel;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (strong, nonatomic) UIActivityIndicatorView *indicatorView;
@end

@implementation XTLogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"ReactiveCoco Demo";
    
    self.indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self.view addSubview:self.indicatorView];
    
    self.viewModel = [[XTLogInViewModel alloc] initWithModel:[[XTLogInModel alloc] init]];
    
    RAC(self.viewModel.model, username) = self.usernameTextField.rac_textSignal;
    RAC(self.viewModel.model, password) = self.passwordTextField.rac_textSignal;
    
    self.loginButton.rac_command = self.viewModel.loginCommand;
    
    @weakify(self)
    [self.loginButton.rac_command.executionSignals subscribeNext:^(id x) {
        @strongify(self)
        [self.usernameTextField resignFirstResponder];
        [self.passwordTextField resignFirstResponder];
        [self.indicatorView startAnimating];
    }];
    
    [self.loginButton.rac_command.executionSignals.switchToLatest subscribeNext:^(id x) {
        @strongify(self)
        [self.indicatorView stopAnimating];
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示框" message:@"登录成功" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alertView show];
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
