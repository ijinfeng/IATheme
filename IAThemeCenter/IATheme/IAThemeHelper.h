//
//  IAThemeHelper.h
//  IAThemeCenter
//
//  Created by 金峰 on 2018/4/15.
//  Copyright © 2018年 IA.Alter.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIColor;
@interface IAThemeHelper : NSObject
/**
 * 十六进制转化成UIColor
 */
+ (UIColor *)colorWithThemeColor:(NSString *)themeColor;

@end
