//
//  IAThemeFileHandler.m
//  IAThemeCenter
//
//  Created by 金峰 on 2018/4/21.
//  Copyright © 2018年 IA.Alter.com. All rights reserved.
//

#import "IAThemeFileHandler.h"
#import "IAThemeHelper.h"
#import "IAThemeDefines.h"
#import "IAThemeManager.h"
#import <UIKit/UIScreen.h>

@interface IAThemeFileHandler ()
@property (nonatomic, strong, readwrite) NSDictionary *configDic;
@end

@implementation IAThemeFileHandler

- (BOOL)isUserDefaultThemeSetting {
    BOOL setting = NO;
    if (defaultThemeKey.length && self.configDic[defaultThemeKey]) {
        setting = YES;
    }
    return setting;
}

+ (NSString *)pathOfConfig {
    return  [[NSBundle mainBundle] pathForResource:@"IAThemeConfig" ofType:@"plist"];
}

+ (NSString *)pathOfLocalTheme {
    NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    return [NSString stringWithFormat:@"%@%@",documentPath,themePath];
}

- (NSDictionary *)configDic {
    if (!_configDic) {
        _configDic = [[NSDictionary alloc] initWithContentsOfFile:[IAThemeFileHandler pathOfConfig]];
    }
    return _configDic;
}

- (NSString *)imageNamed:(NSString *)imageName {
    NSString *scale;
    if ([UIScreen mainScreen].scale == 3) {
        scale = @"3x";
    } else {
        scale = @"2x";
    }
    return [NSString stringWithFormat:@"%@.bundle/%@@%@",[IAThemeManager sharedManager].theme.currentBundle,imageName,scale];
}

#pragma mark - 本地存储 - 清除

- (BOOL)saveTheme:(IATheme *)theme {
    return [NSKeyedArchiver archiveRootObject:theme toFile:[IAThemeFileHandler pathOfLocalTheme]];
}

- (IATheme *)localTheme {
    return [NSKeyedUnarchiver unarchiveObjectWithFile:[IAThemeFileHandler pathOfLocalTheme]];
}

- (BOOL)clearThemeAndInit {
    NSError *error;
    return [[NSFileManager defaultManager] removeItemAtPath:[IAThemeFileHandler pathOfLocalTheme] error:&error];
}

@end
