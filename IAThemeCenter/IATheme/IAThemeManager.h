//
//  IAThemeManager.h
//  IAThemeCenter
//
//  Created by 金峰 on 2018/4/15.
//  Copyright © 2018年 IA.Alter.com. All rights reserved.
//
//  1、在使用前请先配置 IAThemeDefines.h 的默认主题‘defaultThemeKey’

#import <Foundation/Foundation.h>
#import "IAThemeLoadResult.h"
#import "IATheme.h"

typedef void(^IALoadComplication)(IAThemeLoadResult *result, BOOL loadSuccess);

@interface IAThemeManager : NSObject
/**
 * 单例
 */
@property (nonatomic, strong, class, readonly) IAThemeManager *sharedManager;
/**
 * 当前的主题
 */
@property (nonatomic, strong, readonly) IATheme *theme;

/**
 * 在程序刚启动的时候初始化
 * 第一次加载时会把默认图片加载到内存中并且保存在本地
 */
- (void)loadTheme;

/**
 * 根据提供的描述加载资源
 */
- (void)loadResourceWithPredicate:(IAThemePredicate *)predicate
                             load:(IALoadComplication)complication;


/**
 切换主题

 @param key 主题对应的key，在 ‘IAThemeConfig.plist' 文件中配置
 */
- (void)switchThemeWithKey:(NSString *)key;

- (void)switchSystemTheme;

/*
 清楚本地数据
 */
- (void)clear;

@end
