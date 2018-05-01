//
//  IAThemeFileHandler.h
//  IAThemeCenter
//
//  Created by 金峰 on 2018/4/21.
//  Copyright © 2018年 IA.Alter.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@class IATheme;
@interface IAThemeFileHandler : NSObject
/**
 * 用户是否配置默认主题
 */
- (BOOL)isUserDefaultThemeSetting;

+ (NSString *)pathOfConfig;

+ (NSString *)pathOfLocalTheme;

@property (nonatomic, strong, readonly) NSDictionary *configDic;

- (NSString *)imageNamed:(NSString *)imageName;

- (BOOL)saveTheme:(IATheme *)theme;

- (IATheme *)localTheme;

- (BOOL)clearThemeAndInit;

@end
