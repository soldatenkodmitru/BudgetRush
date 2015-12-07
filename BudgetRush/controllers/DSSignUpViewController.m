//
//  DSSignUpViewController.m
//  BudgetRush
//
//  Created by Lena on 24.11.15.
//  Copyright © 2015 Dima Soldatenko. All rights reserved.
//

#import "DSSignUpViewController.h"
#import "DSDataManager.h"
#import "Settings.h"

@interface DSSignUpViewController ()  <UIAlertViewDelegate> {
    __weak IBOutlet UITextField *_emailTextField;
    __weak IBOutlet UITextField *_passwordTextField;
    
   
}
 - (IBAction) signUpTouch:(id)sender;
@end

@implementation DSSignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self navigationController] setNavigationBarHidden:NO animated:NO];
    self.navigationItem.title = NSLocalizedString( @"Sign Up", nil);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction) signUpTouch:(id)sender {
    self.view.userInteractionEnabled = NO;
    [[DSDataManager sharedManager] signUpUserEmail:_emailTextField.text password:_passwordTextField.text OnSuccess:^(id object) {
        
        [[DSDataManager sharedManager] loginUserEmail:_emailTextField.text password:_passwordTextField.text OnSuccess:^(id object) {
            [[NSUserDefaults standardUserDefaults] setObject:_emailTextField.text forKey:kUserName];
            [[NSUserDefaults standardUserDefaults] setObject:_passwordTextField.text forKey:kUserPass];
            [[NSUserDefaults standardUserDefaults] synchronize];
            [self performSegueWithIdentifier:@"showTabBar" sender:self];
        } onFailure:^(NSError *error) {
            [self.navigationController popViewControllerAnimated:YES];
        }];
       
    } onFailure:^(NSError *error) {
         self.view.userInteractionEnabled = YES;
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"The email has been used",nil)
                                                        message:NSLocalizedString(@"Try again or register using another email",nil)
                                                       delegate:self
                                              cancelButtonTitle:NSLocalizedString(@"OK",nil)
                                              otherButtonTitles:nil];
        [alert show];
    }];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    
    _passwordTextField.text = @"";
   _emailTextField.text = @"";

}

@end
