//
//  ViewController.m
//  IAThemeCenter
//
//  Created by 金峰 on 2018/4/15.
//  Copyright © 2018年 IA.Alter.com. All rights reserved.
//

#import "ViewController.h"
#import "IAThemeHelper.h"
#import "UIView+IATheme.h"
#import "IAThemeManager.h"
#import "IATableViewCell.h"
#import "UIImageView+IATheme.h"
#import "UIButton+IATheme.h"
#import "IASecondViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *items;

@property (nonatomic, strong) UILabel *textLabel;

@property (strong, nonatomic)  UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = [IAThemeManager sharedManager].theme.themeName;
    self.items = @[@"颜色 color1",@"颜色 color2",@"颜色 color3", @"主题色"];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"IATableViewCell" bundle:nil] forCellReuseIdentifier:@"cell_id"];
    
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.button addTarget:self action:@selector(actionForButton:) forControlEvents:UIControlEventTouchUpInside];
    self.button.frame = CGRectMake(40, 400, 200, 40);
    [self.button setTitle:@"我是一个按钮" forState:UIControlStateNormal];
    [self.tableView addSubview:self.button];
    
    [self.button ia_setTitleColorWithKey:@"color1" forState:UIControlStateNormal];
    [self.button ia_setTitleColorWithKey:@"color2" forState:UIControlStateSelected];
    
    [self.button ia_setImageWithKey:@"icon1" forState:UIControlStateNormal];
    [self.button ia_setImageWithKey:@"icon2" forState:UIControlStateSelected];
}

- (void)actionForButton:(id)sender {
    self.button.selected = !self.button.selected;
    
}

#pragma mark - delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    IATableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_id" forIndexPath:indexPath];
    if (indexPath.row == 0) {
        [cell.iconView ia_setImageWithKey:@"icon1"];
        [cell.colorVoew ia_setBackgroundColorWithKey:@"color1"];
    } else if (indexPath.row == 1) {
        [cell.iconView ia_setImageWithKey:@"image1"];
        [cell.colorVoew ia_setBackgroundColorWithKey:@"color2"];
    } else if (indexPath.row == 2) {
        [cell.iconView ia_setImageWithKey:@"icon2"];
        [cell.colorVoew ia_setBackgroundColorWithKey:@"color3"];
    } else if (indexPath.row == 3) {
        [cell.iconView ia_setImageWithKey:@"image2"];
        [cell.colorVoew ia_setThemeColor];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (IBAction)actionForSwitch:(UIBarButtonItem *)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"默认主题" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [[IAThemeManager sharedManager] switchSystemTheme];
        self.title = [IAThemeManager sharedManager].theme.themeName;
    }];
    UIAlertAction *skin2Action = [UIAlertAction actionWithTitle:@"主题 - skin2" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
         [[IAThemeManager sharedManager] switchThemeWithKey:@"skinKey2"];
        self.title = [IAThemeManager sharedManager].theme.themeName;
    }];
    [alert addAction:defaultAction];
    [alert addAction:skin2Action];
    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)actionForJump:(id)sender {
    IASecondViewController *second = [[IASecondViewController alloc] init];
    [self.navigationController pushViewController:second animated:YES];
}

@end
