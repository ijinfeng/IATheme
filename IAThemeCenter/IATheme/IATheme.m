//
//  IATheme.m
//  IAThemeCenter
//
//  Created by 金峰 on 2018/4/15.
//  Copyright © 2018年 IA.Alter.com. All rights reserved.
//

#import "IATheme.h"
#import "IAThemeHelper.h"

@implementation IATheme

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        _themeName = [aDecoder decodeObjectForKey:@"themeName"];
        _themeKey = [aDecoder decodeObjectForKey:@"themeKey"];
        _themeColor = [aDecoder decodeObjectForKey:@"themeColor"];
        _currentBundle = [aDecoder decodeObjectForKey:@"currentBundle"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_themeName forKey:@"themeName"];
    [aCoder encodeObject:_themeKey forKey:@"themeKey"];
    [aCoder encodeObject:_themeColor forKey:@"themeColor"];
    [aCoder encodeObject:_currentBundle forKey:@"currentBundle"];
}

- (UIColor *)getThemeColor {
    if (self.themeColor.length == 0) {
        return nil;
    }
    return [IAThemeHelper colorWithThemeColor:self.themeColor];
}

@end
