//
//  UIButton+IATheme.m
//  IAThemeCenter
//
//  Created by Alter on 2018/4/24.
//  Copyright © 2018年 IA.Alter.com. All rights reserved.
//

#import "UIButton+IATheme.h"
#import "IAThemeManager.h"

@implementation UIButton (IATheme)

- (void)ia_setImageWithKey:(NSString *)key
                  forState:(UIControlState)state {
    IAThemePredicate *predicate = [[IAThemePredicate alloc] init];
    predicate.sourceType = IASourceTypeImage;
    predicate.keyValue = key;
    kIAFilterKey(key);
    
    __weak typeof(self) weakSelf = self;
    [[IAThemeManager sharedManager] loadResourceWithPredicate:predicate load:^(IAThemeLoadResult *result, BOOL loadSuccess) {
        if (loadSuccess) {
            [weakSelf setImage:result.image forState:state];
        }
    }];
}

- (void)ia_setBackgroundImageWithKey:(NSString *)key
                            forState:(UIControlState)state {
    IAThemePredicate *predicate = [[IAThemePredicate alloc] init];
    predicate.sourceType = IASourceTypeImage;
    predicate.keyValue = key;
    kIAFilterKey(key);
    
    __weak typeof(self) weakSelf = self;
    [[IAThemeManager sharedManager] loadResourceWithPredicate:predicate load:^(IAThemeLoadResult *result, BOOL loadSuccess) {
        if (loadSuccess) {
            [weakSelf setBackgroundImage:result.image forState:state];
        }
    }];
}

- (void)ia_setTintColorWithKey:(NSString *)key {
    IAThemePredicate *predicate = [[IAThemePredicate alloc] init];
    predicate.sourceType = IASourceTypeColor;
    predicate.keyValue = key;
    kIAFilterKey(key);
    
    __weak typeof(self) weakSelf = self;
    [[IAThemeManager sharedManager] loadResourceWithPredicate:predicate load:^(IAThemeLoadResult *result, BOOL loadSuccess) {
        if (loadSuccess) {
            [weakSelf setTintColor:result.color];
        }
    }];
}

- (void)ia_setTitleColorWithKey:(NSString *)key forState:(UIControlState)state {
    IAThemePredicate *predicate = [[IAThemePredicate alloc] init];
    predicate.sourceType = IASourceTypeColor;
    predicate.keyValue = key;
    kIAFilterKey(key);
    
    [[IAThemeManager sharedManager] loadResourceWithPredicate:predicate load:^(IAThemeLoadResult *result, BOOL loadSuccess) {
        if (loadSuccess) {
            [self setTitleColor:result.color forState:state];
        }
    }];
}

@end
