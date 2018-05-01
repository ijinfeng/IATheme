//
//  UIView+IATheme.m
//  IAThemeCenter
//
//  Created by 金峰 on 2018/4/21.
//  Copyright © 2018年 IA.Alter.com. All rights reserved.
//

#import "UIView+IATheme.h"
#import "IAThemeManager.h"

@implementation UIView (IATheme)

- (void)ia_setThemeColor {
    IAThemePredicate *predicate = [[IAThemePredicate alloc] init];
    predicate.sourceType = IASourceTypeColor;
    predicate.key = IAKeyDefault;
    kIAFilterKey(nil);
    [[IAThemeManager sharedManager] loadResourceWithPredicate:predicate load:^(IAThemeLoadResult *result, BOOL loadSuccess) {
        if (loadSuccess) {
            self.backgroundColor = result.color;
        }
    }];
}

- (void)ia_setBackgroundColorWithKey:(NSString *)key {
    IAThemePredicate *predicate = [[IAThemePredicate alloc] init];
    predicate.sourceType = IASourceTypeColor;
    predicate.key = IAKeyCustom;
    predicate.keyValue = key;
    kIAFilterKey(key);
    
    [[IAThemeManager sharedManager] loadResourceWithPredicate:predicate load:^(IAThemeLoadResult *result, BOOL loadSuccess) {
        if (loadSuccess) {
            self.backgroundColor = result.color;
        }
    }];
}

@end
