//
//  IATheme.h
//  IAThemeCenter
//
//  Created by 金峰 on 2018/4/15.
//  Copyright © 2018年 IA.Alter.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIColor;
@interface IATheme : NSObject<NSCoding>
/**
 * 主题的名字
 */
@property (nonatomic, copy) NSString *themeName;
/**
 * 对应 ‘IAThemeConfig.plist’ 文件中的主题key
 */
@property (nonatomic, copy) NSString *themeKey;
/**
 * 主题颜色,读取的是themeColor
 */
@property (nonatomic, copy) NSString *themeColor;
/**
 * Skin.bundle
 */
@property (nonatomic, copy) NSString *currentBundle;

- (UIColor *)getThemeColor;

@end
