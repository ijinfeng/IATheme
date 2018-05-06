//
//  IASecondViewController.m
//  IAThemeCenter
//
//  Created by 金峰 on 2018/5/6.
//  Copyright © 2018年 IA.Alter.com. All rights reserved.
//

#import "IASecondViewController.h"
#import "UIView+IATheme.h"
#import "IAThemeManager.h"
#import "IAView.h"

@interface IASecondViewController ()
@property (nonatomic, strong) IAView *cell;
@end

@implementation IASecondViewController

-(void)dealloc {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    self.cell = [[IAView alloc] initWithFrame:CGRectMake(0, 240, 100, 40)];
    [self.cell ia_setThemeColor];
    [self.view addSubview:self.cell];
}


@end
