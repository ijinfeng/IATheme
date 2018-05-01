//
//  IAThemeHelper.m
//  IAThemeCenter
//
//  Created by 金峰 on 2018/4/15.
//  Copyright © 2018年 IA.Alter.com. All rights reserved.
//

#import "IAThemeHelper.h"
#import <UIKit/UIColor.h>

@implementation IAThemeHelper

+ (UIColor *)colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue {
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0 alpha:alphaValue];
}

+ (UIColor *)colorWithHex:(NSInteger)hexValue {
    return [self colorWithHex:hexValue alpha:1.0];
}

+ (NSInteger)numberWithHexString:(NSString *)hexString{
    const char *hexChar = [hexString cStringUsingEncoding:NSUTF8StringEncoding];
    int hexNumber;
    sscanf(hexChar, "%x", &hexNumber);
    return (NSInteger)hexNumber;
}

#pragma mark - public

+ (UIColor *)colorWithThemeColor:(NSString *)themeColor {
    if (themeColor.length == 0) {
        return nil;
    }
    NSInteger hexNumber = [self numberWithHexString:themeColor];
    return [self colorWithHex:hexNumber];
}

@end
