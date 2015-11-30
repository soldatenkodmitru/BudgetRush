//
//  DSSettingsViewController.m
//  BudgetRush
//
//  Created by Lena on 24.11.15.
//  Copyright © 2015 Dima Soldatenko. All rights reserved.
//

#import "DSSettingsViewController.h"


@interface DSSettingsViewController ()

@end

@implementation DSSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}

- (void) viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [self navigationController].topViewController.title = @"Settings";
    [self navigationController].topViewController.navigationItem.rightBarButtonItem = nil;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setup {
    
    __unsafe_unretained typeof(self) weakSelf = self;
    [self addSection:[BOTableViewSection sectionWithHeaderTitle:nil handler:^(BOTableViewSection *section) {
        [section addCell:[BOTableViewCell cellWithTitle:@"Currency" key:nil handler:^(BOTableViewCell *cell) {
            cell.detailTextLabel.text = @"USD";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }]];
        
        [section addCell:[BOTableViewCell cellWithTitle:@"Change passsword" key:nil handler:^(BOTableViewCell *cell) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }]];
        [section addCell:[BOButtonTableViewCell cellWithTitle:@"Logout" key:nil handler:^(BOButtonTableViewCell *cell) {
            cell.textLabel.textAlignment = NSTextAlignmentLeft;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.actionBlock = ^{
                [weakSelf presentAlertController];

            };
        }]];
        
    }]];
}

- (void)presentAlertController {

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:@"Are you sure you want to Logout?" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        [alertController dismissViewControllerAnimated:YES completion:nil];
    }]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        
        [self.navigationController popToRootViewControllerAnimated:YES];

    }]];
    
    [self presentViewController:alertController animated:YES completion:nil];
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