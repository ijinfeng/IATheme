//
//  UIImageView+IATheme.m
//  IAThemeCenter
//
//  Created by Alter on 2018/4/24.
//  Copyright © 2018年 IA.Alter.com. All rights reserved.
//

#import "UIImageView+IATheme.h"
#import "IAThemeManager.h"

@implementation UIImageView (IATheme)

- (void)ia_setImageWithKey:(NSString *)key {
    IAThemePredicate *predicate = [[IAThemePredicate alloc] init];
    predicate.sourceType = IASourceTypeImage;
    predicate.keyValue = key;
    kIAFilterKey(key);
    
    __weak typeof(self) weakSelf = self;
    [[IAThemeManager sharedManager] loadResourceWithPredicate:predicate load:^(IAThemeLoadResult *result, BOOL loadSuccess) {
        if (loadSuccess) {
            weakSelf.image = result.image;
        }
    }];
}

@end
