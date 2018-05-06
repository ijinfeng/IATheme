//
//  UILabel+IATheme.m
//  IAThemeCenter
//
//  Created by 金峰 on 2018/4/24.
//  Copyright © 2018年 IA.Alter.com. All rights reserved.
//

#import "UILabel+IATheme.h"
#import "IAThemeManager.h"

@implementation UILabel (IATheme)

- (void)ia_setTextColorWithKey:(NSString *)key {
    IAThemePredicate *predicate = [[IAThemePredicate alloc] init];
    predicate.sourceType = IASourceTypeColor;
    predicate.key = IAKeyCustom;
    predicate.keyValue = key;
    kIAFilterKey(key);
    
    __weak typeof(self) weakSelf = self;
    [[IAThemeManager sharedManager] loadResourceWithPredicate:predicate load:^(IAThemeLoadResult *result, BOOL loadSuccess) {
        if (loadSuccess) {
            weakSelf.textColor = result.color;
        }
    }];
}

@end
